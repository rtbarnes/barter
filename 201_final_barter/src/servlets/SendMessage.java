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

@WebServlet("/SendMessage")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	HttpSession session = request.getSession(true);
	    	User curUser = (User) session.getAttribute("user");
	    	int userId = curUser.getUserID();
	    	
	    	
	    	//receives the string the user has typed, prepends the username, writes to database, and redirects to same page
	    	String message = curUser.getUsername() + ": ";
	    	message += (String) request.getParameter("sendMessageInput");
	    	int tradeId = Integer.parseInt((String)request.getParameter("tradeId"));
	    	
//	    	
//	    	System.out.println(message);
//	    	System.out.println((String)request.getParameter("tradeId"));
	    	DBUtil dbUtil = new DBUtil();
	    	Util util = new Util();
	    	dbUtil.addMessageToTrade(tradeId, message);
	    	Trade trade = util.getTradeByTradeId(tradeId);
	    	dbUtil.close();
	    	util.close();
	    	
	    	request.setAttribute("trade", trade);
			
			String pageTo = "/GetTrade";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
			dispatcher.forward(request, response);
		
	}

}
