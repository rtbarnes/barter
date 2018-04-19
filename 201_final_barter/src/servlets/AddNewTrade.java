package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import helpers.DBUtil;
import helpers.Util;


@WebServlet("/AddNewTrade")
public class AddNewTrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true); 
		User curUser = (User) session.getAttribute("user"); // current user is also reqUser now
		
		DBUtil dbUtil = new DBUtil();
		
//		int recUserId = Integer.parseInt(request.getParameter("recUserId"));
//		int reqUserId = Integer.parseInt(request.getParameter("reqUserId"));
//		int recItemId = Integer.parseInt(request.getParameter("recItemId"));
//		int reqItemId = 1;	// since the user has not chosen what to trade with, set it to one
//		Date date = null;   // req_date
		
		int recUserId = 1;
		int reqUserId = 1;
		int recItemId = 1;
		int reqItemId = 1;	// since the user has not chosen what to trade with, set it to one
		Date reqDate = null;   // req_date
		
		Trade curTrade = dbUtil.addTrade(reqUserId, recUserId, reqItemId, recItemId, reqDate, 0);
		
		
	}

}
