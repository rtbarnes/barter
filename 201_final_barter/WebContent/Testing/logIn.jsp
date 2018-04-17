<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
        
        <form name="logInForm" method="post" action="validate.jsp">
            <p style="font-weight:bold;">Log In</p>
            
            <label class="logInLabel">username</label><input type="text" name="username"><br />
            
            <label class="logInLabel">password</label><input type="text" name="password"><br />
            
            <br />
            <input type="submit" value="log in"><br />
        </form>
        
        <br />
        <div name="footerContainer" id="footerContainer">
            <div class="footer" name="footer" id="footer" style="width:100%; position:fixed; bottom:2%; text-align:center;">
                <span name="copyright" id="copyright">copyright Barter 2018</span>
                <a name="contactUs" id="contactUs" href="">Contact Us</a>
            </div>
        </div>
        
    </body>
</html>