<%-- 
    Document   : reservetickets
    Created on : Jan 21, 2018, 10:44:20 PM
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
        <title>Reserve Tickets</title>
        <link rel="stylesheet" herf="admin.css">
    </head>
    <body>
        <%
            HttpSession httpsession = request.getSession();
            String n=(String )httpsession.getAttribute("username");
            if(n == null)
            {
                response.sendRedirect("login.jsp");
            }
            else
            {
                session.setAttribute("user", n);
                session.setMaxInactiveInterval(60*60*24);
            }
        %>
        <div id="clublogo">
            <a href="index.html">
                <img src="Images/lamasia.jpg" alt="LOGO">
            </a>
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
            <%
                int id=0;
                String hometeam = "";
                String awayteam = "";
                String date = "";
                String time = "";
                String tname = "";
                String stadium = "";
                String score = "";
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = null;
                    ResultSet rs=null;
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root", "yasir123");
                    
                    if(connection != null)
                    {
                        Statement stmt = null;
                        stmt = connection.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM football.'match';");
                    }
            %>
            <div class="column content" id="data">
                <h1>Match Details</h1>
                <form action ="tickets.jsp" method="post">
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
                                out.print("<tr>");
                                out.print("<td>"+hometeam+"</td>");
                                out.print("<td>"+awayteam+"</td>");
                                out.print("<td>"+date+"</td>");
                                out.print("<td>"+time+"</td>");
                                out.print("<td>"+score+"</td>");
                                out.print("<td>"+tname+"</td>");
                                out.print("<td>"+stadium+"</td>");
                                out.print("<td><input type='submit' value='RESERVE' name'"+id+"'</td>");
                                out.print("</tr>");
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
        </div>
        <div class="footer">
            <p>@yasirshaikh</p>
        </div>
    </body>
</html>
