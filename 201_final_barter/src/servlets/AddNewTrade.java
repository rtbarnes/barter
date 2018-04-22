package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

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
import model.Trade;
import model.User;


@WebServlet("/AddNewTrade")
public class AddNewTrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true); 
		User curUser = (User) session.getAttribute("user"); // current user is also reqUser now
		
		DBUtil dbUtil = new DBUtil();
		Util util = new Util();
		
//		int recUserId = Integer.parseInt(request.getParameter("recUserId"));
//		int reqUserId = Integer.parseInt(request.getParameter("reqUserId"));
//		int recItemId = Integer.parseInt(request.getParameter("recItemId"));
//		int reqItemId = 1;		// since the user has not chosen what to trade with, set it to one
//		Date reqDate = null;   // req_date
		
//		// for testing
		int recUserId = 8;
		int reqUserId = curUser.getUserID();
		int recItemId = 1;
		int reqItemId = 2;	   // since the user has not chosen what to trade with, set it to one
		Date reqDate = null; // req_date
		
		Trade curTrade = dbUtil.addTrade(reqUserId, recUserId, reqItemId, recItemId, reqDate, -1);
		//Trade curTrade = dbUtil.addTrade(reqUserId, recUserId, reqItemId, recItemId, reqDate, 0);
		ArrayList<Item> inventory = util.getItemsByUserId(reqUserId);
		ArrayList<Trade> tradesForUser = util.getAllTradesForUser(reqUserId);
		
		util.close();
		
		//send over what youll use 
		request.setAttribute("trade", curTrade);
		request.setAttribute("inventory", inventory);
		request.setAttribute("tradesForUser", tradesForUser);
		
		//DEBUG
//		System.out.println(curTrade.getRecItem().getItemName());
//		System.out.println(curTrade.getRecUser().getUsername());
//		System.out.println(curTrade.getReqUser().getUsername());
//		System.out.println(curTrade.getRecItem().getImage());
		
	    	String pageTo = "/tradePage.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
		
	}

}
