

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;




@WebServlet("/logInValidate")
public class logInValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public logInValidate() {
        super();
       
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String un=request.getParameter("username");
		String pw=request.getParameter("password");
		Util UtilObject= new Util();
		User UserObject = UtilObject.getUserByUsername(un);
		if(UserObject== null)
		{
			//person isnt in system
		}
		else if(UserObject.getUsername()==un){
			if(UserObject.getPassword()!=pw){
				//wrong password
			}
			else{
				//success
			}
		}
		
		doGet(request, response);
	}

}
