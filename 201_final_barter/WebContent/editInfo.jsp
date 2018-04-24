<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Edit Info</title>
		<link rel="shortcut icon" type="image/x-icon" href="stock%20images/barterlogo.png"/>
		<link rel="stylesheet" type="text/css" href="style/accountLeft.css"/>
        <link rel="stylesheet" type="text/css" href="style/header.css" />
        <link rel="stylesheet" type="text/css" href="style/footer.css"/>
        <link rel="stylesheet" type="text/css" href="style/postItem.css"/>
        <link rel="stylesheet" type="text/css" href="style/editInfo.css"/>
		<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
	</head>
	<body>
	<%
		User curUser = (User) session.getAttribute("user");
		String username = curUser.getUsername();
		String profileImage = curUser.getProfileImage();
		 
	%>
	<div name="headerContainer" id="headerContainer">
            <div class="header" name="header" id="header">
                <a href=""><img src="stock%20images/barterlogo.png" name="barterLogoThumbnail" id="barterLogoThumbnail"></a>
                
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
			<div id="rightContainer">
				<div id="accountInfoHeader" class="detailHeader">
					Edit Information
				</div>

				<form action="EditInfo" name="editForm" method="POST"  enctype="multipart/form-data">

					<div class="infoDiv">
						<div class="titleFont">First name: </div>
						<div class="infoFont">
							<input type="text" class="inputStyle" name="firstName" value="<%=curUser.getFirstName() %>">
						</div>
					</div>
					<div class="clear"></div>
					
					<div class="infoDiv">
						<div class="titleFont">Last name: </div>
						<div class="infoFont">
							<input type="text" class="inputStyle" name="lastName" value="<%= curUser.getLastName() %>">
						</div>
					</div>
					<div class="clear"></div>
					
					<div class="infoDiv">
						<div class="titleFont">Email: </div>
						<div class="infoFont">
							<input type="text" class="inputStyle" name="email" value="<%= curUser.getEmail() %>">
						</div>
					</div>
					<div class="clear"></div>
					
					<div class="infoDiv">
						<div class="titleFont">Location: </div>
						<div class="infoFont">
							<input type="text" class="inputStyle" name="location" value="<%= curUser.getLocation()%>">
						</div>
					</div>
					<div class="clear"></div>
					
					<div class="infoDiv">
						<div class="titleFont">Username: </div>
						<div class="infoFont">
							<div id="username"><%= curUser.getUsername() %></div>
						</div>
					</div>
					<div class="clear"></div>

					<div class="infoDiv">
						<div class="titleFont">Change Picture</div>
						<div class="buttonDiv" id="chooseBtn">
							<div class="fileInputDiv">
								<div id="buttonText" class="textStyle">Open</div>
								<input type="file" id="fileInput" name="itemImage" onchange="javascript: document.getElementById ('fileName').value = this.value.split('\\')[2];"/>
							</div>
						</div>
						<div><input type="text" name="fileName" readonly="readonly" id="fileName" class="inputStyle"></div>
					</div>

					<div class="buttonDiv">
						<button type="submit" class="textStyle" id="changeBtn">Submit</button>
					</div>

				</form>

			</div>
		</div>
	</body>
</html>