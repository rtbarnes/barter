package servlets;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helpers.Util;
import model.Item;
import model.User;

@WebServlet("/DisplayInventory")
public class DisplayInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// this should be obtained from session 
		HttpSession session = request.getSession();
		User curUser = (User) session.getAttribute("user");
		int userId = curUser.getUserID();
		String username = curUser.getUsername();
		String profileImage = curUser.getProfileImage();
		request.setAttribute("username", username);
		request.setAttribute("profileImage", profileImage);
		
		
		Util util = new Util();
		ArrayList<Item> items = util.getItemsByUserId(userId);
		
		request.setAttribute("items", items);
		
		util.close();
    	String pageTo = "/inventory.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
	}

}
