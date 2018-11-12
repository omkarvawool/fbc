<%-- 
    Document   : editplayer
    Created on : Jan 20, 2018, 12:55:05 AM
    Author     : yasir
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Player</title>
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
        <%
            int id=0;
            String pname = "";
            String number = "";
            String dob = "";
            String country="";
            String pos = "";
            String apps = "";
            String goals = "";
            
            Enumeration en=request.getParameterNames();
            String name=(String)en.nextElement();
            System.out.println(name);
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = null;
                ResultSet rs=null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root","yasir123");
                
                if(connection != null)
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    rs = stmt.executeQuery("select * from football.players where playerid="+name);
                }
                while(rs.next())
                {
                    id = rs.getInt(1);
                    number = rs.getString(2);
                    pname = rs.getString(3);
                    dob = rs.getString(4);
                    pos= rs.getString(6);
                    country = rs.getString(7);
                    apps= rs.getString(8);
                    goals=rs.getString(9);
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
        <div class="column content" id="data">
            <h1>EDIT PLAYER DETAILS</h1>
            <form action="editplayersql.jsp" method="post">
                <table>
                    <tr><td>NAME:</td><td><input type="text" value ="<%out.print(pname);%>" name="playername"></td></tr>
                    <tr><td>NUMBER:</td><td><input type="text" value ="<%out.print(number);%>" name="playernumber"></td></tr>
                    <tr><td>DATE OF BIRTH:</td><td><input type="date" value ="<%out.print(dob);%>" name="playerdob"></td></tr>
                    <tr><td>POSITION:</td><td><input type="text" value ="<%out.print(pos);%>" name="playerpos"></td></tr>
                    <tr><td>COUNTRY:</td><td><input type="text" value ="<%out.print(country);%>" name="playercountry" ></td></tr>
                    <tr><td>APPEARANCES</td><td><input type="text" value ="<%out.print(apps);%>" name="playerapps" ></td></tr>
                    <tr><td>GOALS SCORED</td><td><input type="text" value ="<%out.print(goals);%>" name="playergoals" ></td></tr>
                    <tr><td><td><input type="submit" value ="ADD" name="ok"></td></tr>
                </table>
                <input type="hidden" name="id" value="<%out.print(id);%>">
            </form>
        </div>
    </body>
</html>
