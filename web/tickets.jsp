<%-- 
    Document   : tickets
    Created on : Jan 21, 2018, 11:53:39 PM
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
        <title>Tickets</title>
        <link rel="stylesheet" href="admin.css">
        <script>
            var ticketsArray = "";
            function populateSeats()
            {
                var div = document.getElementById('seatsdiv');
                var checkboxStr = "";
                var str = "";
                for(i=1; i<=6; i++)
                {
                    var standname="";
                    var row = "";
                    if(i==1)
                    {
                        row = "A";
                        standname = "A Stand";
                    }
                    else if(i==2)
                    {
                        row = "B";
                        standname = "B Stand";
                    }
                    else if(i==3)
                    {
                        row = "C";
                        standname = "C Stand";
                    }
                    else if(i==4)
                    {
                        row = "D";
                        standname = "D Stand";
                    }
                    else if(i==5)
                    {
                        row = "E";
                        standname = "E Stand";
                    }
                    else if(i==6)
                    {
                        row = "F";
                        standname = "F Stand";
                    }
                    str = str + '<div>'+standname+'</div>'
                    for(j=1; j<=50; j++)
                    {
                        checkbox = '<input id='row+j+' type="checkbox" class="tickets"/>'+j;
                        str = str + checkbox;
                        if(i%10 == 0)
                        {
                            str = str + "<br/>";
                        }
                    }
                    str = str + "<br/><br/>";
                }
                div.innerHTML=str;
                ticketsArray = ticketsArray.split(',');
                for(i=0; i<ticketsArray.length; i++)
                {
                    document.getElementById(ticketsArray[i]).disabled = true;
                }
            }
            function saveTickets()
            {
                var checkbox = document.getElementsByClassName('tickets');
                var array = new Array();
                var t = "";
                for(i=0; i<checkbox.length; i++)
                {
                    var check = checkbox[i];
                    
                    if(check.checked)
                    {
                        console.log(check);
                        array.push(check.id);
                        t = t + check.id +",";
                    }
                }
                t = t.substriing(0,t.length-1);
                console.log(array);
                document.getElementById('seats').value = t;
                return true;
            }
        </script>
    </head>
    <body onload="populateSeats()">
        <%
            HttpSession httpsession = request.getSession();
            String n=(String)httpsession.getAttribute("username");
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
        <div id="clulogo">
            <a href="index.html">
                <img src ="Images/lamasia.jpg" alt="LOGO"/>
            </a>
        </div>
        <div id="clubname">
            <p>Football Club LaMasia</p>
        </div>
        <div class="clearfix">
            <div class="column menu">
                <ul>
                    <li><a href="user.jsp">Home</a></li>
                    <li><a href="profile.jsp">Edit Profile</a></li>
                    <li><a href="reservetickets">Buy Tickets</a></li>
                    <li><a href="purchasehistory">Purchase History</a></li>
                    <li><a href="logout">Log Out</a></li>
                </ul>
            </div>
            <%
                int id=0;
                String tickets = "";
                
                Enumeration en = request.getParameterNames();
                String matchid = (String)en.nextElement();
                Integer userid = 0;
                System.out.println(matchid);
                
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = null;
                    ResultSet rs = null, rs1=null;
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "root", "yasir123");
                    
                    if(connection != null)
                    {
                        Statement stmt = null;
                        Statement stmt1 = null;
                        stmt = connection.createStatement();
                        stmt1 = connection.createStatement();
                        
                        rs = stmt.executeQuery("SELECT * FROM footall.'tickets' WHERE matchid="+matchid);
                        rs1 = stmt1.executeQuery("SELECT id FROM football.user where username='"+n+"'");
                    }
                    int i=0;
                    while(rs1.next())
                    {
                        userid = rs1.getInt(1);
                    }
                    while(rs.next())
                    {
                        id = rs.getInt(1);
                        tickets = tickets + rs.getString(4);
                        tickets = tickets + ",";
                        i++;
                    }
                    tickets = tickets.substring(0, tickets.length()-1);
                }
                catch(Exception e)
                {
                    System.out.println(e);
                }
            %>
            <script>
                ticketsArray = '<%=tickets%>';
            </script>
            
            <div class="column content" id="data">
                <h1>Reserve Seats</h1>
                <form action="savetickets.jsp" method="post" onsubmit="return saveTickets()">
                    <input type="hidden" name="id" value="<%out.print(id);%>">
                    <input type="hidden" name="userid" value="<%=userid%>">
                    <input type="hidden" name="matchid" value="<%=matchid%>">
                    <input type="hidden" name="seats" id="seats">
                    <input type="submit" value="Submit"/>
                </form>
                <br>
                <div id="ticketsHolder">
                    <div id="seatsdiv"></div>
                </div>    
            </div>
        </div>
    </body>
</html>
