package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helpers.DBUtil;

@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// this should be obtained from session 
		int userId = 1;
		String username = "test";
		String profileImage = "";
		String curPass = "123";
		
		request.setAttribute("username", username);
		request.setAttribute("profileImage", profileImage);
		
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String newPassConfirm = request.getParameter("newPassConfirm");
		
		if(!oldPass.equals(curPass)) {
			request.setAttribute("error", "Old password is not correct!");
		}
		else {
			if(!newPass.equals(newPassConfirm)){
				request.setAttribute("error", "New passwords does not match!");
			}
			else {
				DBUtil dbUtil = new DBUtil();
				dbUtil.changePassword(userId, newPassConfirm);
				request.setAttribute("success", "Change password successfully!");
			}
		}

    	String pageTo = "/changePass.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
	}

}
