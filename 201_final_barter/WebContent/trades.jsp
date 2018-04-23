<%@page import="java.util.ArrayList"%>
<%@page import="model.*" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Trades</title>
		<link rel="stylesheet" type="text/css" href="style/accountLeft.css"/>
        <link rel="stylesheet" type="text/css" href="style/header.css" />
        <link rel="stylesheet" type="text/css" href="style/footer.css"/>
        <link rel="stylesheet" type="text/css" href="style/trades.css"/>
		<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
	</head>
	<body>
	<%
		User curUser = (User) session.getAttribute("user");
		String username = curUser==null? "" : (String)curUser.getUsername();
		String profileImage = curUser==null? "" : (String) curUser.getProfileImage();
	
		//DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		ArrayList<Trade> trades = (ArrayList<Trade>) request.getAttribute("trades");	
		
	%>
	 <div name="headerContainer" id="headerContainer">
            <div class="header" name="header" id="header">
                <a href=""><img src="stock%20images/barterlogo.png" name="barterLogoThumbnail" id="barterLogoThumbnail"></a>
                
                <form name="searchForm" id="searchForm">
                    <input name="searchBar" id="searchBar" type="text" placeholder="Search Barters"><button type="submit" id="searchButton"><i class="fas fa-search" id="searchIcon" style="font-size: 200%;"></i></button>
                </form>
                
                <div id="linkContainer" name="linkContainer">
                    <a class="headerButtons" name="button1" id="button1" href="postItem.html">+ Post Item</a>

                    <a class="headerButtons" name="button2" id="button2" href="DisplayTrades">My Trades</a>

                    <a class="headerButtons" name="button3" id="button3" href="DisplayAccountInfo">My Account</a>

                    <a class="headerButtons" name="button4" id="button4" href="">Log Out</a>
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
					<%=username %>'s trades
				</div>

				<div id="tradeList">
					<!-- ====================Single trade=================== -->
					<div class="trade">
						<div class="imgDiv">
							<a href="#" class="tradeLink">
								<img src="test.jpg" class="sellerImg">
								<span class="linkSpan"></span>
							</a>
						</div>
						<div class="detailDiv">
							From: sellerName<br>
							Date: 4.13.2018<br>
							itemName1 for itemName2
						</div>
						<div class="buttonDiv" id="tradeDelete">
						<a href="#" class="anchorBtn textStyle">Delete</a>
						</div>
					</div>

					<!-- ====================Single trade=================== -->
			<% for(int i=0; i<trades.size(); i++){ %>
				<% if(curUser.getUserID()==trades.get(i).getReqUser().getUserID()){ %>
					<div class="trade">
						<div class="imgDiv">
							<a href="GetTrade?tradeId=<%=trades.get(i).getTradeId() %>" class="tradeLink">
								<img src="<%=trades.get(i).getRecUser().getProfileImage() %>" class="sellerImg">
								<span class="linkSpan"></span>
							</a>
						</div>
						<div class="detailDiv">
							To: <%= trades.get(i).getRecUser().getUsername() %><br>
							Date: <%= trades.get(i).getDate() %><br>
							<%= trades.get(i).getReqItem().getItemName() %> for <%= trades.get(i).getRecItem().getItemName() %>
						</div>
						<div class="buttonDiv" id="tradeDelete">
						<a href="DeleteTrade?tradeId=<%=trades.get(i).getTradeId() %>" class="anchorBtn textStyle">Delete</a>
						</div>
					</div>
				<% } else{ %>
					<div class="trade">
						<div class="imgDiv">
							<a href="GetTrade?tradeId=<%=trades.get(i).getTradeId() %>" class="tradeLink">
								<img src="<%=trades.get(i).getReqUser().getProfileImage() %>" class="sellerImg">
								<span class="linkSpan"></span>
							</a>
						</div>
						<div class="detailDiv">
							From: <%= trades.get(i).getReqUser().getUsername() %><br>
							Date: <%= trades.get(i).getDate() %><br>
							<%= trades.get(i).getReqItem().getItemName() %> for <%= trades.get(i).getRecItem().getItemName() %>
						</div>
						<div class="buttonDiv" id="tradeDelete">
						<a href="DeleteTrade?tradeId=<%=trades.get(i).getTradeId() %>" class="anchorBtn textStyle">Delete</a>
						</div>
					</div>
				<% } %>		
			<% } %>
				</div>
			</div>
		</div>
	</body>
</html>