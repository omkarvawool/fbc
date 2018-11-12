<%-- 
    Document   : savetickets
    Created on : Jan 22, 2018, 1:08:29 AM
    Author     : yasir
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Tickets</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String userid = request.getParameter("userid");
            String matchid = request.getParameter("matchid");
            String seats = request.getParameter("seats");
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root", "yasir123");
                
                if(connection != null)
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    
                    stmt.executeUpdate("INSERT INTO 'football'.'tickets'('userid', 'matchid', 'tickets') VALUES ('"+userid+"', '"+matchid+"', '"+seats+"');");
                }
                response.sendRedirect("reservetickets.jsp");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
    </body>
</html>
