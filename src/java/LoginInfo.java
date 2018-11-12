/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yasir
 */
@WebServlet(urlPatterns = {"/LoginInfo"})
public class LoginInfo extends HttpServlet 
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String n=request.getParameter("username");
        String p=request.getParameter("password");
        HttpSession session = request.getSession();
        /*if(session.getAttribute("username") !=null){
            resp.sendRedirect("Welcome");
        }*/
        if(n.equals("admin") && p.equals("admin"))
        {
            session.setAttribute("username",n);
            response.sendRedirect("Admin.jsp");
        }
        else if(LoginValidate.validate(n, p,session))
        {
            session.setAttribute("username",n);
            response.sendRedirect("User.jsp");
        }
        else
        {
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            out.print("Sorry username or password error");
            rd.include(request,response);
            //out.print("FAILED");
        }

    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException 
    {
    // TODO Auto-generated method stub
    //super.doPost(req, resp);
        doGet(request, response);
    }

    

            /* TODO output your page here. You may use following sample code. */
           
}

