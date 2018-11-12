<%-- 
    Document   : addmatchsql
    Created on : 11 Jan, 2018, 2:33:43 PM
    Author     : yasir
--%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Match</title>
    </head>
    <body>
        <%
            String hometeam = request.getParameter("hometeam");
            String awayteam = request.getParameter("awayteam");
            String date = request.getParameter("date");
            String time=request.getParameter("time");
            String tname = request.getParameter("tourname");
            String stadium = request.getParameter("stadium");
            String score = request.getParameter("score");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root","yasir123");
                if (connection != null)
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    stmt.executeUpdate( "INSERT INTO `football`.`match`(`hometeam`, `awayteam`, `matchdate`, `matchtime`, `matchscore`,`tournament`, `stadium`) VALUES ('"+hometeam+"', '"+awayteam+"','"+date+"', '"+time+"', '"+score+"', '"+tname+"', '"+stadium+"')" );
                }
                response.sendRedirect("addmatchdetails.jsp");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
    </body>
</html>
