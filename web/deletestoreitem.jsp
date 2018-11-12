<%-- 
    Document   : deletestoreitem
    Created on : Jan 21, 2018, 5:09:41 PM
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
        <title>Delete Store Item</title>
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
        <%
            HttpSession httpsession = request.getSession();
            String n=(String)httpsession.getAttribute("username");
            if(n == null)
            {
                response.sendRedirect("login,jsp");
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
                <img src="Images/lamasia.jpg" alt="LOGO">
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
                    <li><a href="Logout.jsp">Log Out</a></li>
                </ul>
            </div>
            <%
                int id=0;
                String name = "";
                String price ="";
                String status = "";
                
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = null;
                    ResultSet rs = null;
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root", "yasir123");
                    
                    if(connection != null)
                    {
                        Statement stmt = null;
                        stmt = connection.createStatement();
                        rs = stmt.executeQuery("select * from football.store");
                    }
                    
            %>
            <div class="column content" id="data">
                <h1>Store Item Details</h1>
                <form action ="deleteitemsql.jsp" method="post">
                    <table border=1>
                        <tr>
                            <td>Item Name : </td>
                            <td>Item Price : </td>
                            <td>Item Status : </td>
                        </tr>
                        <%
                            while(rs.next())
                            {
                                id = rs.getInt(1);
                                name = rs.getString(2);
                                price = rs.getString(3);
                                status = rs.getString(4);
                                
                                out.print("<tr>");
                                out.print("<td>"+name+"</td>");
                                out.print("<td>"+price+"</td>");
                                out.print("<td>"+status+"</td>");
                                
                                out.print("<td><input type='submit' vaalue='Delete' name='"+id+"'</td>");
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
