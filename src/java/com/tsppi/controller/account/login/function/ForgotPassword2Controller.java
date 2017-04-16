/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.account.login.function;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jasteen
 */
public class ForgotPassword2Controller extends HttpServlet {

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
        ServletContext context;
        Connection conn;
        PreparedStatement ps;
        String inText = "";
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            
            //Salts for the hashing
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
            //End Salting
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte byteData[] = md.digest();
            StringBuffer sb = new StringBuffer();

            for(int i = 0; i < byteData.length; i++){
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }

            password = sb.toString();
            
            inText = "UPDATE account SET password = ? AND forgot = '' WHERE forgot = ?";
            ps = conn.prepareStatement(inText);
            ps.setString(1, password);
            ps.setString(2, id);
            ps.executeUpdate();
            
            // -- Remove session values --
            session.invalidate();

            response.sendRedirect("login");
        }catch(Exception e){
            e.printStackTrace();
            out.print(e);
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
