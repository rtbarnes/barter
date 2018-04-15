

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageTo= null;
		PrintWriter out = response.getWriter(); 
		String un=request.getParameter("username");
		String pw=request.getParameter("password");
			Util UtilObject= new Util();
			User UserObject = UtilObject.getUserByUsername(un);
			if(UserObject== null)
			{
				//person isnt in system
				String message = "Please sign up first!";
				request.setAttribute("message", message);
				pageTo = "/LogIn.jsp";
				
			}
			else if(UserObject.getUsername()==un){
				if(UserObject.getPassword()!=pw){
					//wrong password
					String message = "Please try again!";
					request.setAttribute("message", message);
					pageTo = "/LogIn.jsp";
				}
				else{
					pageTo = "/ItemResults.jsp";
				}
			}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
		
	}

}
