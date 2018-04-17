package helpers;
import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Item;
import model.Trade;
import model.User;

public class Util {
	
	private Connection conn;
	
	public Util() {
		conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanTrades?user=root&password=root&useSSL=false");
//			conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanTrades?user=root&password=mysql201&useSSL=false");
		} catch (ClassNotFoundException cnfe ) {
			cnfe.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	
	public User getUserByUsername(String username) {
		
		User user = null;
		
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT u.first_name, u.last_name, u.email, u.profile_image, u.location, u.username, u.password, u.user_id" + 
					" FROM Users u " +
					" WHERE username=?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			
			if (!rs.next()) { //check for empty result set
				return user;
			}
			
			//result set should only ever have one row
			user = new User(rs.getString("username"), rs.getString("password"),
					rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"),
					rs.getString("profile_image"), rs.getString("location"), rs.getInt("user_id"));

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (st != null) st.close();
				
			} catch (SQLException sqle) {
				System.out.println("closing: " + sqle.getMessage());
			}
		}
		return user;
	}
	
	public User getUserByUserId(int user_id) {
		
		User user = null;
		
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT u.first_name, u.last_name, u.email, u.profile_image, u.location, u.username, u.password, u.user_id" + 
					" FROM Users u " +
					" WHERE user_id=?");
			ps.setInt(1, user_id);
			rs = ps.executeQuery();
			
			if (!rs.next()) { //check for empty result set
				return user;
			}
			
			//result set should only ever have one row
			user = new User(rs.getString("username"), rs.getString("password"),
					rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"),
					rs.getString("profile_image"), rs.getString("location"), rs.getInt("user_id"));

		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (st != null) st.close();
				
			} catch (SQLException sqle) {
				System.out.println("closing: " + sqle.getMessage());
			}
		}
		return user;
	}
	
	public ArrayList<Item> getAllItems() {
		
		ArrayList<Item> items = new ArrayList<Item>();
		
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT i.item_id, i.user_id, i.item_name, i.description, i.image, i.category_id, i.sold" + 
					" FROM Items i ");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Item newItem = new Item(rs.getInt("item_id"), rs.getInt("i.user_id"), rs.getString("item_name"),
						rs.getString("description"), rs.getString("image"), rs.getInt("category_id"), rs.getBoolean("sold"));
				items.add(newItem);
			}
			return items;
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (st != null) st.close();
				
			} catch (SQLException sqle) {
				System.out.println("closing: " + sqle.getMessage());
			}
			
		}
		return items;
	}

	public ArrayList<Item> getItemsByUserId(int userId) {
			
			ArrayList<Item> items = new ArrayList<Item>();
			
			Statement st = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				st = conn.createStatement();
				ps = conn.prepareStatement(" SELECT item_id, user_id, item_name, description, image, category_id, sold" + 
						" FROM Items "
						+ "WHERE user_id = ?");
				ps.setInt(1, userId);
				rs = ps.executeQuery();
				
				while(rs.next()) {
					Item newItem = new Item(rs.getInt("item_id"), rs.getInt("user_id"), rs.getString("item_name"),
							rs.getString("description"), rs.getString("image"), rs.getInt("category_id"), rs.getBoolean("sold"));
					items.add(newItem);
				}
				return items;
				
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if (st != null) st.close();
					
				} catch (SQLException sqle) {
					System.out.println("closing: " + sqle.getMessage());
				}
				
			}
			return items;
		}

	public Item getItemByItemId(int item_id) {
		Item item = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT i.item_id, i.user_id, i.item_name, i.description, i.image, i.category_id, i.sold" + 
					" FROM Items i "+
				" WHERE item_id=?");
			ps.setInt(1, item_id);
			
			rs = ps.executeQuery();
			
			if (!rs.next()) { //check for empty result set
				return item;
			}
			
			item = new Item(rs.getInt("item_id"), rs.getInt("i.user_id"), rs.getString("item_name"),
								rs.getString("description"), rs.getString("image"), 
								rs.getInt("category_id"), rs.getBoolean("sold"));
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (st != null) st.close();
				
			} catch (SQLException sqle) {
				System.out.println("closing: " + sqle.getMessage());
			}
			
		}
		
		return item;
	}
	
	public ArrayList<String> getMessagesByTradeId(int trade_id) {
		ArrayList<String> messages = new ArrayList<String>();
		
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT msg_text" + 
					" FROM messages "
					+ "WHERE trade_id = ?");
			
			ps.setInt(1, trade_id);
			
			rs = ps.executeQuery();
			
			if (!rs.next()) { //error check for null
				return messages;
			}
			
			while(rs.next()) {
				Array SQLArray = rs.getArray(1); //extract the results as an array based on column 1 of the resultset
				messages = (ArrayList<String>) SQLArray; //convert to arraylist
			}
			
			//DEBUG
			System.out.println("Here's what messages were found: ");
			for (int i = 0; i < messages.size(); i++) {
				System.out.println(messages.get(i));
			}
			
			return messages;
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (st != null) st.close();
				
			} catch (SQLException sqle) {
				System.out.println("closing: " + sqle.getMessage());
			}
		}
		
		//if all else fails, lol
		return messages;
	}
	
	public Trade getTradeByTradeId(int trade_id) {
		Trade trade = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT t.trade_id, t.req_user_id, t.rec_user_id, t.req_item_id, t.rec_item_id, t.req_date, t.status" + 
					" FROM trades t "+
				" WHERE trade_id=?");
			ps.setInt(1, trade_id);
			rs = ps.executeQuery();
			
			if (!rs.next()) { //check for empty result set
				return trade;
			}
			
			trade = new Trade(rs.getInt("trade_id"), this.getUserByUserId(rs.getInt("req_user_id")), this.getUserByUserId(rs.getInt("rec_user_id")),
					this.getItemByItemId(rs.getInt("req_item_id")), this.getItemByItemId(rs.getInt("rec_item_id")), 
					rs.getDate("req_date"), rs.getInt("status"), this.getMessagesByTradeId(trade_id));
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (st != null) st.close();
				
			} catch (SQLException sqle) {
				System.out.println("closing: " + sqle.getMessage());
			}
			
		}
		
		return trade;
	}

	//TODO: test this function
	public ArrayList<Trade> getTradesByReqId(int req_user_id) {
		
		ArrayList<Trade> trades = new ArrayList<Trade>();
		
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT t.trade_id, t.req_user_id, t.rec_user_id, t.req_item_id, t.rec_item_id, t.req_date, t.status, t.chat_id" +
					 " FROM Trades t " + 
					" WHERE req_user_id=?"); 
			ps.setInt(1, req_user_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int tradeId = rs.getInt("trade_id"); //extract this separately because it's used twice in constructor (don't wanna double extract via rs.get)
				
				Trade newTrade = new Trade(tradeId, this.getUserByUserId(rs.getInt("req_user_id")), this.getUserByUserId(rs.getInt("rec_user_id")),
						this.getItemByItemId(rs.getInt("req_item_id")), this.getItemByItemId(rs.getInt("rec_item_id")), 
						rs.getDate("req_date"), rs.getInt("status"), this.getMessagesByTradeId(tradeId));
				trades.add(newTrade);
			}
			
			return trades;
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (st != null) st.close();
				
			} catch (SQLException sqle) {
				System.out.println("closing: " + sqle.getMessage());
			}
		}
		
		return trades;
	}
	
	//TODO: test this function
	public ArrayList<Trade> getTradesByRecId(int rec_user_id) {
		
		ArrayList<Trade> trades = new ArrayList<Trade>();
		
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT t.trade_id, t.req_user_id, t.rec_user_id, t.req_item_id, t.rec_item_id, t.req_date, t.status, t.chat_id" +
					 " FROM Trades t " + 
					" WHERE rec_user_id=?"); 
			ps.setInt(1, rec_user_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int tradeId = rs.getInt("trade_id"); //extract this separately because it's used twice in constructor (don't wanna double extract via rs.get)
				
				Trade newTrade = new Trade(tradeId, this.getUserByUserId(rs.getInt("req_user_id")), this.getUserByUserId(rs.getInt("rec_user_id")),
						this.getItemByItemId(rs.getInt("req_item_id")), this.getItemByItemId(rs.getInt("rec_item_id")), 
						rs.getDate("req_date"), rs.getInt("status"), this.getMessagesByTradeId(tradeId));
				
				trades.add(newTrade);
			}
			return trades;
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (st != null) st.close();
				
			} catch (SQLException sqle) {
				System.out.println("closing: " + sqle.getMessage());
			}
			
		}
		return trades;
	}

	//TODO: test this function
	public ArrayList<Trade> getAllTradesForUser(int user_id) {
		
		ArrayList<Trade> trades = new ArrayList<Trade>();
		
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT t.trade_id, t.req_user_id, t.rec_user_id, t.req_item_id, t.rec_item_id, t.req_date, t.status, t.chat_id" +
					 " FROM Trades t " + 
					" WHERE rec_user_id=? OR req_user_id=?"); 
			ps.setInt(1, user_id);
			ps.setInt(2, user_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int tradeId = rs.getInt("trade_id"); //extract this separately because it's used twice in constructor (don't wanna double extract via rs.get)
				
				Trade newTrade = new Trade(tradeId, this.getUserByUserId(rs.getInt("req_user_id")), this.getUserByUserId(rs.getInt("rec_user_id")),
						this.getItemByItemId(rs.getInt("req_item_id")), this.getItemByItemId(rs.getInt("rec_item_id")), 
						rs.getDate("req_date"), rs.getInt("status"), this.getMessagesByTradeId(tradeId));
				
				trades.add(newTrade);
				
				//DEBUG
				newTrade.printTrade();
			}
			
			return trades;
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (st != null) st.close();
				
			} catch (SQLException sqle) {
				System.out.println("closing: " + sqle.getMessage());
			}
			
		}
		return trades;
	}
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
