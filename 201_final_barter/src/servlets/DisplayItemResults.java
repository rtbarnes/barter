package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helpers.Util;
import model.Item;
import model.User;

@WebServlet("/DisplayItemResults")
public class DisplayItemResults extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util util = new Util();
    	ArrayList<Item> items = util.getAllItems();
    	
    	ArrayList<User> users = new ArrayList<User>();
    	for (Item item : items) {
    		users.add(util.getUserByUserId(item.getUserId()));
    	}
    	
    	request.setAttribute("items", items);
    	request.setAttribute("sellers", users);
    	
    	util.close();
    	String pageTo = "/itemResults.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
	}

}
