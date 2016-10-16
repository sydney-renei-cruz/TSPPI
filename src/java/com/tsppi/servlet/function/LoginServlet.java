/* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.servlet.function;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.*;

/**
 *
 * @author cruzsyd
 */
public class LoginServlet extends HttpServlet {

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
        boolean status = false;
        String pwplaceholder = "";
        String pass = "";
        String newpass= "";
        
        
        
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
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM account WHERE username = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            //          Try the 10 different Salts
            
            
              String[] salts = new String[10];
              salts[0] = "7LsDFJ9oHjDnfUr12";
              salts[1] = "K8oMilIOi0ji43amS";
              salts[2] = "AFIOUVAJNONVASJja";
              salts[3] = "nVaWIdsj19Aij63df";
              salts[4] = "uahRksD47kljnJN9k";
              salts[5] = "dMna7sY01jfIoaPlY";
              salts[6] = "Wg480ioAjEdsf31Ka";
              salts[7] = "gMutRHj70ubQnjB67";
              salts[8] = "gnQiaOhfXquh82z74";
              salts[9] = "mKvqn7834wHjk1kLa";
              
              MessageDigest md = MessageDigest.getInstance("SHA-256");
              
              if(rs.next()){
                  pass = rs.getString("password");
                  status = rs.getBoolean("account_status");
              }
              
              for(int i = 0; i <= 9; i++){
                pwplaceholder = password + salts[i];
                
                md.update(pwplaceholder.getBytes());
        
                byte byteData[] = md.digest();
        
                StringBuffer sb = new StringBuffer();
        
                for(int y = 0; y < byteData.length; y++){
                    sb.append(Integer.toString((byteData[y] & 0xff) + 0x100, 16).substring(1));
                }

                
                //      correct will become TRUE if a match is found
                if(pass.equals(sb.toString())){

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


                    session.setAttribute("account_num", account_num);
                    session.setAttribute("job_position", job_position);
                    session.setAttribute("account_type", account_type);
                    session.setAttribute("account_status", status);
                    session.setAttribute("user", username);
                    
                    session.setMaxInactiveInterval(30*60);

                }
            }            
            
            if(!rs.previous()){
                session.setAttribute("error_message", "Incorrect username or password");
                response.sendRedirect("login");
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

