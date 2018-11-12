<%-- 
    Document   : edititemsql
    Created on : Jan 21, 2018, 4:43:05 PM
    Author     : yasir
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Item</title>
    </head>
    <body>
        <%
            Enumeration en=request.getParameterNames();
            String n=(String)en.nextElement();
            System.out.println(n);
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root", "yasir123");
                
                if(connection != null)
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    
                    stmt.executeUpdate("DELETE FROM 'football'.'store' WHERE 'itemid'="+n);
                }
                response.sendRedirect("deletestoreitems.jsp");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
    </body>
</html>
