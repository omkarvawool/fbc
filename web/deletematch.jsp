                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Match</title>
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
    <% 
        HttpSession httpSession = request.getSession();
        String n=(String)httpSession.getAttribute("username");
        if(n == null)
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
        <a href="index.html">
            <img src="Images\lamasia.jpg" alt="LOGO">
        </a>
    </div>
    <div id="clubname">
        <p>AVENGERS FOOTBALL CLUB</p>
    </div>
    <div class="clearfix">
        <div class="column menu">
            <ul>
                <li><a href="admin.jsp">ADMIN HOME</a></li>
                <li><a href="addmatchdetails.jsp">ADD MATCH DETAILS</a></li>
                <li><a href="editmatchdetails.jsp">EDIT MATCH DETAILS</a></li>
                <li><a href="deletematch.jsp">DELETE MATCH</a></li>

                <li><a href="addplayer.jsp">ADD PLAYERS</a></li>
                <li><a href="playersdetails.jsp">EDIT PLAYERS DETAILS</a></li>
                <li><a href="deleteplayer.jsp">DELETE PLAYERS</a></li>
                <li><a href="addstoreitems.jsp">ADD STORE ITEMS</a></li>
                <li><a href="storeitems.jsp">EDIT STORE ITEMS</a></li>
                <li><a href="deletestoreitems.jsp">DELETE STORE ITEMS</a></li>
                <li><a href="Logout.jsp">LOG OUT</a></li>
            </ul>
        </div>
        <%
            int id=0;
            String hometeam = "";
            String awayteam = "";
            String date = "";
            String time="";
            String tname = "";
            String stadium = "";
            String score = "";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = null;
                ResultSet rs=null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root","yasir123");
                if (connection != null) 
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    rs = stmt.executeQuery( "SELECT * FROM football.`match`;");
                }
        %>
        <div class="column content" id="data">
            <h1>DELETE MATCH</h1>
            <form action="deletematchsql.jsp" method="post">
                <table border=1>
                    <tr>
                        <td>HOME TEAM</td>
                        <td>AWAY TEAM</td>
                        <td>DATE</td>
                        <td>TIME</td>
                        <td>SCORE</td>
                        <td>TOURNAMENT</td>
                        <td>STADIUM</td>
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
                            tname= rs.getString(7);
                            stadium=rs.getString(8);
                            out.print("<tr>");
                            out.print("<td>"+hometeam+"</td>");
                            out.print("<td>"+awayteam+"</td>");
                            out.print("<td>"+date+"</td>");
                            out.print("<td>"+time+"</td>");
                            out.print("<td>"+score+"</td>");
                            out.print("<td>"+tname+"</td>");
                            out.print("<td>"+stadium+"</td>");
                            out.print("<td><input type='submit' value ='DELETE' name='"+id+"'></td>");
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
        <p>@ashleshaigal</p>
    </div>
    </body>
</html>

