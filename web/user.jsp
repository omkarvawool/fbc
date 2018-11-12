<%-- 
    Document   : user
    Created on : Jan 21, 2018, 5:55:23 PM
    Author     : yasir
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
        <div id="clublogo">
            <a href="index.html">
                <img src="Images/lamasia.jpg" alt="LOGO">
            </a>
        </div>
        <div id="clubname">
            <p>Football Club LaMasia</p>
        </div>
        <div class="clearfix">
            <div class="column menu">
                <ul>
                    <li><a href="user.jsp">Home</a></li>
                    <li><a href="profile.jsp">Edit Profile</a></li>
                    <li><a href="reservetickets.jsp">Buy Tickets</a></li>
                    <li><a href="purchasehistory.jsp">Purchase History</a></li>
                    <li><a href="logout.jsp">Log Out</a></li>
                </ul>
            </div>
            <div class="column content" id="data">
                <h1>
                    <%
                        HttpSession httpsession = request.getSession();
                        String n = (String)httpsession.getAttribute("username");
                        if(n == null)
                        {
                            response.sendRedirect("login.jsp");
                        }
                        else
                        {
                            session.setAttribute("user", n);
                            session.setMaxInactiveInterval(60*60*24);
                        }
                        out.println("Welcome "+n);
                    %>
                </h1>
                <br>      
            </div>
        </div>
        <div class="footer">
            <p>@yasirshaikh</p>
        </div>
    </body>
</html>
