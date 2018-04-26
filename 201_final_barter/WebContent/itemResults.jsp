<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <head>
        <title>Search Results</title>
        <link rel="shortcut icon" type="image/x-icon" href="stock%20images/barterlogo.png"/>
        <link href="style/itemResults.css" type="text/css" rel="stylesheet" />
        <link href="style/header.css" type="text/css" rel="stylesheet" />
        <link href="style/footer.css" type="text/css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
    </head>
    
    <body>
    	<%
    		User curUser = (User) session.getAttribute("user");
    		ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
    		ArrayList<User> sellers = (ArrayList<User>) request.getAttribute("sellers");
    	%>
        
        <div name="headerContainer" id="headerContainer">
            <div class="header" name="header" id="header">
                <a href="DisplayItemResults"><img src="stock%20images/barterlogo.png" name="barterLogoThumbnail" id="barterLogoThumbnail"></a>
                
                <form name="searchForm" id="searchForm" action="./DisplayItemResults" method="GET">
                    <input name="searchBar" id="searchBar" type="text" placeholder="Search Barters"><button type="submit" id="searchButton"><i class="fas fa-search" id="searchIcon" style="font-size: 200%;"></i></button>
                </form>
                
                <% if(session.getAttribute("user") != null) { %>
                <div id="linkContainer" name="linkContainer">
                    <a class="headerButtons" name="button1" id="button1" href="postItem.html" style="display: inline;">+ Post Item</a>

                    <a class="headerButtons" name="button2" id="button2" href="./DisplayTrades" style="display: inline;">My Trades</a>

                    <a class="headerButtons" name="button3" id="button3" href="./DisplayAccountInfo" style="display: inline;">My Account</a>

                    <a class="headerButtons" name="button4" id="button4" href="./Logout" style="display: inline;">Log Out</a>
                </div>
               <% } 
               else { %>
               <div id="linkContainer" name="linkContainer">
                    <a class="headerButtons" name="button5" id="button5" href="signUp.html" style="display: inline;">Sign Up</a>

                    <a class="headerButtons" name="button6" id="button6" href="logIn.html" style="display: inline;">Log In</a>
                </div>
                <% } %>
                
            </div>
        </div>
        <br />
        
        <div name="mainContent" id="mainContent" style="margin-top:70px; margin-bottom:40px; overflow: scroll;">

            <div name="filterContainer" id="filterContainer">
                <p id="filterHeading">Search Filters</p>

                <form name="filtersForm" id="filtersForm">
                    <p style="text-align: left; margin-left: 14px;">Display By:</p>
                    <select name="displayFilter" id="displayFilter" form="filtersForm" class="filter">
                        <option value="mostRecent">Most Recent</option>
                        <option value="nearbt">Nearby</option>
                    </select>
                    
                    <br />
                    <br />
                    <br />
                    <br />

                    <p style="text-align: left; margin-left: 14px;">Category:</p>
                    <select name="categoryFilter" id="categoryFilter" form="filtersForm" class="filter">
                        <option value="any">Any</option>
                        <option value="clothing">Clothing</option>
                        <option value="services">Services</option>
                        <option value="electronics">Electronics</option>
                        <option value="sports">Sports</option>
                        <option value="tickets">Tickets</option>
                    </select>
                </form>
            </div>

            <br />
            <div name="resultsContainer" id="resultsContainer">
                <table name="resultsTable" id="resultsTable">
                    <%for (int i = 0; i < items.size(); i++) {
                    	int userID = 0;
                    	if (curUser != null) userID = curUser.getUserID();
                    	else userID = -1;
                    	if(items.get(i).getUserId() != userID && !items.get(i).isSold()) {%>
                    <tr>
                        <td>
                            <table class="itemResultTable">
                                <tr>
                                    <td class="imgContainer"><img src="<%=items.get(i).getImage() %>" name="resultThumb" id="resultThumb" class="resultThumb"></td>
                                    <td class="itemInfoContainer">
                                    	<%String itemURL = "./DisplaySingleItem?itemId=" + items.get(i).getItemId(); %>
                                        <a class="itemResultLabel" id="itemLink" name="itemLink" href="<%=itemURL%>"><%=items.get(i).getItemName() %></a>
                                        <div class="zipCodeLabel"><%=sellers.get(i).getLocation() %></div><br />
                                        <div class="itemResultDescription" name="description" id="description"><%=items.get(i).getDescription() %></div><br />
                                    </td>
                                    <td class="traderInfoContainer">
                                        <img src="<%=sellers.get(i).getProfileImage() %>" name="traderThumb" id="traderThumb">
                                        <br />
                                        <div name="traderName" id="traderName"><%=sellers.get(i).getFirstName() + " " + sellers.get(i).getLastName() %></div>
                                        <br />
                                        <!-- 
                                        <div name="traderRating" id="traderRating">Rating: X.xx</div>
                                        <br />
                                        <br />
                                        <div name="datePosted" id="datePosted">Posted X Days Ago</div>
                                         -->
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <% 		}
                    	}%>
                </table>
            </div>
        </div>
        
        <br />
        <div name="footerContainer" id="footerContainer">
            <div class="footer" name="footer" id="footer">
                <span name="copyright" id="copyright">copyright Barter 2018</span>
                <a name="contactUs" id="contactUs" href="contactUs.html">Contact Us</a>
            </div>
        </div>
    </body>
</html>