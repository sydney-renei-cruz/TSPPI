/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.account.profile.function;

import com.tsppi.controller.account.register.function.RegisterController;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Sydney Cruz
 */
public class EditProfileController extends HttpServlet {

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
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        Connection conn = null;
        PreparedStatement ps = null;
        ServletContext context = request.getSession().getServletContext();
        int success = 0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String username = request.getParameter("username");
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String currentUsername = (String)session.getAttribute("account_num");
            InputStream inputStream = null;
            Part filePart = request.getPart("account_image");
            if(filePart.getSize() != 0){
                inputStream = filePart.getInputStream();
            }
            int x;
            if(!first_name.equals("")){
                ps = conn.prepareStatement("UPDATE account SET first_name = ? WHERE account_num = ?");
                ps.setString(1, first_name);
                ps.setString(2, currentUsername);
                success = ps.executeUpdate();
                if(success == 0){
                    session.setAttribute("change", "Please review fields");
                    response.sendRedirect(request.getHeader("referer"));
                    return;
                }
            }
            
            if(!last_name.equals("")){
                ps = conn.prepareStatement("UPDATE account SET last_name = ? WHERE account_num = ?");
                ps.setString(1, last_name);
                ps.setString(2, currentUsername);
                success = ps.executeUpdate();
                if(success == 0){
                    session.setAttribute("change", "Please review fields");
                    response.sendRedirect(request.getHeader("referer"));
                    return;
                }
            }
            
            if(!email.equals("")){
                ps = conn.prepareStatement("UPDATE account SET email = ? WHERE account_num = ?");
                ps.setString(1, email);
                ps.setString(2, currentUsername);
                success = ps.executeUpdate();
                if(success == 0){
                    session.setAttribute("change", "Please review fields");
                    response.sendRedirect(request.getHeader("referer"));
                    return;
                }
            }
             if(filePart.getSize() != 0){
//                ps = conn.prepareStatement("UPDATE account SET account_image = ? WHERE account_num = ?");
//                ps.setBlob(1, inputStream);
//                ps.setString(2, currentUsername);
//                ps.executeUpdate();
                
                String imagePath = context.getInitParameter("imgPath") + "account\\" + currentUsername + ".png";
                File file = new File(imagePath);

                FileOutputStream outFile = new FileOutputStream(file);
//                inputStream = filePart.getInputStream();

                int read = 0;
                int bufferSize = 1024;
                byte[] buffer = new byte[bufferSize];
                while((read = inputStream.read(buffer)) != -1){
                    outFile.write(buffer, 0, read);
                }
                inputStream.close();
                outFile.close();
             }
            if(session.getAttribute("account_type").equals("client")){
                if(!mobile.equals("")){
                    ps = conn.prepareStatement("UPDATE client SET mobile= ? WHERE account_num = ?");
                    ps.setString(1, mobile);
                    ps.setString(2, currentUsername);
                    success = ps.executeUpdate();
                }
                if(success == 0){
                    session.setAttribute("change", "Please review fields");
                    response.sendRedirect(request.getHeader("referer"));
                    return;
                }
            }
            
            
            if(!username.equals("")){
                ps = conn.prepareStatement("UPDATE account SET username = ? WHERE account_num = ?");
                ps.setString(1, username);
                ps.setString(2, currentUsername);
                success = ps.executeUpdate();
                session.setAttribute("user", username);
                if(success == 0){
                    session.setAttribute("change", "Please review fields");
                    response.sendRedirect(request.getHeader("referer"));
                    return;
                }
            }
            response.sendRedirect("profile");
        
            
        }catch(Exception e){
            e.printStackTrace();
            out.print(e);
            context.log("Exception: " + e);
            request.setAttribute("exception_error", e);
            request.getRequestDispatcher("/WEB-INF/error/catch-error.jsp").forward(request, response);
        }finally{
            if(conn != null){
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(ps != null){
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
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