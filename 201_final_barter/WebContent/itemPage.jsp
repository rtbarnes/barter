<%@page import="model.*" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <head>
 <title>An Item</title>
        <link rel="shortcut icon" type="image/x-icon" href="stock%20images/barterlogo.png"/>
        <link href="style/header.css" type="text/css" rel="stylesheet" />
        <link href="style/footer.css" type="text/css" rel="stylesheet" />
        <link href="style/itemPage.css" type="text/css" rel="stylesheet" />
        <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
        
  </head>
  
  <body>
  	<%
       	Item item = (Item) request.getAttribute("item");
       	User seller = (User) request.getAttribute("seller");
       	ArrayList<Item> relatedItems = (ArrayList<Item>) request.getAttribute("relatedItems");
		ArrayList<User> relatedSellers = (ArrayList<User>) request.getAttribute("relatedSellers");       	
    %>
        
        
        <div name="headerContainer" id="headerContainer">
            <div class="header" name="header" id="header">
                <a href=""><img src="stock%20images/barterlogo.png" name="barterLogoThumbnail" id="barterLogoThumbnail"></a>
                
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
        </div>
        <br />
    
        <div name="mainContent" id="mainContent">
        
            <div name="backButtonContainer" id="backButtonContainer">
                <button name="backButton" id="backButton"><a href="./DisplayItemResults" style="text-decoration: none; color: white;">&lt; Back to Results</a></button>
            </div>

            <table name="singleResultContainer" id="singleResultContainer">
                <tr>
                    <td class="singleTd">
                        <div name="photosContainer">
                            <img alt="No Picture Available."  src="<%=item.getImage() %>" name="enlargedPhoto" id="enlargedPhoto">
                            <!--
                            <table><tr><td class="singleTd" style="padding-left:6px;">
                                <button class="thumbButton" onclick=""><img alt="No Picture Available."  src="stock%20images/antiquecamera.jpg" name="thumbnail" class="thumbnail" style="margin-left:4px;"></button>
                                <button class="thumbButton" onclick=""><img alt="No Picture Available."  src="stock%20images/berriesgranola.jpg" name="thumbnail" class="thumbnail"></button>
                                <button class="thumbButton" onclick=""><img alt="No Picture Available."  src="stock%20images/antiquecamera.jpg" name="thumbnail" class="thumbnail"></button>
                                <button class="thumbButton" onclick=""><img alt="No Picture Available."  src="stock%20images/berriesgranola.jpg" name="thumbnail" class="thumbnail"></button>
                                <button class="thumbButton" onclick=""><img alt="No Picture Available."  src="stock%20images/antiquecamera.jpg" name="thumbnail" class="thumbnail"></button>
                            </td></tr></table>
                            -->
                        </div>
                    </td>
                    <td class="singleTd" style="padding-top: 10px; width: 660px;">
                    	<%String tradeUrl ="AddNewTrade?recItemId="+item.getItemId()+"&recUserId="+seller.getUserID();%>
                        <div style="text-align: right; width: 640px;"><button name="tradeButton" id="tradeButton"><a href="<%=tradeUrl %>" name="tradeLink" id="tradeLink">Trade</a></button><br/></div>
                        <div style="text-align: left; width: 640px;"><span name="resultName" id="resultName"><%=item.getItemName()%></a></div>
                        <p name="description"><%=item.getDescription()%></p>
                    </td>
                    <td class="singleTd">
                        <!-- holds the window from the GMaps API -->
                        <div name="googleMapsContainer" id="googleMapsContainer"></div>
                        
                        <br />
                        <span name="zipCode" id="zipCode" style="font-weight:bold; font-size: 35px; color: #1B1464;"><%=seller.getLocation() %></span><br />
                        <span name="traderName" id="traderName" style="font-weight:bold; font-size: 20px; color: #1B1464;"><%=seller.getFirstName() + " " + seller.getLastName() %></span><br />
                        <span name="rating" id="rating" style="font-weight:bold; font-size: 15px; color: #1B1464;">Rating: X.xx</span><br />
                    </td>
                </tr>
            </table>

            <br />
            <div name="relatedContainer" id="relatedContainer" style="width: 1050px; margin-left:auto; margin-right:auto;">
                <span style="font-weight:bold; font-size: 25px; color: #1B1464;">Check Out These Other Items!</span><br />
                <table name="relatedTable" id="relatedTable">
                <% for(int j = 0; j < Math.ceil(relatedItems.size()/2.0); j++) { %>
                    <tr>
                    <% for(int i = 0; i < relatedItems.size() && i < 2; i++) { %>
                    	<% Item curItem = relatedItems.get(i + j*2); %> 
                    	<% User curUser = relatedSellers.get(i + j*2);%>
                        <td>
                            <table name="relatedItem" id="relatedItem">
                                <tr>
                                    <td><img alt="No Picture Available."  src="<%=curItem.getImage()%>" name="relatedThumb1" id="relatedThumb1" class="relatedThumbnail"></td>
                                    <td class="relatedDescription">
                                        <a name="itemName1" id="itemName1" class="itemName" href=""><%=curItem.getItemName() %></a>
                                        <p name="itemDescription1" id="itemDescription1" class="itemDescription"><%=curItem.getDescription() %></p>
                                    </td>
                                    <td class="traderInfo">
                                        <span name="zipCode1" id="zipCode1" class="relatedZips"><%=curUser.getLocation() %></span><br />
                                        <span name="traderName1" id="traderName1" class="relatedtrader"><%=curUser.getFirstName() + " " + curUser.getLastName() %></span><br />
                                        <span name="traderRating1" id="traderRating1" class="relatedtrader">X.xx</span><br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    <% } %>
                    </tr>
                <% } %>    
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
        
         <script>
            function initMap() {
                console.log("I'm ready!!!!!!!");
                
                var map = new google.maps.Map( 
                    document.querySelector("#googleMapsContainer"), 
                    { center: {lat: 34.05, lng: -118.24 }, zoom: 15, zoomControl: true }
                );

                var marker = new google.maps.Marker( {map: map} );

                window.onload = function() {

                    // var addressInput = document.querySelector("#address").value.trim();
                    var addressInput = "<%= seller.getLocation()%>";

                    var geocodeObj = new google.maps.Geocoder();
                    geocodeObj.geocode(
                        {address: addressInput}, 
                        function(results) { // This anonymous function runs when geocode() is done (aka it is done converting the address into a latlng obj)
                            console.log(results);
                            console.log("LatLng: ");
                            console.log(results[0].geometry.location.lat());
                            console.log(results[0].geometry.location.lng());


                            map.setCenter(results[0].geometry.location);
                            marker.setPosition(results[0].geometry.location);

                            marker.setAnimation(google.maps.Animation.BOUNCE);
                            
                        }
                    );
                    return false;
                }
            } // end of initMap()
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDynRsjTcTXk9FrA-SH7kJ3GO33mWdkqTg&callback=initMap"></script>
    </body>
</html>