/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yasir
 */
@WebServlet(urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        try
        {
            String username=request.getParameter("username");
            String password=request.getParameter("pass");
            String phonenumber=request.getParameter("num");
            System.out.println(phonenumber);
            String dob = "2018-2-2";
            String d=request.getParameter("dob");
            System.out.println(d);
            String gender="g"; //rquest.getParameter("gender");
            String firstname = request.getParameter("fname");
            String lastname = request.getParameter("lname");
            
            //connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = null;
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/football", "yasir", "yasir123");
            
            if (connection != null) 
            {
                Statement stmt = null;
                stmt = connection.createStatement();
                
                stmt.executeUpdate("INSERT INTO `football`.`user` ( `fname`, `lname`, `number`, `gender`, `dob`, `username`, `password`) VALUES ( '"+firstname+"', '"+lastname+"', "+phonenumber+", '"+gender+"', '"+dob+"', '"+username+"', '"+password+"');" );
            }
            response.sendRedirect("SignUpConfirmation.html");
        }
        catch(IOException | ClassNotFoundException | SQLException e)
        {
            System.out.println(e);
        }
    }
}
