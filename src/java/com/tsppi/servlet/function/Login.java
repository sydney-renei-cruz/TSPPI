/* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.servlet.function;

import com.tsppi.java.function.ValidateLogin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cruzsyd
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        //conditional if-else >>>> session
        String account_type_id = "";
        String account_type = "";
        String account_num = "";
        String job_id = "";
        String job_position = "";
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        HttpSession session = request.getSession();
        ServletContext context;
        Connection conn = null;
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM account WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                account_type_id = rs.getString("account_type_id");
                account_num = rs.getString("account_num");
                
                ps = conn.prepareStatement("SELECT * FROM type_of_account WHERE account_type_id=?");
                ps.setString(1, account_type_id);
                rs = ps.executeQuery();
                if(rs.next()) account_type = rs.getString("account_type");
                
                if(account_type.equals("employee") ){
                    ps = conn.prepareStatement("SELECT * FROM employee WHERE account_num=?");
                    ps.setString(1, account_num);
                    rs = ps.executeQuery();
                    if(rs.next()) job_id = rs.getString("job_id");
                    
                    ps = conn.prepareStatement("SELECT * FROM job_position WHERE job_id=?");
                    ps.setString(1, job_id);
                    rs = ps.executeQuery();
                    if(rs.next()) job_position = rs.getString("job_type");
                }
                
                session.setAttribute("job_position", job_position);
                session.setAttribute("account_type", account_type);
                session.setAttribute("user", username);
                session.setMaxInactiveInterval(30*60);

                Cookie user_name = new Cookie("user", username);
                response.addCookie(user_name);
//                out.println(account_type);
                request.getRequestDispatcher("/WEB-INF/auth-page/profile.jsp").forward(request,response);
            }else{
                request.setAttribute("errorMessage", "Wrong username/password");
                response.sendRedirect("login.jsp?Result=Failed");
            }
                       
        }catch(Exception e){
            e.printStackTrace();
        }
        
//        if(ValidateLogin.validateUser(username, password, request, response)){
//            HttpSession session = request.getSession();
//            session.setAttribute("user", username);
//            session.setMaxInactiveInterval(30*60);
//            
//            Cookie user_name = new Cookie("user", username);
//            response.addCookie(user_name);
//            request.getRequestDispatcher("/WEB-INF/auth-page/profile.jsp").forward(request,response);
//        }else{
//            request.setAttribute("errorMessage", "Wrong username/password");
//            response.sendRedirect("login.jsp?Result=Failed");
//        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

