<%-- 
    Document   : update
    Created on : Jan 21, 2018, 10:19:20 PM
    Author     : yasir
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <body>
        <%
            HttpSession httpsession=request.getSession();
            String n=(String)httpsession.getAttribute("user");
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
        
        <%
            try
            {
                String phonenumber = request.getParameter("number");
                String dob = request.getParameter("dob");
                String gender = request.getParameter("gender");
                String firstname = request.getParameter("fname");
                String lastname = request.getParameter("lname");
            
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football","root", "yasir123");
            
                if(connection != null)
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    //String username = "yasir";
                    stmt.executeUpdate("UPDATE 'football'.'user' SET 'fname'='"+firstname+"', 'lname'='"+lastname+"', 'number'='"+phonenumber+"', 'gender'='"+gender+"', 'dob'='"+dob+"' WHERE 'username'='"+n+"' ");
                    response.sendRedirect("profile.jsp");
                    out.println("Update Successful!");
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
            finally{}
        %>
    </body>
</html>
