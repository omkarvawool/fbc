<%-- 
    Document   : additemsql
    Created on : Jan 20, 2018, 11:15:20 PM
    Author     : yasir
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Store Items</title>
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
        <div id="clublogo">
            <a href="index.html">
                <img src="Images/lamasia.jpg" slt="LOGO">
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
            </div>
            <div class="column content" id="data">
                <%
                    HttpSession httpsession = request.getSession();
                    String n = (String)httpsession.getAttribute("username");
                    if( n == null )
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
                <h1>Add Store Items</h1>
                <form action="additemsql.jsp" method="post">
                    <table>
                        <tr>
                            <td>Item Name : </td>
                            <td><input type="text" name="itemname"</td>
                        </tr>
                        <tr>
                            <td>Item Price : </td>
                            <td><input type="text" name="itemprice"</td>
                        </tr>
                        <tr>
                            <td>Item Status : </td>
                            <td><input type="text" name="itemstatus"</td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Add" name="ok"></td>
                        </tr>
                    </table>
                </form>
            </div>
            </div>
            <div class="footer">
                <p>@yasirshaikh</p>
            </div>
    </body>
</html>
