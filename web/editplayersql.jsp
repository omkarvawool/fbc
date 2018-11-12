<%-- 
    Document   : editplayersql
    Created on : Jan 20, 2018, 1:11:26 AM
    Author     : yasir
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
            String id= request.getParameter("id");
            String name = request.getParameter("playername");
            String number = request.getParameter("playernumber");
            String dob =request.getParameter("playerdob");
            String position=request.getParameter("playerpos");
            String country = request.getParameter("playercountry");
            String apps = request.getParameter("playerapps");
            String goals = request.getParameter("playergoals");
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = null;
                connection = DriverManager.getConnection("jdbc:mysql://localhost/football", "root","yasir123");
                
                SimpleDateFormat obj = new SimpleDateFormat("YYYY-MM-dd");
                Date date = obj.parse(dob);
                
                Calendar today = Calendar.getInstance();
                Calendar birthDate = Calendar.getInstance();
                
                int age = 0;
                
                birthDate.setTime(date);
                if (birthDate.after(today)) 
                {
                    throw new IllegalArgumentException("Can't be born in thefuture");
                }
                
                age = today.get(Calendar.YEAR) - birthDate.get(Calendar.YEAR);
                
                // If birth date is greater than todays date (after 2 days adjustment of leap year) then decrement age one year
                
                if ( (birthDate.get(Calendar.DAY_OF_YEAR) - today.get(Calendar.DAY_OF_YEAR) > 3) || (birthDate.get(Calendar.MONTH) > today.get(Calendar.MONTH )))
                {
                    age--;
                    // If birth date and todays date are of same month and birth day of month is greater than todays day of month then decrement age
                }
                
                else if((birthDate.get(Calendar.MONTH) == today.get(Calendar.MONTH )) && (birthDate.get(Calendar.DAY_OF_MONTH) > today.get(Calendar.DAY_OF_MONTH )))
                {
                    age--;
                }
                
                if (connection != null) 
                {
                    Statement stmt = null;
                    stmt = connection.createStatement();
                    
                    stmt.executeUpdate( "UPDATE `football`.`players` SET`playernumber`='"+number+"', `playername`='"+name+"',`playerdob`='"+dob+"',`playerage`='"+age+"',`playerposition`='"+position+"', `playercountry`='"+country+"',`playerapps`='"+apps+"', `playergoals`='"+goals+"' WHERE`playerid`='"+id+"'" );
                }
                response.sendRedirect("playersdetails.jsp");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
    </body>
</html>
