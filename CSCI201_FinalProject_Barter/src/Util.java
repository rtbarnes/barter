import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Util {
	
	private Connection conn;
	
	public Util() {
		conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/studentGrades?user=root&password=root&useSSL=false");
		} catch (ClassNotFoundException cnfe ) {
			System.out.println("cnfe: " + cnfe.getMessage());
		} catch (SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		}
	}
	
	public User getUserByUsername(String username) {
		
		User user = null;
		
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			ps = conn.prepareStatement(" SELECT u.first_name, u.last_name, u.email, u.profile_image, u.location, u.username, u.password" + 
					" FROM User u " +
					" WHERE username=?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			
			//ResultSet should only ever have one row
			user = new User(rs.getString("username"), rs.getString("password"),
					rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"),
					rs.getString("profile_image"), rs.getString("location"));

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
}
