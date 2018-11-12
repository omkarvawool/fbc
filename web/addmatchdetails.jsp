<%-- 
    Document   : addmatchdetails
    Created on : 11 Jan, 2018, 1:58:49 PM
    Author     : yasir
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Match Details</title>
    </head>
    <body>
        <div id="clublogo">
            <p>Football Club LaMasia</p>
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
                <li><a href="deleteplayer.jsp">Delete Players</a></li>
                <li><a href="addstoreitems.jsp">Add Store Items</a></li>
                <li><a href="storeitems.jsp">Edit Store Items</a></li>
                <li><a href="deletestoreitems.jsp">Delete Store Items</a></li>
                <li><a href="logout.jsp">Log Out</a></li> 
            </ul>
            <% 
                HttpSession httpSession = request.getSession();
                String n =(String)httpSession.getAttribute("username");
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
            <div class="column  content" id="data">
                <h1>ADD MATCH DETAILS</h1>
                <form action="addmatchsql.jsp" method="post" onsubmit="return validate(this)">
                    <table>
                        <tr><td>Home Team : </td><td><input type="text" name="hometeam"></td></tr>
                        <tr><td>Away Team : </td><td><input type="text" name="awayteam"></td></tr>
                        <tr><td>Match Date : </td><td><input type="date" name="date"></td></tr>
                        <tr><td>Match Time : </td><td><input type="time" name="time"></td></tr>
                        <tr><td>Tournament Name : </td><td><input type="text" name="tourname"></td></tr>
                        <tr><td>Stadium : </td><td><input type="text" name="stadium" ></td></tr>
                        <tr><td>Match Score : </td><td><input type="text" name="score" ></td></tr>
                        <tr><td><input type="submit" value ="ADD" name="ok"></td></tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="footer">
            <p>@yasirshaikh</p>
        </div>
    </body>
</html>
