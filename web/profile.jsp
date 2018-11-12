<%-- 
    Document   : profile.jsp
    Created on : Jan 21, 2018, 6:13:32 PM
    Author     : yasir
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="admin.css">
    </head>
    <body>
        <div id="clublogo">
            <a href="index.html">
                <img src="Images/lamasia.jpg" alt="LOGO">
            </a>
        </div>
        <div class="clearfix">
            <div class="column menu">
                <ul>
                    <li><a href="user.jsp">Home</a></li>
                    <li><a href="profile.jsp">Edit Profile</a></li>
                    <li><a href="reservetickets.jsp">Buy Tickets</a></li>
                    <li><a href="purchasehistory.jsp">Purchase History</a></li>
                    <li><a href="logout.jsp">Log Out</a></li>
                </ul>
            </div>
            <div class="column content" id="data">
                <%
                    HttpSession httpsession = request.getSession();
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
                    Integer id=0;
                    String name = "";
                    String surname = "";
                    String dob = "";
                    String gender = "";
                    String number = "";
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection connection  = null;
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root","yasir123");
                        
                        if(connection != null)
                        {
                            Statement stmt = null;
                            stmt = connection.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from football.user where username ='"+n+"'");
                            while(rs.next())
                            {
                                id = rs.getInt(1);
                                name = rs.getString(2);
                                surname = rs.getString(3);
                                number = rs.getString(4);
                                gender = rs.getString(5);
                                dob = rs.getString(6);
                            }
                        }
                    }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
                %>
                <form action="update.jsp" method="post" onsubmit="return validate(this)">
                    <table>
                        <tr>
                            <td>First Name : </td>
                            <td><input type="text" value="<%out.print(name);%>" name="fname"></td>
                        </tr>
                        <tr>
                            <td>Last Name : </td>
                            <td><input type="text" value="<%out.print(surname);%>" name="lname"></td>
                        </tr>
                        <tr>
                            <td>Number : </td>
                            <td><input type="text" value="<%out.print(number);%>" name="number"></td>
                        </tr>
                        <tr>
                            <td>D.O.B : </td>
                            <td><input type="text" id="dob" value="<%out.print(dob);%>" name="dob"></td>
                        </tr>
                        <tr>
                            <td>Gender : </td>
                            <td><input type="text" value="<%out.print(gender);%>" name="gender"></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Submit" name="ok"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="footer">
            <p>@yasirshaikh</p>
        </div>
    </body>
    
    <script>
    function validate(data)
    {
        var valid=true;
        console.log(document.getElementById('dob').value=="")
        if(document.getElementById('dob').value=="")
        {
            alert('Enter Date');
            valid = false;
        }
        if(valid)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    </script>    
</html>
