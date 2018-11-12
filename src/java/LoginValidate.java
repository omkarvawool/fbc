/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author yasir
 */

import java.sql.*;

import javax.servlet.http.HttpSession;


public class LoginValidate 
{
    public static boolean validate(String name, String pass, HttpSession session)
    {
        boolean status=false;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = null;
            ResultSet rs=null;
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "yasir", "yasir123");
            
            if(connection != null)
            {
                Statement stmt = null;
                stmt = connection.createStatement();
                rs = stmt.executeQuery("select * from football.user where username='"+name+"' and password='"+pass+"'");
            }   
                while(rs.next())
                {
                    status = true;
                    Integer userid=rs.getInt(1);
                    session.setAttribute("userid", userid);
                }
                /*Class.forName("com.mysql.jdbc.Driver");
                Connection con = null;
                con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/football", "yasir","yasir123");

                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery( "select * from football.user where username='"+name+"' and password='"+pass+"'" );
                while(rs.next());
                {
                    status = true;
                    Integer userid=rs.getInt(1);
                    session.setAttribute("userid", userid);
                }*/
                
            }
            catch(ClassNotFoundException | SQLException e)
            {
                System.out.println(e);
            }
        return status;
    }
}
