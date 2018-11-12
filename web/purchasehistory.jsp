<%-- 
    Document   : purchasehistory
    Created on : Jan 22, 2018, 10:45:17 PM
    Author     : yasir
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase History</title>
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
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
        %>
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
                <h1>Match Details</h1>
                <form action="canceltickets.jsp" method="post">
                    <table border=1>
                        <tr>
                            <td>Match</td>
                            <td>Date and Time</td>
                            <td>Tournament | Stadium</td>
                            <td>Tickets</td>
                        </tr>
                        <%
                            int id=0;
                            int ticketid=0;
                            int userid=0;
                            int matchid=0;
                            String tickets="";
                            
                            String hometeam="";
                            String awayteam="";
                            String date="";
                            String time="";
                            String tname="";
                            String stadium="";
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection connection = null;
                                Statement stmt = null;
                                ResultSet rs=null;
                                Statement stmt1=null;
                                ResultSet rs1=null;
                                Statement stmt2=null;
                                ResultSet rs2=null;
                                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root", "yasir123");
                                
                                if(connection != null)
                                {
                                    stmt1 = connection.createStatement();
                                    rs1 = stmt1.executeQuery("SELECT id FROM football.user where username='"+n+"'");
                                    while(rs1.next())
                                    {
                                        userid = rs1.getInt(1);
                                    }
                                    stmt = connection.createStatement();
                                    rs = stmt.executeQuery("SELECT * FROM football.tickets where userid="+userid);
                                    while(rs.next())
                                    {
                                        matchid = rs.getInt(3);
                                        stmt2 = connection.createStatement();
                                        rs2  = stmt2.executeQuery("SELECT * FROM football.'match' where idmatch"+matchid);
                                        while(rs2.next())
                                        {
                                            tickets = rs.getString(4);
                                            ticketid = rs.getInt(1);
                                            id = rs2.getInt(1);
                                            hometeam = rs2.getString(2);
                                            awayteam = rs2.getString(3);
                                            date = rs2.getString(4);
                                            time = rs2.getString(5);
                                            tname = rs2.getString(7);
                                            stadium = rs2.getString(8);
                                            
                                            out.print("<tr>");
                                            out.print("<td>"+hometeam+" VS "+awayteam+"</td>");
                                            out.print("<td>"+date+" | "+time+"</td>");
                                            out.print("<td>"+tname+" | "+stadium+"</td>");
                                            out.print("<td>"+tickets+"</td>");
                                            out.print("<td><input type='submit' value='Cancel' name='"+ticketid+"'></td>");
                                            out.print("</tr>");
                                        } 
                                    }
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
