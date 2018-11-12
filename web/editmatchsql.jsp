<%-- 
    Document   : editmatchsql
    Created on : 10 Jan, 2018, 11:27:56 PM
    Author     : yasir
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Match</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String hometeam = request.getParameter("hometeam");
            String awayteam = request.getParameter("awayteam");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String tname = request.getParameter("tourname");
            String stadium = request.getParameter("stadium");
            String score = request.getParameter("score");
            try
            {
                Class.forName("com.mysql.jdbc.driver");
                Connection connection = null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root","yasir123");
                if(connection != null)
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    stmt.executeUpdate("UPDATE 'football'.'match' SET 'hometeam'='"+hometeam+"', 'awayteam'='"+awayteam+"', 'matchdate'='"+date+"', 'matchtime'='"+time+"', 'matchscore'='"+score+"', 'tourname'='"+tname+"','stadium'='"+stadium+"' WHERE 'idmatch'='"+id+"'");
                }
                response.sendRedirect("editmatchdetails.jsp");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
    </body>
</html>
