package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import helpers.Util;
import model.Trade;
import model.User;

@WebServlet("/DisplayTrades")
public class DisplayTrades extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(true);
    	User curUser = (User) session.getAttribute("User");
    	int curUserId = curUser.getUserID();
    	
    	Util util = new Util();
    	ArrayList<Trade> trades = util.getAllTradesForUser(curUserId);
    	for(Trade trade : trades) {
    		//System.out.println(trade.get);
    	}
    }

}
