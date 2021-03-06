<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Change Password</title>
		<link rel="shortcut icon" type="image/x-icon" href="stock%20images/barterlogo.png"/>
		<link rel="stylesheet" type="text/css" href="style/accountLeft.css"/>
        <link rel="stylesheet" type="text/css" href="style/header.css" />
        <link rel="stylesheet" type="text/css" href="style/footer.css"/>
        <link rel="stylesheet" type="text/css" href="style/changePass.css"/>
		<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
	</head>
	<body>
	<%
		User curUser = (User) session.getAttribute("user");
		String username = curUser.getUsername();
		String profileImage = curUser.getProfileImage();
		
		String error = "";
		String success = "";
		
		//if (curUser != null) {
		//	username = curUser.getUsername(); 
		//	profileImage = (String) request.getAttribute("profileImage");
		
		error = request.getAttribute("error")==null? "" : (String) request.getAttribute("error");
		success = request.getAttribute("success")==null? "" : (String) request.getAttribute("success");
		//}
	%>
	 <div name="headerContainer" id="headerContainer">
            <div class="header" name="header" id="header">
                <a href="DisplayItemResults"><img src="stock%20images/barterlogo.png" name="barterLogoThumbnail" id="barterLogoThumbnail"></a>
                
                <form name="searchForm" id="searchForm" action="./DisplayItemResults" method="GET">
                    <input name="searchBar" id="searchBar" type="text" placeholder="Search Barters"><button type="submit" id="searchButton"><i class="fas fa-search" id="searchIcon" style="font-size: 200%;"></i></button>
                </form>
                
                <div id="linkContainer" name="linkContainer">
                    <a class="headerButtons" name="button1" id="button1" href="postItem.html">+ Post Item</a>

                    <a class="headerButtons" name="button2" id="button2" href="DisplayTrades">My Trades</a>

                    <a class="headerButtons" name="button3" id="button3" href="DisplayAccountInfo">My Account</a>

                    <a class="headerButtons" name="button4" id="button4" href="Logout">Log Out</a>
                </div>
                
            </div>
        </div>
		
		<div id="mainContainer"> 
			<div id="leftContainer">
				<div id="userHeader">
					<div id="imgDiv"> 
						<img src="<%=profileImage %>" id="userImg">
					</div>
					<div id="nameDiv"><%=username %>'s account</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>

				<div id="accountInfoDiv">
					<div class="headers">Account Information</div>
					<div class="buttonDiv">
						<a href="DisplayAccountInfo" class="anchorBtn textStyle">View/Edit Info</a>
					</div>
					<div class="buttonDiv">
						<a href="changePass.jsp" class="anchorBtn textStyle">Change Password</a>
					</div>
				</div>
				
				<div id="inventoryDiv">
					<div class="headers">Barter Inventory</div>
					<div class="buttonDiv">
						<a href="DisplayInventory" class="anchorBtn textStyle">View Inventory</a>
					</div>
				</div>
				
				<div id="tradesDiv">
					<div class="headers">Trades</div>
					<div class="buttonDiv">
						<a href="DisplayTrades" class="anchorBtn textStyle">View Trades</a>
					</div>
				</div>
				
				<div id="delete">
					<div class="headers">Delete</div>
					<div class="buttonDiv" id="deleteBtn">
						<a href="DeleteAccount" class="anchorBtn textStyle">Delete Account</a>
					</div>
				</div>
			</div>
			
			<!-- =================================================================== -->
			
			<div id="rightContainer">
				<div id="accountInfoHeader" class="detailHeader">
					Account Information
				</div>
				<form action="ChangePass" method="POST">
					<div class="infoDiv">
						<div class="titleFont">Old password: </div>
						<div class="infoFont">
							<input type="password" class="inputStyle" name="oldPass">
						</div>
					</div>
					<div class="clear"></div>

					<div class="infoDiv">
						<div class="titleFont">New password: </div>
						<div class="infoFont">
							<input type="password" class="inputStyle" name="newPass">
						</div>
					</div>
					<div class="clear"></div>

					<div class="infoDiv">
						<div class="titleFont">Confirm new password: </div>
						<div class="infoFont">
							<input type="password" class="inputStyle" name="newPassConfirm">
						</div>
					</div>
					<div class="clear"></div>

					<div class="buttonDiv">
						<!-- <a href="#" class="anchorBtn textStyle">Change Password</a> -->
						<button type="submit" class="textStyle" id="changeBtn">Change Password</button>
					</div>
				</form>
				
				<div id="error"><%=error %></div>
				<div id="success"><%=success %></div>
			</div>
		</div>
	</body>
</html>