<%-- 
    Document   : editmatchdetails
    Created on : 31 Dec, 2017, 12:57:43 PM
    Author     : yasir
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Match Details</title>
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
        <% HttpSession httpsession = request.getSession();
           String n = (String)httpsession.getAttribute("username");
           if(n==null)
           {
               response.sendRedirect("login.jsp");
           }
           else if(n.equals("admin"))
           {
               session.setAttribute("user", n);
               session.setMaxInactiveInterval(60*60*24);
           }
           else
           {
               response.sendRedirect("login.jsp");
           }
        %>
        <div id="clublogo">
            <a href ="index.html">
                <img src="Images\lamasia.jpg" alt="LOGO">
            </a>
        </div>
        <div id="clubname">
            <p>Football Club La Masia</p>
        </div>
            <div class="clearfix">
            <div class="column menu">
                <ul>
                    <li><a href="admin.jsp">Admin Home</a></li>
                    <li><a href="addmatchdetails.jsp">Add Match Details</a></li>
                    <li><a href="editmatchdetails.jsp">Edit Match Details</a></li>
                    <li><a href="deletematch.jsp">Delete Match</a></li>
                    <li><a href="addplayer.jsp">Add Players</a></li>
                    <li><a href="playersdetails.jsp">Edit Players Details</a></li>
                    <li><a href="deleteplayers.jsp">Delete Players</a></li>
                    <li><a href="addstoreitems.jsp">Add Store Items</a></li>
                    <li><a href="storeitems.jsp">Edit Store Items</a></li>
                    <li><a href="deletestoreitems.jsp">Delete Store Items</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </div>
            <% int id=0;
               String hometeam = "";
               String awayteam = "";
               String date = "";
               String time = "";
               String tname = "";
               String stadium = "";
               String score = "";
               try
               {
                   Class.forName("com.mysql.jbc.driver");
                   Connection connection = null;
                   ResultSet rs = null;
                   connection = DriverManager.getConnection("jdbc://localhost:3306/football", "root", "yasir123");
                   if (connection != null)
                   {
                       Statement stmt = null;
                       stmt = connection.createStatement();
                       rs = stmt.executeQuery("select * from football. 'match';");
                   }
            %>
        <div class="column content" id="data">
            <h1>Match Details</h1>
            <form action ="editmatch.jsp" method="post">
                <table border=1>
                    <tr>
                        <td>Home Team</td>
                        <td>Away Team</td>
                        <td>Date</td>
                        <td>Time</td>
                        <td>Score</td>
                        <td>Tournament</td>
                        <td>Stadium</td>
                    </tr>
                    <%
                        while(rs.next())
                        {
                            id = rs.getInt(1);
                            hometeam = rs.getString(2);
                            awayteam = rs.getString(3);
                            date = rs.getString(4);
                            time = rs.getString(5);
                            score = rs.getString(6);
                            tname = rs.getString(7);
                            stadium = rs.getString(8);
                            out.println("<tr>");
                            out.println("<td>"+hometeam+"</td>");
                            out.println("<td>"+awayteam+"</td>");
                            out.println("<td>"+date+"</td>");
                            out.println("<td>"+time+"</td>");
                            out.println("<td>"+score+"</td>");
                            out.println("<td>"+tname+"</td>");
                            out.println("<td>"+stadium+"</td>");
                            out.println("<td><input type='submit' value='Edit' name='"+id+"'></td>");
                            out.println("</tr>");
                        }
                    }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
                    %>
                </table>
            </form>
        </div>
    </body>
</html>
