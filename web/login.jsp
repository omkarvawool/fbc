<%-- 
    Document   : login
    Created on : 30 Dec, 2017, 7:49:00 PM
    Author     : yasir
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FCLM Login</title>
        <link href="login.css" rel="stylesheet"/>
        <link href="main.css" type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <%
            HttpSession httpSession = request.getSession();
            String n=(String)httpSession.getAttribute("username");
            if(n == null)
            {
                response.sendRedirect("login.html");
            }
            else if(n.equals("admin"))
            {
                response.sendRedirect("admin.jsp");
            }
            else if(n!="admin")
            {
                response.sendRedirect("user.jsp");
            }
        %>
    </body>
    <script src="js/jquery.js"></script>
    <script src="js/login.js"></script>
</html>