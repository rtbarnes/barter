<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>test upload</title>
	</head>
	<body>
		<% 
			String imagePath = (String) request.getAttribute("imagePath");
		%>
		<!--<form action="upload" method="post" enctype="multipart/form-data">
		    <input type="text" name="description" />
		    <input type="file" name="file" />
		    <input type="submit" />
		</form>
		-->	
		
		<img alt="sdfs" src="<%=imagePath %>">
	</body>
</html>