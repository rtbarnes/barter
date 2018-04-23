package helpers;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import model.Trade;
import model.User;

public class DBUtil {
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	
	public DBUtil() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanTrades?user=root&password=root&useSSL=false");
//			conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanTrades?user=root&password=mysql201&useSSL=false");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLe: " + e.getMessage());
		}
	}

	public void close() {
		try {
			if(rs!=null)
				rs.close();
			if(ps!=null)
				ps.close();
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// add a new user
	public int addUser(String firstName, String lastName, String email, 
		String imagePath, String location, String username, String password) {
		
		try {
			String sql = "INSERT INTO users "
					+ "(first_name, last_name, email, profile_image, location, username, password)\r\n" + 
					"VALUES(?, ?, ?, ?, ?, ?, ?);";
			ps = conn.prepareStatement(sql);
			ps.setString(1, firstName);
			ps.setString(2, lastName);
			ps.setString(3, email);
			ps.setString(4, imagePath);
			ps.setString(5, location);
			ps.setString(6, username);
			ps.setString(7, password);
			ps.executeUpdate();	
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("sqle: " + e.getMessage());
			e.printStackTrace();
		}
		return getLatestUserId();
	}
	
	// update user image
	public void updateUserPicture(int userId, String imagePath) {
		String sql = "UPDATE users " + 
						"SET profile_image = ?" + 
						" WHERE user_id = ?;";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, imagePath);
			ps.setInt(2, userId);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql exception in updateUserPicture: " + e.getMessage()); 
		} catch(Exception exception) {
			System.out.println("exception in updateUserPicture: " + exception.getMessage());
		}
	}
	
	// return a User object if found, otherwise return null
	public User getUserByUsername(String username) {
		int userId = 0;
		String firstName = null;
		String lastName = null;
		String email = null;
		String profileImage = null;
		String location = null;
		String password = null;
		
		try {
			String sql = "SELECT user_id, first_name, last_name, email, profile_image, location, username, password " + 
							"FROM users " + 
							"WHERE username = ?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				userId = rs.getInt("user_id");
				firstName = rs.getString("first_name");
				lastName = rs.getString("last_name");
				email = rs.getString("email");
				profileImage = rs.getString("profile_image");
				location = rs.getString("location");
				password = rs.getString("password");
			}
		} catch (SQLException e) {
			System.out.println("sqle: " + e.getMessage());
			e.printStackTrace();
		}  catch (Exception e) {
			System.out.println("exception in getuserByUsername(): " + e.getMessage());
		}
		User newUser = new User(username, password, firstName, lastName, email, profileImage, location, userId);
		return newUser;
	}

	// return a User object if found, otherwise return null
	public User getUserByUserId(int queryUserId) {
		int userId = 0;
		String firstName = null;
		String lastName = null;
		String email = null;
		String profileImage = null;
		String location = null;
		String password = null;
		String username = null;
		
		try {
			String sql = "SELECT user_id, first_name, last_name, email, profile_image, location, username, password " + 
							"FROM users " + 
							"WHERE user_id = ?;";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, queryUserId);
			rs = ps.executeQuery();
			if (rs.next()) {
				userId = rs.getInt("user_id");
				firstName = rs.getString("first_name");
				lastName = rs.getString("last_name");
				email = rs.getString("email");
				profileImage = rs.getString("profile_image");
				username = rs.getString("username");
				location = rs.getString("location");
				password = rs.getString("password");
			}
		} catch (SQLException e) {
			System.out.println("sqle: " + e.getMessage());
			e.printStackTrace();
		}  catch (Exception e) {
			System.out.println("exception in getuserByUsername(): " + e.getMessage());
		}
		User newUser = new User(username, password, firstName, lastName, email, profileImage, location, userId);
		return newUser;
	}
	
	// get the user_id the most recently added user
	public int getLatestUserId() {
		int userId = 0;
		
		String sql = "SELECT MAX(user_id) AS user_id from users;";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			userId = rs.getInt("user_id");
		} catch (SQLException e) {
			System.out.println("sqle: " + e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("exception in getLatestUserId(): " + e.getMessage());
		}
		return userId;
	}

	// get the item_id the most recently added item
	public int getLatestItemId() {
		int itemId = 0;
		String sql = "SELECT MAX(item_id) AS item_id from items;";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			itemId = rs.getInt("item_id");
		} catch (SQLException e) {
			System.out.println("sqle: " + e.getMessage());
			e.printStackTrace();		
		} catch (Exception e) {
			System.out.println("exception in getLatestItemId(): " + e.getMessage());
		}
		return itemId;
	}
	
	// insert a new item into database and return the item_id of it
	public int additem(int userId, String itemName, String description, int categoryId) {
		String sql = "INSERT INTO items (user_id, item_name, description, category_id, sold)" + 
						"VALUES(?, ?, ?, ?, ?);";

		String sql_latestItem = "SELECT MAX(item_id) AS item_id from items;";
		int itemId = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, itemName);
			ps.setString(3, description);
			ps.setInt(4, categoryId);
			ps.setBoolean(5, false);
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql_latestItem);
			rs = ps.executeQuery();
			rs.next();
			itemId = rs.getInt("item_id");
			
		} catch (SQLException e) {
			System.out.println("sqle: " + e.getMessage());
			e.printStackTrace();		
		} catch (Exception e) {
			System.out.println("exception in addItem(): " + e.getMessage());
		}
		return itemId;
	}
	
	public void updateItemPicture(int itemId, String imagePath) {
		String sql = "UPDATE items " + 
				"SET image = ?" + 
				"WHERE item_id = ?;";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, imagePath);
			ps.setInt(2, itemId);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sqle: " + e.getMessage());
			e.printStackTrace();		
		}
	}
	
	public void changePassword(int userId, String newPass) {
		String sql = "UPDATE users" + 
				" SET password = ?" + 
				" WHERE user_id = ?;";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, newPass);
			ps.setInt(2, userId);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sqle in changePassword: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("exception in changePassword(): " + e.getMessage());
		}
	}
	

	public Trade UpdateLatestTrade(int reqItemId) {
		String tradeIdSql = "SELECT MAX(trade_id) AS trade_id from trades;";
		int latestTradeId = 0;
		try {
			ps = conn.prepareStatement(tradeIdSql);
			rs = ps.executeQuery();
			rs.next();
			latestTradeId = rs.getInt("trade_id");
			Date curDate = new Date(Calendar.getInstance().getTime().getTime());
			
			System.out.println("latest trade is: " + latestTradeId);
			
			String updateSql = 	"UPDATE trades" + 
								" SET req_item_id = ?" +
								", req_date = ?" + 
								", status = ?" + 
								" WHERE trade_id = ?;";
			
			ps = conn.prepareStatement(updateSql);
			ps.setInt(1, reqItemId);
			ps.setDate(2, curDate);
			ps.setInt(3, 0);
			ps.setInt(4, latestTradeId);
			ps.executeUpdate();			
			
			Util util = new Util();
			
			Trade result =  util.getTradeByTradeId(latestTradeId);
			util.close();
			return result;
		} catch (SQLException sqle) {
			System.out.println("sqle in updateLatesTrade: " + sqle.getMessage());
			
			return null;
		} catch (Exception e) {
			System.out.println("e in udpateLatesTrade: " + e.getMessage());
			
			return null;
		}
	}
	
	//NATHAN, function for UpdateTradeStatus servlet
	public Trade UpdateTradeStatus(int tradeId, int status) {
		try {
			String updateStatusSQL = "UPDATE trades" + 
									" SET status = ?" +
									" WHERE trade_id = ?;";
			ps = conn.prepareStatement(updateStatusSQL);
			ps.setInt(1, status);
			ps.setInt(2, tradeId);
			ps.executeQuery();
			
			Util util = new Util();
			
			Trade result =  util.getTradeByTradeId(tradeId);
			util.close();
			
			return result;
		} catch (SQLException sqle) {
			System.out.println("sqle in updateLatesTrade: " + sqle.getMessage());
			
			return null;
		} catch (Exception e) {
			System.out.println("e in udpateLatesTrade: " + e.getMessage());
			
			return null;
		}
		
	}
	
	// add a new trade to database 
	public Trade addTrade(int req_user_id, int rec_user_id, int req_item_id, 
			int rec_item_id, Date req_Date ,int status) {
			
		Trade curTrade = null;
		
		try {
			
			String sql = "INSERT INTO trades "
					+ "(req_user_id, rec_user_id, req_item_id, rec_item_id, req_Date, status)\r\n" + 
					"VALUES(?, ?, ?, ?, ?, ?);";
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			ps.setInt(1, req_user_id);
			ps.setInt(2, rec_user_id);
			ps.setInt(3, req_item_id);
			ps.setInt(4, rec_item_id);
			ps.setDate(5, req_Date);
			ps.setInt(6, status);
			ps.executeUpdate();	
			
			String tradeIdSql = "SELECT MAX(trade_id) AS trade_id from trades;";
			ps = conn.prepareStatement(tradeIdSql);
			rs = ps.executeQuery();
					
			rs.next();
			int tradeId = rs.getInt("trade_id");
			
			Util util = new Util();
			
			curTrade = util.getTradeByTradeId(tradeId);
					
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("sqle: " + e.getMessage());
			e.printStackTrace();
		}
		
		return curTrade;
	 }

//	TODO: getTradeByTradeId
	
//	TODO: getMessageByTradeId
//	TODO: getTradeBy 
}








