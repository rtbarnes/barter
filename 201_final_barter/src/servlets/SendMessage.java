package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

@WebServlet("/SendMessage")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	HttpSession session = request.getSession(true);
	    	User curUser = (User) session.getAttribute("user");
	    	int userId = curUser.getUserID();
	    	
	    	//receives the string the user has typed, prepends the username, writes to database, and redirects to same page
	    	String message = curUser.getUsername() + ": ";
	    	message += (String) request.getAttribute("sendMessageInput");
	    	
	    	
	    	
		
		
	}

}
