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

@WebServlet("/DisplaySingleItem")
public class DisplaySingleItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		
		Util util = new Util();
		Item item = util.getItemByItemId(itemId);
		User user = util.getUserByUserId(item.getUserId());
		
		request.setAttribute("item", item);
		request.setAttribute("seller", user);
		
		util.close();
    	String pageTo = "/itemPage.jsp?itemId="+itemId;
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
	}

}
