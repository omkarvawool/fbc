<%-- 
    Document   : deleteplayer
    Created on : Jan 20, 2018, 1:26:15 AM
    Author     : yasir
--%>

<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Player</title>
    </head>
    <body>
        <div id="clublogo">
            <a href="index.html">
                <img src="Images/lamasia.jpg" alt="LOGO"/>
            </a>
        </div>
        <div id="clubname">
            <p>Football Club LaMasia</p>
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
                <li><a href="logout.jsp">LOG OUT</a></li>
            </ul>
        </div>
        <div class="column content" id="data">
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
        
        <%
            int id=0;
            String name = "";
            String number="";
            String age = "";
            String pos="";
            String apps = "";
            String goals="";
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = null;
                ResultSet rs=null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "yasir","yasir123");
                if (connection != null) 
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    rs = stmt.executeQuery( "SELECT * FROMfootball.players" );
                }
        %>
        <h1>PLAYER DETAILS</h1>
        <form action="deleteplayersql.jsp" method="post">
            <table border=1>
                <tr>
                    <td>NUMBER</td>
                    <td>NAME</td>
                    <td>AGE</td>
                    <td>POSITION</td>
                    <td>APPS</td>
                    <td>GOALS</td>
                </tr>
            <%
                while(rs.next())
                {
                    id = rs.getInt(1);
                    number = rs.getString(2);
                    name=rs.getString(3);
                    age = rs.getString(5);
                    pos=rs.getString(6);
                    apps = rs.getString(8);
                    goals = rs.getString(9);

                    out.print("<tr>");
                    out.print("<td>"+number+"</td>");
                    out.print("<td>"+name+"</td>");
                    out.print("<td>"+age+"</td>");
                    out.print("<td>"+pos+"</td>");
                    out.print("<td>"+apps+"</td>");
                    out.print("<td>"+goals+"</td>");
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
                <p>@yasirshaikh</p>
            </div>
    </body>
</html>
