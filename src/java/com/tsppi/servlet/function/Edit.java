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
import java.io.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jasteen
 */
public class Edit extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Edit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Edit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        //  Get fields from the edit page
        String username = request.getParameter("username");
        String first_name = request.getParameter("firstname");
        String last_name = request.getParameter("lastname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String telephone = request.getParameter("telephone");
        String address = request.getParameter("address");
        int b;
        
        HttpSession session = request.getSession();
        
        String currentUsername = (String)session.getAttribute("user");
        
        Connection conn = null;
        PreparedStatement ps;
        ServletContext context;
        
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        } 
        
        try{
        
            if(!first_name.equals("")){
                ps = conn.prepareStatement("UPDATE account SET first_name = ? WHERE username = ?");
                ps.setString(1, first_name);
                ps.setString(2, currentUsername);
                b = ps.executeUpdate();
            }
            
            if(!last_name.equals("")){
                ps = conn.prepareStatement("UPDATE account SET last_name = ? WHERE username = ?");
                ps.setString(1, last_name);
                ps.setString(2, currentUsername);
                b = ps.executeUpdate();
            }
            
            if(!email.equals("")){
                ps = conn.prepareStatement("UPDATE account SET email = ? WHERE username = ?");
                ps.setString(1, email);
                ps.setString(2, currentUsername);
                b = ps.executeUpdate();
            }
            
            if(!mobile.equals("")){
                ps = conn.prepareStatement("UPDATE account SET mobile= ? WHERE username = ?");
                ps.setString(1, mobile);
                ps.setString(2, currentUsername);
                b = ps.executeUpdate();
            }
            
            if(!telephone.equals("")){
                ps = conn.prepareStatement("UPDATE account SET telephone = ? WHERE username = ?");
                ps.setString(1, telephone);
                ps.setString(2, currentUsername);
                b = ps.executeUpdate();
            }
            
            if(!address.equals("")){
                ps = conn.prepareStatement("UPDATE account SET address = ? WHERE username = ?");
                ps.setString(1, address);
                ps.setString(2, currentUsername);
                b = ps.executeUpdate();
            }
            
            if(!username.equals("")){
                ps = conn.prepareStatement("UPDATE account SET username = ? WHERE username = ?");
                ps.setString(1, username);
                ps.setString(2, currentUsername);
                b = ps.executeUpdate();
                
                session.setAttribute("user", username);
            }
        
            request.getRequestDispatcher("WEB-INF/auth-page/editpage.jsp").forward(request,response);
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    /**
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    */
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
