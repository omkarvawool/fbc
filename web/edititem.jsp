<%-- 
    Document   : edititem
    Created on : Jan 20, 2018, 11:40:27 PM
    Author     : yasir
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Item</title>
        <link rel="styesheet" href="admin.css"
    </head>
    <body>
        <div id="clublogo">
            <a href ="index.html"
               <img src="Images/lamasia.jpg" alt="LOGO"/>
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
                    String itemname="";
                    String price="";
                    String status="";
                    
                    Enumeration en = request.getParameterNames();
                    String name = (String)en.nextElement();
                    System.out.println(name);
                    
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
                            rs = stmt.executeQuery("select * from football.store where itemid="+name);
                        }
                        while(rs.next())
                        {
                            id = rs.getInt(1);
                            itemname = rs.getString(2);
                            price = rs.getString(3);
                            status = rs.getString(4);
                        }
                    }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
                %>
            </div>
        </div>
            <div class="column content" id="data">
                <h1>Edit Item Details</h1>
                <form action="edititemsql.jsp" method="post">
                    <table>
                        <tr>
                            <td>Item Name : </td>
                            <td>
                                <input type="text" vslue ="<%out.print(itemname);%>" name="itemname">
                            </td>
                        </tr>
                        <tr>
                            <td>Item Price : </td>
                            <td>
                                <input type="text" vslue ="<%out.print(price);%>" name="itemprice">
                            </td>
                        </tr>
                        <tr>
                            <td>Item Status : </td>
                            <td>
                                <input type="text" vslue ="<%out.print(status);%>" name="itemstatus">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="Edit" name="ok">
                            </td>
                        </tr>
                    </table>
                </form>
                            <input type="hidden" name="id" value="<%out.print(id);%>">
                            </form>
            </div>
            </div>
    </body>
</html>
