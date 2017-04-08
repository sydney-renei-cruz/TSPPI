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
import java.sql.ResultSet;
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
public class ChangePasswordController extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ServletContext context = request.getSession().getServletContext();
        String inText = "";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String current_password = request.getParameter("current_password");
            String new_password = request.getParameter("new_password");
            String confirm_password = request.getParameter("confirm_password");
            String auth_account = (String)session.getAttribute("account_num");
            context.log("account num: " + auth_account);
            
            int success = 0;
            if(!current_password.equals("") && !new_password.equals("") && !confirm_password.equals("")){
                //                  Hash the password
                    //Try the 10 different Salts
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
                String pwplaceholder = "";
                String converted_password = "";
                String retrieved_password = "";
                inText = "SELECT * FROM account "
                        + "WHERE account_num=?";
                ps = conn.prepareStatement(inText);
                ps.setString(1, auth_account);
                rs = ps.executeQuery();
                if(rs.next()){
                    retrieved_password = rs.getString("password");
                    context.log("Database password: " + retrieved_password);
                }
                
                for(int i = 0; i <= 9; i++){
                    pwplaceholder = current_password + salts[i];
                    md.update(pwplaceholder.getBytes());

                    byte byteData[] = md.digest();
                    StringBuilder sb = new StringBuilder();
                    for(int y = 0; y < byteData.length; y++){
                        sb.append(Integer.toString((byteData[y] & 0xff) + 0x100, 16).substring(1));
                    }
                    converted_password = sb.toString();
                    context.log("current password: " + sb.toString());

                    if(retrieved_password.equals(converted_password)){
                        context.log("Match");
                        MessageDigest md2 = MessageDigest.getInstance("SHA-256");
                        Random rand = new Random();
                        new_password = new_password + salts[rand.nextInt(10)];

                        md2.update(new_password.getBytes());
                        byte new_byteData[] = md2.digest();
                        StringBuilder sb2 = new StringBuilder();
                        for(int j=0; j<new_byteData.length; j++){
                            sb2.append(Integer.toString((new_byteData[j] & 0xff) + 0x100, 16).substring(1));
                        }
                        new_password = sb2.toString();
                        context.log("new password - converted: " + new_password);
                        inText = "UPDATE account SET password=? WHERE account_num=?";
                        ps = conn.prepareStatement(inText);
                        ps.setString(1, new_password);
                        ps.setString(2, auth_account);
                        success = ps.executeUpdate();
                        if(success > 0){
                            context.log("done!");
                            response.sendRedirect("profile");
                            return;
                        }else{
                            session.setAttribute("change_error", "Please review the fields");
                            response.sendRedirect(request.getHeader("referer"));
                            return;
                        }
                    }
                }
                
                if(!rs.previous()){
                    session.setAttribute("change_error", "Incorrect current password");
                    response.sendRedirect(request.getHeader("referer"));
                }
                
//                for(int i = 0; i <= 9; i++){
//                    
//                    if(rs.next()){
//                        retrieved_password = rs.getString("password");
//                        
//                        context.log("Found!");
//                        context.log("found: " + retrieved_password);
//                        if(new_password.equals(confirm_password)){
//                            context.log("new password - original: " + confirm_password);
                            
//                            
//                        }else{
//                            context.log("Password not equal to confirm password");
//                            session.setAttribute("change_error", "Password does not match");
//                            response.sendRedirect(request.getHeader("referer"));
//                            return;
//                        }
//                    }else{
//                        context.log("Not found");
//                    }
                    
//                    if(!rs.previous()){
//                        context.log("rs: " + rs.previous());
//                        context.log("rs: " + rs.next());
                        
//                    }
//                }
            }else{
                session.setAttribute("change_error", "Please fill up each field");
                response.sendRedirect(request.getHeader("referer"));
            }
            
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
            if(rs != null){
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
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
