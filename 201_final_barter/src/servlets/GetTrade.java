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

import com.sun.xml.internal.ws.db.glassfish.BridgeWrapper;

import helpers.DBUtil;
import helpers.Util;
import model.Trade;
import model.User;

@WebServlet("/GetTrade")
public class GetTrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User curUser = (User) session.getAttribute("user");
		Util util = new Util();
		DBUtil dbUtil = new DBUtil();
		
		int tradeId = Integer.parseInt(request.getParameter("tradeId"));
		Trade trade = util.getTradeByTradeId(tradeId);
		ArrayList<Trade> trades = util.getAllTradesForUser(curUser.getUserID());
		request.setAttribute("trade", trade);
		request.setAttribute("tradesForUser", trades);
		
		// get all messages of a trade
		ArrayList<String> messages = dbUtil.getMessagesByTradeId(tradeId);
		request.setAttribute("messages", messages);
		
		util.close();
		
	    String pageTo = "/tradePage.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
	}

}
