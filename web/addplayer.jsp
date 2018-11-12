<%-- 
    Document   : addplayer
    Created on : 14 Jan, 2018, 1:55:26 PM
    Author     : yasir
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Player</title>
        <link rel="stylesheet" href="admin.css"
    </head>
    <body>
        <div id="clublogo">
            <a href="index.html">
                <img src="Images\lamasia.jpg" alt="LOGO">
            </a>
        </div>
        <div id="clubname">
            <p>Football Club LaMasia</p>
        </div>
        <div class="clearfix">
            <div class="column menu">
                <ul>
                    <li><a href="admin.jsp">Admin Home</a></li>
                    <li><a href="addmatchdetails.jsp">Add Match Details</a></li>
                    <li><a href="editmatchdeails.jsp">Edit Match Details</a></li>
                    <li><a href="deletematch.jsp">Delete Match</a></li>
                    
                    <li><a href="addplayer.jsp">Add Players</a></li>
                    <li><a href="playersdetails.jsp">Edit Players Details</a></li>
                    <li><a href="deleteplayer.jsp">Delete Players</a></li>
                    <li><a href="addstoreitems.jsp">Add Store Items</a></li>
                    <li><a href="storeitems.jsp">Edit Store Items</a></li>
                    <li><a href="deletestoreitems.jsp">Delete Store Items</a></li>
                    <li><a href="logout.jsp">Log Out</a></li>
                </ul>
            </div>
            <%
                HttpSession httpSession = request.getSession();
                String n = (String)httpSession.getAttribute("username");
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
            <div class="column content" id="data">
                <h1>ADD PLAYER</h1>
                <form action="addplayersql.jsp" method="post">
                    <table>
                        <tr>
                            <td>Name : </td>
                            <td>
                                <input type="text" name="playername">
                            </td>
                        </tr>
                        <tr>
                            <td>Number : </td>
                            <td>
                                <input type="text" name="playernumber">
                            </td>
                        </tr>
                        <tr>
                            <td>D.O.B : </td>
                            <td>
                                <input type="date" name="playerdob">
                            </td>
                        </tr>
                        <tr>
                            <td>Position : </td>
                            <td>
                                <input type="text" name="playerpos">
                            </td>
                        </tr>
                        <tr>
                            <td>Country : </td>
                            <td>
                                <input type="text" name="playercountry">
                            </td>
                        </tr>
                        <tr>
                            <td>Appearances : </td>
                            <td>
                                <input type="text" name="playerapps">
                            </td>
                        </tr>
                        <tr>
                            <td>Goals Scored : </td>
                            <td>
                                <input type="text" name="playergoals">
                            </td>
                        </tr>
                        <tr>
                            <td>Name : </td>
                            <td>
                                <input type="submit" value="Add" name="ok">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
