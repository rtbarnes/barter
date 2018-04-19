<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <head>
        <title>Current Barters</title>
        <link href="style/header.css" type="text/css" rel="stylesheet" />
        <link href="style/footer.css" type="text/css" rel="stylesheet" />
        <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
        
        <style>
        		/*GENERAL WRAPPER CSS*/
			#mainContent {
			    margin-top:80px;
			    margin-bottom:20px;
			    width:1200px;
			    height: 650px;
			    margin-left:auto;
			    margin-right:auto;
			    background-color: #F7F7F7;
			    font-family: Avenir;
			}
			
			#tradePageHeading {
			    font-family: Avenir-Heavy;
			    font-size: 42px;
			    color: #4A4A4A;
			    text-align: center;
			    margin: auto;
			    border-bottom-style: solid;
			    border-bottom-color: #4A90E2;
			    width: 400px;
			}
			
			.innerHeading {
			    font-family: Avenir-Heavy;
			    font-size: 20px;
			    color: #1B1464;
			    width: 250px;
			    text-align: center;
			}
			
			/*BEGIN LABELS FOR THE TRADES COLUMN IN LEFT*/
			#onGoingTradesContainer {
			    width: 250px;
			    height: 581px;
			    margin-left: 10px;
			    margin-right: 5px;
			    float: left;
			    overflow: scroll;
			    background-color: white;
			}
			
			#onGoingTradesTable {
			    width: 249px;
			    background-color: white;
			    margin-left: auto;
			    margin-right: auto;
			}
			
			#tableTradeContainer {
			    width: 100%;
			    height: 500px;
			    overflow: scroll;
			}
			
			#onGoingTradeItem {
			    vertical-align: middle;
			    padding: 3px;
			}
			
			.toLabel {
			    display: inline;
			    float: left;
			    color: dodgerblue;
			}
			
			.fromLabel {
			    display: inline;
			    float: left;
			    color: firebrick;
			}
			
			.dateLabel {
			    display: inline;
			    text-align: right;
			    float: right;
			    color: black;
			}
			
			.tradeDescription {
			    color: black;
			}
			
			.tradeItemLink {
			    text-decoration: none;
			
			}
			/*END LABELS FOR THE TRADES COLUMN IN LEFT*/
			
			/*BEGIN STYLE FOR CENTER OFFER DISPLAY*/
			#offerContainer {
			    width: 660px;
			    height: 350px;
			    display: inline-block;
			    margin-left: 5px;
			}
			
			#arrow {
			    height: 50px;
			    width: 150px;
			    margin-left: 0;
			    margin-right: 0;
			}
			
			#offerContents {
			    margin-left: auto;
			    margin-right: auto;
			    margin-top: 50px;
			    width: 500px;
			    float: none;
			}
			
			#yourItemImg {
			    height: 100px;
			    width: 100px;
			    float: left;
			    display: block;
			    margin-left: 10px;
			}
			
			.itemName {
			    font-family: Avenir-Heavy;
			    color: #1B1464;
			    font-size: 22px;
			}
			
			#traderItemImg {
			    height: 100px;
			    width: 100px;
			    float: right;
			    display: block;
			    margin-right: 10px;
			}
			
			#itemTable {
			    margin-left: auto;
			    margin-right: auto;
			}
			
			#acceptRejectTable {
			    margin-left: auto;
			    margin-right: auto;
			}
			
			.tradeButton {
			    width: 100px;
			    height: 25px;
			    font-family: Avenir-Heavy;
			    font-size: 16px;
			    color: white;
			    border-radius: 8px;
			}
			
			#accept {
			    background-color: #61B400;
			    display: none;
			}
			
			#reject {
			    background-color: #AF0000;
			    display: none
			}
			
			#send {
			    background-color: #1B1464;
			    display: none;
			}
			
			.dead {
				display: none;
			    background-color: #4A4A4A;
			    cursor: not-allowed;
			    pointer-events: none;
			}
			
			.bottomButton {
				text-decoration: none;
				color: white;
			}
			/*END STYLE FOR CENTER OFFER DISPLAY*/
			
			/*BEGIN STYLE FOR MESSAGES DISPLAY*/
			#messagesContainer {
			    display: inline-block;
			    margin-top: 10px;
			    margin-left: 5px;
			    margin-bottom: 5px;
			    width: 917px;
			    height: 180px;
			    background-color: white;
			    margin-right: 10px;
			    overflow: scroll;
			}
			
			#tableContainer {
			    height: 165px;
			    width: 100%;
			    margin-bottom: 10px;
			}
			
			#messagesTable {
			    margin: 10px;
			    overflow: scroll;
			}
			
			.messageTD {
			    padding: 0;
			    height: 10px;
			}
			
			#senderName {
			    float: right;
			}
			
			#message {
			    float: left;
			}
			
			#sendMessageContainer {
			    height: 30px;
			    margin-bottom: 0;
			    margin-right: 20px;
			}
			
			#sendMessageInner {
			    float: right;
			}
			
			#sendMessageInput {
			    width: 780px;
			    border-radius: 8px;
			    border-style: solid;
			    border-color: #979797;
			    border-width: 0.5px;
			    height: 26px;
			    padding-left: 10px;
			    margin-left: 8px;
			    font-size: 14px;
			    display: inline;
			}
			
			#sendButton {
			    width: 90px;
			    height: 26px;
			    margin-right: 10px;
			    font-family: Avenir-Heavy;
			    font-size: 16px;
			    color: white;
			    background-color: #1B1464;
			    border-radius: 8px;
			    display: none;
			}
			/*END STYLE FOR MESSAGES DISPLAY*/
			
			#rightHandContainer {
			    width: 250px;
			    float: right;
			    margin-right: 10px;
			    height: 350px;
			    display: inline;
			    background-color: white;
			}
			
			#aboutMessage {
			    display: none;
			}
			
			/*BEGIN STYLE FOR trader INFO COLUMN ON RIGHT*/
			#traderInfoTable {
			    margin-left: auto;
			    margin-right: auto;
			    width: 100%;
			    display: none;
			}
			
			#traderThumb {
			    height: 100px;
			    width: 100px;
			    border-radius: 50%;
			}
			
			.traderInfoTD {
			    padding: 5px;
			    text-align: center;
			}
			
			.traderInfo {
			    font-family: Avenir-Heavy;
			    font-size: 22px;
			    color: #1B1464;
			}
			/*END STYLE FOR trader INFO COLUMN ON RIGHT*/
			
			/*BEGIN STYLE FOR INVENTORY DISPLAY*/
			#inventoryTableContainer {
			    height: 260px;
			    padding: 12px;
			    overflow: scroll;
			    font-family: Avenir;
			}
			
			#tradeSentMessage {
			    font-size: 20px;
			    display: none;
			}
			
			/*STYLING CODE ADAPTED FROM https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_custom_radio */
			/* The container */
			.container {
			    display: block;
			    position: relative;
			    padding-left: 35px;
			    margin-bottom: 12px;
			    cursor: pointer;
			    font-size: 18px;
			    -webkit-user-select: none;
			    -moz-user-select: none;
			    -ms-user-select: none;
			    user-select: none;
			}
			
			/* Hide the browser's default radio button */
			.container input {
			    position: absolute;
			    opacity: 0;
			    cursor: pointer;
			}
			
			/* Create a custom radio button */
			.checkmark {
			    position: absolute;
			    top: 0;
			    left: 0;
			    height: 23px;
			    width: 23px;
			    background-color: #eee;
			    border-radius: 50%;
			}
			
			/* On mouse-over, add a grey background color */
			.container:hover input ~ .checkmark {
			    background-color: #ccc;
			}
			
			/* When the radio button is checked, add a blue background */
			.container input:checked ~ .checkmark {
			    background-color: #1B1464;
			}
			
			/* Create the indicator (the dot/circle - hidden when not checked) */
			.checkmark:after {
			    content: "";
			    position: absolute;
			    display: none;
			}
			
			/* Show the indicator (dot/circle) when checked */
			.container input:checked ~ .checkmark:after {
			    display: block;
			}
			
			/* Style the indicator (dot/circle) */
			.container .checkmark:after {
			 	top: 8px;
				left: 7.5px;
				width: 8px;
				height: 8px;
				border-radius: 50%;
				background: white;
			}
			/*END STYLE FOR INVENTORY DISPLAY*/

        </style>
        
    </head>
    
    <body>
        
       <div name="headerContainer" id="headerContainer">
            <div class="header" name="header" id="header">
                <a href=""><img src="stock%20images/barterlogo.png" name="barterLogoThumbnail" id="barterLogoThumbnail"></a>
                
                <form name="searchForm" id="searchForm">
                    <input name="searchBar" id="searchBar" type="text" placeholder="Search Barters"><button type="submit" id="searchButton"><i class="fas fa-search" id="searchIcon" style="font-size: 200%;"></i></button>
                </form>
                
                <div id="linkContainer" name="linkContainer">
                    <a class="headerButtons" name="button1" id="button1" href="" style="display: inline;">+ Post Item</a>

                    <a class="headerButtons" name="button2" id="button2" href="" style="display: inline;">My Trades</a>

                    <a class="headerButtons" name="button3" id="button3" href="" style="display: inline;">My Account</a>

                    <a class="headerButtons" name="button4" id="button4" href="" style="display: inline;">Log Out</a>
                    
                    <a class="headerButtons" name="button5" id="button5" href="" style="display: none;">Sign Up</a>

                    <a class="headerButtons" name="button6" id="button6" href="" style="display: none;">Log In</a>
                </div>
                
            </div>
        </div>
        <br />
        
        <div name="mainContent" id="mainContent" style="margin-top:80px; margin-bottom:40px;">
        
            <p id="tradePageHeading">username's Trades</p>

            <div name="onGoingTradesContainer" id="onGoingTradesContainer">
                <p class="innerHeading">
                    Ongoing Trades
                </p>
                
                <div name="tableTradeContainer" id="tableTradeContainer">
                    <table name="onGoingTradesTable" id="onGoingTradesTable">
                        
                    <!-- IF VIEWING A TRADE "FROM" SOMEONE -->
                    <tr class="anOnGoingTrade">
                        <td name="onGoingTradeItem" id="onGoingTradeItem">
                            <a href="" class="tradeItemLink">
                                <div class="fromLabel">FROM: Trader Name</div><div class="dateLabel">XX.XX.XX</div><br />
                                <div class="tradeDescription">Item Name for Item Name</div><br />
                            </a>
                        </td>
                    </tr>
                        
                    <!-- IF VIEWING A TRADE "TO" SOMEONE -->
                    <tr class="anOnGoingTrade">
                        <td name="onGoingTradeItem" id="onGoingTradeItem">
                            <a href="" class="tradeItemLink">
                                <div class="toLabel">TO: Trader Name</div><div class="dateLabel">XX.XX.XX</div><br />
                                <div class="tradeDescription">Item Name for Item Name</div><br />
                            </a>
                        </td>
                    </tr>
                        
                        
                    <!-- add more trades to column here -->
                    
                        
                </table>
                </div>
                
            </div>

            <div name="offerContainer" id="offerContainer">
                <p class="innerHeading" style="width: 100%;">Offer</p>
                    <div name="offerContents" id="offerContents">

                        <table name="itemTable" id="itemTable">
                            <tr>
                                <td>
                                    <img alt="No Picture Available."  src="stock%20images/blackbox.png" name="yourItemImg" id="yourItemImg">
                                    <p class="itemName" style="float: left;">Your Item</p>
                                </td>
                                <td>
                                    <img alt="No Picture Available."  src="stock%20images/tradearrow.png" name="arrow" id="arrow">
                                </td>
                                <td>
                                    <img alt="No Picture Available."  src="stock%20images/blackbox.png" name="traderItemImg" id="traderItemImg">
                                    <p class="itemName" style="float: right;">Trader's Item</p>
                                </td>
                            </tr>
                        </table>
                        <br />

                        <table name="acceptRejectTable" id="acceptRejectTable">
                            <tr>
                                <!-- IF VIEWING A TRADE "FROM" SOMEONE -->
                                <td>
                                    <button class="tradeButton" id="accept" name="accept"><a href="" id="acceptButton" name="acceptButton" class="bottomButton">accept</a></button>
                                </td>
                                <td>
                                    <button class="tradeButton" id="reject" name="reject"><a href="" id="rejectButton" name="rejectButton" class="bottomButton">reject</a></button>
                                </td>
                                
                                <!-- IF VIEWING A TRADE "TO" SOMEONE -->
                                <td>
                                    <button class="tradeButton" id="send" name="send"><a href="" id="sendButton" name="sendButton" class="bottomButton">send</a></button>
                                </td>
                                
                                <!-- IF VIEWING A SENT TRADE -->
                                <td>
                                    <button class="tradeButton" id="sent" name="sent" class="dead" style="display: none;">sent</button>
                                </td>
                                
                                <!-- IF VIEWING AN ACCEPTED TRADE -->
                                <td>
                                    <button class="tradeButton" id="accepted" name="accepted" class="dead" style="display: none;">accepted</button>
                                </td>
                                
                                <!-- IF VIEWING A REJECTED TRADE-->
                                <td>
                                    <button class="tradeButton" id="rejected" name="rejected" class="dead" style="display: none;">rejected</button>
                                </td>
                                
                            </tr>
                        </table>
                        <br />
                    </div>
            </div>

            <div name="rightHandContainer" id="rightHandContainer">
                <!-- IF VIEWING A TRADE "FROM" SOMEONE -->
                <p class="innerHeading" id="aboutMessage">About the Trader</p>
                
                <!-- IF VIEWING A TRADE "TO" SOMEONE -->
                <p class="innerHeading" id="inventoryMessage">Available Inventory</p>
                
                
                <!-- IF VIEWING A TRADE "FROM" SOMEONE -->
                <table id="traderInfoTable" name="traderInfoTable">
                    <tr>
                        <td class="traderInfoTD">
                            <img alt="No Picture Available."  src="stock%20images/blackbox.png" id="traderThumb" name="traderThumb">
                        </td>
                    </tr>
                    <tr>
                        <td class="traderInfoTD">
                            <br /><span class="traderInfo">Trader Name</span><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="traderInfoTD">
                            <span class="traderInfo" style="font-size: 18px; color: #4A4A4A;">Zip Code</span><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="traderInfoTD">
                            <span class="traderInfo" style="font-size: 18px; color: #4A4A4A;">X.XX Rating</span><br />
                        </td>
                    </tr>
                </table>
                
                <!-- IF VIEWING A TRADE "TO" SOMEONE -->
                <div name="inventoryTableContainer" id="inventoryTableContainer">
                    
                    <!-- IF TRADE HAS NOT BEEN SENT ALREADY -->
                    <label class="container">Item One
                      <input type="radio" checked="checked" name="radioInventory">
                      <span class="checkmark"></span>
                    </label>
                    <label class="container">Item Two
                      <input type="radio" name="radioInventory">
                      <span class="checkmark"></span>
                    </label>
                    <label class="container">Item Three
                      <input type="radio" name="radioInventory">
                      <span class="checkmark"></span>
                    </label>
                    <label class="container">Item Four
                      <input type="radio" name="radioInventory">
                      <span class="checkmark"></span>
                    </label>
                    <label class="container">Item Five
                      <input type="radio" name="radioInventory">
                      <span class="checkmark"></span>
                    </label>
                    <label class="container">Item Six
                      <input type="radio" name="radioInventory">
                      <span class="checkmark"></span>
                    </label>
                    <label class="container">Item Seven
                      <input type="radio" name="radioInventory">
                      <span class="checkmark"></span>
                    </label>
                    <label class="container">Item Eight
                      <input type="radio" name="radioInventory">
                      <span class="checkmark"></span>
                    </label>
                    
                    <!-- populate more inventory items here -->
                    
                    <!-- IF TRADE HAS BEEN SENT ALREADY -->
                    <p name="tradeSentMessage" id="tradeSentMessage">Trade Sent.</p>
                    
                </div>

            </div>

            <br />
            <div name="messagesContainer" id="messagesContainer">
                <div name="tableContainer" id="tableContainer">
                    <table name="messagesTable" id="messagesTable">
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">traderusername:</div></td>
                            <td class="messageTD"><div name="message" id="message">oh hi mark</div></td>
                        </tr>
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">username:</div></td>
                            <td class="messageTD"><div name="message" id="message">ah jeez rick</div></td>
                        </tr>
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">traderusername:</div></td>
                            <td class="messageTD"><div name="message" id="message">oh hi mark</div></td>
                        </tr>
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">traderusername:</div></td>
                            <td class="messageTD"><div name="message" id="message">oh hi mark</div></td>
                        </tr>
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">traderusername:</div></td>
                            <td class="messageTD"><div name="message" id="message">oh hi mark</div></td>
                        </tr>
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">traderusername:</div></td>
                            <td class="messageTD"><div name="message" id="message">oh hi mark</div></td>
                        </tr>
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">traderusername:</div></td>
                            <td class="messageTD"><div name="message" id="message">oh hi mark</div></td>
                        </tr>
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">traderusername:</div></td>
                            <td class="messageTD"><div name="message" id="message">oh hi mark</div></td>
                        </tr>
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">traderusername:</div></td>
                            <td class="messageTD"><div name="message" id="message">oh hi mark</div></td>
                        </tr>
                        <tr>
                            <td class="messageTD"><div name="senderName" id="senderName">traderusername:</div></td>
                            <td class="messageTD"><div name="message" id="message">oh hi mark</div></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div name="sendMessageContainer" id="sendMessageContainer">
                    <div name="sendMessageInner" id="sendMessageInner">
                        <form name="sendMessage" id="sendMessage">
                            <input type="text" name="sendMessageInput" id="sendMessageInput" placeholder="Compose Message ...">
                            <input type="submit" value="Send" id="sendButton">
                        </form>
                    </div>
            </div>
        
        </div>
            
        <br />
        <div name="footerContainer" id="footerContainer">
            <div class="footer" name="footer" id="footer">
                <span name="copyright" id="copyright">copyright Barter 2018</span>
                <a name="contactUs" id="contactUs" href="">Contact Us</a>
            </div>
        </div>
        
    </body>
</html>