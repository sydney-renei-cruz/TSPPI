/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.servlet.function;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.*;
import java.util.*;

/**
 *
 * @author cruzsyd
 */
public class RegisterServlet extends HttpServlet {

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
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

//        Get the name of the form fields.

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile_number");
        String telephone = request.getParameter("telephone_number");
        String address = request.getParameter("address");
        String account_type_id = request.getParameter("type_of_account");        
        String form_identifier = request.getParameter("form_identifier");
        String job_id = request.getParameter("job_type");
        Boolean account_status = false;
        
        //                  Hash the password
        try{
        
            //              Salts for the hashing
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
        
        Random rand = new Random();
        
        password = password + salts[rand.nextInt(10)];
        
            //              End Salting
            
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(password.getBytes());
        
        byte byteData[] = md.digest();
        
        StringBuffer sb = new StringBuffer();
        
        for(int i = 0; i < byteData.length; i++){
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        
        password = sb.toString();
        }
        catch(NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        
        //                 End Hashing
        
        int i;
        
        Connection conn = null;
        PreparedStatement ps;
        ServletContext context;
        
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
        }catch(ClassNotFoundException | SQLException e){
            out.println("Error DB Connection");
            e.printStackTrace();
        }   
        
        try{              
            ps =  conn.prepareStatement("INSERT INTO account (username, password, first_name, last_name, email, mobile, telephone, address, account_type_id, account_status) VALUES (?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, first_name);
            ps.setString(4, last_name);
            ps.setString(5, email);
            ps.setString(6, mobile);
            ps.setString(7, telephone);
            ps.setString(8, address);
            ps.setString(9, account_type_id);
            ps.setBoolean(10, account_status);
            i = ps.executeUpdate();
            
            if(form_identifier.equals("Employee") ){
                ps = conn.prepareStatement("INSERT INTO " + form_identifier + "(account_num, job_id) VALUES (LAST_INSERT_ID(), ?)");
                ps.setString(1, job_id);
                i = ps.executeUpdate();
            }else{
                ps = conn.prepareStatement("INSERT INTO " + form_identifier + "(account_num) VALUES (LAST_INSERT_ID())");
                i = ps.executeUpdate();
            }
            
            
            if(i>0){
                response.sendRedirect(request.getContextPath() + "/LoginPage");
            } 
            else{
                response.sendRedirect(request.getContextPath() + "/RegistrationPage?result=Registration-Failed");
            }
        }catch(SQLException | IOException e){
            out.println(e);
            out.println(form_identifier);
            e.printStackTrace();
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
