

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AccountInfo
 */
@WebServlet("/AccountInfo")
public class AccountInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("sdfasdfasdf");
//	}
       
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// these should come from session
    	int userId = 15;
    	String imagePath = "users\\user_2.png"; // to be displayed on the left
    	

//    	To Do ------
    	DBUtil dbUtil = new DBUtil();
    	User user = dbUtil.getUserByUsername("qingsheh");

    	String firstName = user.getFirstName();
    	String lastName = user.getLastName();
    	String email = user.getEmail();
    	String location = user.getLocation();
    	String username = user.getUsername();	// also to be displayed on the left
    	
    	request.setAttribute("firstName", firstName);
    	request.setAttribute("lastName", lastName);
    	request.setAttribute("email", email);
    	request.setAttribute("location", location);
    	request.setAttribute("username", username);
    	request.setAttribute("profileImage", imagePath);
    	
    	String pageTo = "/accountInfo.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
    }

}
