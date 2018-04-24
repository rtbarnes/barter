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
import model.Trade;
import model.User;

/**
 * Servlet implementation class UpdateTradeStatus
 */
@WebServlet("/UpdateTradeStatus")
public class UpdateTradeStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ACTUAL WAY, WAITING UNTIL WE CAN ACCESS ACROSS MULTIPLE PAGES TO TEST
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("user");
		
		if (currentUser == null) {
			System.out.println("User is null, is anyone even logged in?");
			return;
		}
		
		int userID = currentUser.getUserID(); //extract ID from whoever's logged in
		
		System.out.println("Trade Page for userID = " + userID);
		
		DBUtil dbUtil = new DBUtil();
		Util util = new Util();
		
		//extract the status
		int status = Integer.parseInt(request.getParameter("status"));
		//extract the tradeID
		int tradeId = Integer.parseInt(request.getParameter("tradeId"));
		
		Trade curTrade = null;
		curTrade = dbUtil.UpdateTradeStatus(tradeId, status);
		
		request.setAttribute("trade", curTrade);
		
		String pageTo = "/GetTrade";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
		
	}

}
