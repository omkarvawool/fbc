%-- 
    Document   : canceltickets
    Created on : Jan 22, 2018, 11:37:38 PM
    Author     : yasir
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Tickets</title>
    </head>
    <body>
        <%
            Enumeration en = request.getParameterNames();
            String n=(String)en.nextElement();
            System.out.println(n);
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root", "yasir123");
                
                if(connection != null)
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    
                    stmt.executeUpdate("DELETE FROM 'football'.'tickets' WHERE 'id'="+n);
                }
                response.sendRedirect("purchasehistory.jsp");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
    </body>
</html>
