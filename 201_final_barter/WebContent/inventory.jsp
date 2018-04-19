<%@page import="java.util.ArrayList"%>
<%@page import="model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Inventory</title>
		<link rel="stylesheet" type="text/css" href="style/accountLeft.css"/>
        <link rel="stylesheet" type="text/css" href="style/header.css" />
        <link rel="sty	lesheet" type="text/css" href="style/footer.css"/>
        <link rel="stylesheet" type="text/css" href="style/inventory.css"/>
		<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
	</head>
	<body>
	<%
		User curUser = (User) session.getAttribute("user");
		String username = curUser.getUsername();
		String profileImage = (String) request.getAttribute("profileImage");
		
		ArrayList<Item> items = request.getAttribute("items")==null? new ArrayList<Item>() : (ArrayList<Item>) request.getAttribute("items"); 
	%>
	 <div name="headerContainer" id="headerContainer">
            <div class="header" name="header" id="header">
                <a href=""><img src="stock%20images/barterlogo.png" name="barterLogoThumbnail" id="barterLogoThumbnail"></a>
                
                <form name="searchForm" id="searchForm">
                    <input name="searchBar" id="searchBar" type="text" placeholder="Search Barters"><button type="submit" id="searchButton"><i class="fas fa-search" id="searchIcon" style="font-size: 200%;"></i></button>
                </form>
                
                <div id="linkContainer" name="linkContainer">
                    <a class="headerButtons" name="button1" id="button1" href="" style="display: inline;">+ Post Item</a>

                    <a class="headerButtons" name="button2" id="button2" href="trades.jsp" style="display: inline;">My Trades</a>

                    <a class="headerButtons" name="button3" id="button3" href="accountInfo.jsp" style="display: inline;">My Account</a>

                    <a class="headerButtons" name="button4" id="button4" href="" style="display: inline;">Log Out</a>
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
					<%=username %>'s Inventory
				</div>
				<!-- ========================================================= -->
				<div id="inventoryList">


					<!-- =============A single item=========================== -->
					<div class="itemDiv">
						<div class="editLink">
							<a href="#">Remove</a> 
						</div>
						<div class="imgDiv">
							<img src="test.jpg" class="itemImg">
						</div>
						<div class="detailDiv">
							<a href="#" class="nameLink">Item Name</a>
							<div class="description">sadfasdf saf sadf asdfasdf sdf asdf asdf asdf asdfas df asdf asdf asdfasdfasfas fasf asdf asd fasd asdf das fasdfasdfsdf sdf asdfasdf asdf asdf asdfasd fas df asf asdfasdfsdaf asdf fas fasf asdf asd fasd asdf das fasdfasdfsdf sdf asdfasdf asdf asdf asdfasfs fsadfasdf asdf asd sdfsdf asdfsdfhthis this sos eonr  asf a asd sad.....</div>
						</div>
					</div>
					<!-- ==============A single item========================== -->
					<%for(int i=0; i<items.size(); i++){ %>
					<div class="itemDiv">
						<div class="editLink">
							<a href="RemoveItem?itemId=<%=items.get(i).getItemId() %>">Remove</a> 
						</div>
						<div class="imgDiv">
							<img src="<%=items.get(i).getImage() %>" class="itemImg">
						</div>
						<div class="detailDiv">
							<a href="#" class="nameLink"><%=items.get(i).getItemName() %></a>
							<div class="description"><%=items.get(i).getDescription() %></div>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</body>
</html>