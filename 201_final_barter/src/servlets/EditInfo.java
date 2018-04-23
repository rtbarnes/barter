package servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import helpers.DBUtil;
import model.User;

/**
 * Servlet implementation class EditInfo
 */
@WebServlet("/EditInfo")
public class EditInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// this should be obtained from session 
		HttpSession session = request.getSession();
		User curUser = (User) session.getAttribute("user");
		int userId = curUser.getUserID();
		DBUtil dbUtil = new DBUtil();
		
		
		String firstName = "";
		String lastName = "";
		String email = "";
		String location = "";
		String username = "";
		String password = "";
		FileItem imageItem = null;
		
		if (!ServletFileUpload.isMultipartContent(request)) {
            System.out.println("Error: form must be set as enctype=multipart/form-data");
            return;
        }
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    
	    try {

			List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
			for(FileItem item : items) {
				if(item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString();
					if(name.equals("firstName")) {
						firstName = value;
					} else if(name.equals("lastName")) {
						lastName = value;
					} else if(name.equals("email")) {
						email = value;
					} else if(name.equals("location")) {
						location = value;
					} 
				    System.out.println(name + "---" + value);
				}
				else {
					imageItem = item;
				}
			}
			if(imageItem.getName() != null && !imageItem.getName().isEmpty()) {
				System.out.println("overwrite profile image");
				ServletContext context = getServletContext();
				String fullPath = context.getRealPath("/users");
				File uploadDir = new File(fullPath + "/user_" + userId + ".png");
				imageItem.write(uploadDir);
				System.out.println("overwrite completed");
			}
			else {
				System.out.println("profile picture not changed");
			}
			dbUtil.editUserInfo(userId, firstName, lastName, email, location);
			dbUtil.close();
			
	    } catch (FileUploadException e) {
			System.out.println("Upload fail: " + e.getMessage());
		} catch (Exception e) {
			System.out.println("exception: " + e.getMessage());
		}

	    String pageTo = "/DisplayAccountInfo";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pageTo);
		dispatcher.forward(request, response);
	}


}
