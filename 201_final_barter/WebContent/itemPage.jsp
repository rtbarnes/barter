<%@page import="model.*" %>
<%@page import="java.text.DateFormat" %>
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
        
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDynRsjTcTXk9FrA-SH7kJ3GO33mWdkqTg&callback=initMap">
    </script>
    
          <script>
      function initMap() {
        var uluru = {lat: 34.0224, lng: -118.2851};
        var map = new google.maps.Map(document.getElementById('googleMapsContainer'), {
          zoom: 13,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
 <style>
     #googleMapsContainer{
      height: 180px;
      width: 180px;
     }
  </style>
  </head>
  
  <body>
   <%
        	Item item = (Item) request.getAttribute("item");
        	User seller = (User) request.getAttribute("seller");
        	
        %>
        
        
        <div name="headerContainer" id="headerContainer">
            <div class="header" name="header" id="header">
                <a href=""><img src="stock%20images/barterlogo.png" name="barterLogoThumbnail" id="barterLogoThumbnail"></a>
                
                <form name="searchForm" id="searchForm" action="./DisplayItemResults" method="GET">
                    <input name="searchBar" id="searchBar" type="text" placeholder="Search Barters"><button type="submit" id="searchButton"><i class="fas fa-search" id="searchIcon" style="font-size: 200%;"></i></button>
                </form>
                
                <div id="linkContainer" name="linkContainer">
                    <a class="headerButtons" name="button1" id="button1" href="postItem.html" style="display: inline;">+ Post Item</a>

                    <a class="headerButtons" name="button2" id="button2" href="./DisplayTrades" style="display: inline;">My Trades</a>

                    <a class="headerButtons" name="button3" id="button3" href="./DisplayAccountInfo" style="display: inline;">My Account</a>

                    <a class="headerButtons" name="button4" id="button4" href="./Logout" style="display: inline;">Log Out</a>
                </div>
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
<<<<<<< HEAD
                        <!-- temporary image -->
                        <!-- <img alt="No Picture Available."  src="stock%20images/mapstand-in.png" style="height:180px; width: 180px;"> -->
=======
                        <!-- temporary image
                        <img alt="No Picture Available."  src="stock%20images/mapstand-in.png" style="height:180px; width: 180px;"> --> 
>>>>>>> bbdf5ab22532c363ce22ba2e3b677caf40848b98
                        
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
                    <tr>
                        <td>
                            <table name="relatedItem" id="relatedItem">
                                <tr>
                                    <td><img alt="No Picture Available."  src="" name="relatedThumb1" id="relatedThumb1" class="relatedThumbnail"></td>
                                    <td class="relatedDescription">
                                        <a name="itemName1" id="itemName1" class="itemName" href="">Item Name</a>
                                        <p name="itemDescription1" id="itemDescription1" class="itemDescription">Williamsburg pour-over jean shorts, organic lumbersexual blue bottle keytar microdosing umami vegan single-origin coffee aesthetic mlkshk vape fingerstache.</p>
                                    </td>
                                    <td class="traderInfo">
                                        <span name="zipCode1" id="zipCode1" class="relatedZips">XXXXX</span><br />
                                        <span name="traderName1" id="traderName1" class="relatedtrader">Trader Name</span><br />
                                        <span name="traderRating1" id="traderRating1" class="relatedtrader">X.xx</span><br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table name="relatedItem" id="relatedItem">
                                <tr>
                                    <td><img alt="No Picture Available."  src="" name="relatedThumb2" id="relatedThumb2" class="relatedThumbnail"></td>
                                    <td class="relatedDescription">
                                        <a name="itemName2" id="itemName2" class="itemName" href="">Item Name</a>
                                        <p name="itemDescription2" id="itemDescription2" class="itemDescription">Williamsburg pour-over jean shorts, organic lumbersexual blue bottle keytar microdosing umami vegan single-origin coffee aesthetic mlkshk vape fingerstache.</p>
                                    </td>
                                    <td class="traderInfo">
                                        <span name="zipCode2" id="zipCode2" class="relatedZips">XXXXX</span><br />
                                        <span name="traderName2" id="traderName2" class="relatedtrader">Trader Name</span><br />
                                        <span name="traderRating2" id="traderRating2" class="relatedtrader">X.xx</span><br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table name="relatedItem" id="relatedItem">
                                <tr>
                                    <td><img alt="No Picture Available."  src="" name="relatedThumb3" id="relatedThumb3" class="relatedThumbnail"></td>
                                    <td class="relatedDescription">
                                        <a name="itemName3" id="itemName3" class="itemName" href="">Item Name</a>
                                        <p name="itemDescription3" id="itemDescription3" class="itemDescription">Williamsburg pour-over jean shorts, organic lumbersexual blue bottle keytar microdosing umami vegan single-origin coffee aesthetic mlkshk vape fingerstache.</p>
                                    </td>
                                    <td class="traderInfo">
                                        <span name="zipCode3" id="zipCode3" class="relatedZips">XXXXX</span><br />
                                        <span name="traderName3" id="traderName3" class="relatedtrader">Trader Name</span><br />
                                        <span name="traderRating3" id="traderRating3" class="relatedtrader">X.xx</span><br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table name="relatedItem" id="relatedItem">
                                <tr>
                                    <td><img alt="No Picture Available."  src="" name="relatedThumb4" id="relatedThumb4" class="relatedThumbnail"></td>
                                    <td class="relatedDescription">
                                        <a name="itemName4" id="itemName4" class="itemName" href="">Item Name</a>
                                        <p name="itemDescription4" id="itemDescription4" class="itemDescription">Williamsburg pour-over jean shorts, organic lumbersexual blue bottle keytar microdosing umami vegan single-origin coffee aesthetic mlkshk vape fingerstache.</p>
                                    </td>
                                    <td class="traderInfo">
                                        <span name="zipCode4" id="zipCode4" class="relatedZips">XXXXX</span><br />
                                        <span name="traderName4" id="traderName4" class="relatedtrader">Trader Name</span><br />
                                        <span name="traderRating4" id="traderRating4" class="relatedtrader">X.xx</span><br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        
        </div>
            
        <br />
        <div name="footerContainer" id="footerContainer">
            <div class="footer" name="footer" id="footer">
                <span name="copyright" id="copyright">copyright Barter 2018</span>
                <a name="contactUs" id="contactUs" href="">Contact Us</a>
            </div>
        </div>
<<<<<<< HEAD
        
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
=======
  
  </body>
>>>>>>> bbdf5ab22532c363ce22ba2e3b677caf40848b98
</html>