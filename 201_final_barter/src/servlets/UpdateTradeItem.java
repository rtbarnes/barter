package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helpers.DBUtil;
import helpers.Util;
import model.Item;
import model.User;

@WebServlet("/UpdateTradeItem")
public class UpdateTradeItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateTradeItem() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ACTUAL WAY, WAITING UNTIL WE CAN ACCESS ACROSS MULTIPLE PAGES TO TEST
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("user");
		
		if (currentUser == null) {
			System.out.println("User is null, is anyone even logged in?");
			return;
		}
		
		int userID = currentUser.getUserID(); //extract ID from whoever's logged in
		
		System.out.println("Trade Page for userID = "+userID);
		
		DBUtil dbUtil = new DBUtil();
		Util util = new Util();
		
		//extract tradeID and itemID, it's a GET request so get from parameters
		int curTradeId = Integer.parseInt(request.getParameter("tradeId"));
		//NOTE: you are updating "req" item because this is the "req" user
		int reqItemId = Integer.parseInt(request.getParameter("itemId"));

		//update the trade, get the item object for that ID, get the trade object for that ID, call the setter for the trade
		util.getTradeByTradeId(curTradeId).setReqItem(util.getItemByItemId(reqItemId));
		
		String pageTo = "/tradePage.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
		
	}

}




