<%-- 
    Document   : logout
    Created on : Jan 22, 2018, 11:52:12 PM
    Author     : yasir
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log Out</title>
    </head>
    <body>
        <%
            HttpSession httpsession = request.getSession();
            String n=(String)httpsession.getAttribute("username");
            if(n == null)
            {
                response.sendRedirect("login.jsp");
            }
            else
            {
                session.setAttribute("user", n);
                session.setMaxInactiveInterval(60*60*24);
            }
            httpsession.invalidate();
            response.sendRedirect("index.html");
        %>
    </body>
</html>
