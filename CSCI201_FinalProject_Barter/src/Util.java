import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Util {
	
	private Connection conn;
	
	public Util() {
		conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/trojantrades?user=root&password=root&useSSL=false");
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
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
