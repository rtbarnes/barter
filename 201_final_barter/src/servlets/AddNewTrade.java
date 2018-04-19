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
import helpers.Util;


@WebServlet("/AddNewTrade")
public class AddNewTrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 Date date =null; 
		 
		 int status = 0;
		 
		 ArrayList<String> chat = null;
		 
		HttpSession session = request.getSession(true); 
		User ReqUser = (User) session.getAttribute("user");
		
		 int recUserId = Integer.parseInt(request.getParameter("recUserId"));
		  Util UtilObject= new Util();
		 User RecUser= UtilObject.getUserByUserId(recUserId);
		 
		 int recItemId = Integer.parseInt(request.getParameter("recUserId"));
		 Util UtilObject2= new Util();
		 Item RecItem = UtilObject2.getItemByItemId(recItemId);
		 
		 Item ReqItem= new Item(1, 1,"", "", "", 1, false);
		 
		
		
		//add this to the database which returns trade object
		Trade trade = addTrade(ReqUser.getUserID(), RecUser.getUserID(), ReqItem.getItemId(), 
				recItemId, date , status);
		
		// String tradeId= "SELECT MAX(trade_id) AS trade_id from trades;";
		// Trade trade = new Trade(tradeId, User reqUser, User recUser, Item reqItem, Item recItem, Date date, int status,
		//			ArrayList<String> chat) 
		
		doGet(request, response);
		
	}

}
