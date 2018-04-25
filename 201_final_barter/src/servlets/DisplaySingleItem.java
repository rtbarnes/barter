package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

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
		
		ArrayList<Item> potentialRelatedItems = new ArrayList<Item>();
		ArrayList<Item> relatedItems = new ArrayList<Item>();
		ArrayList<User> relatedSellers = new ArrayList<User>();
		
		for(Item curItem : util.getAllItems()) {
			if(curItem.getUserId() != user.getUserID() && !curItem.isSold()) potentialRelatedItems.add(curItem);
		}
		
		
		if (!potentialRelatedItems.isEmpty()){
			System.out.println("related items size: " + potentialRelatedItems.size());
			Random rand = new Random();
			int initSize = potentialRelatedItems.size();
	       	for (int i = 0; i < initSize; i++) {
	       		int choice = rand.nextInt(potentialRelatedItems.size());
	       		relatedItems.add(potentialRelatedItems.remove(choice));
	       		relatedSellers.add(util.getUserByUserId(relatedItems.get(i).getUserId()));
	       	}
		}
       	
		
		request.setAttribute("item", item);
		request.setAttribute("seller", user);
		request.setAttribute("relatedItems", relatedItems);
		request.setAttribute("relatedSellers", relatedSellers);
		
		util.close();
    	String pageTo = "/itemPage.jsp?itemId="+itemId;
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
	}

}
