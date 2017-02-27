/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.io.form.function;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Sydney Cruz
 */
public class EditServiceController extends HttpServlet {

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
        
        Connection conn = null;
        PreparedStatement ps;
        ServletContext context = request.getSession().getServletContext();
        int i;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String service_id = request.getParameter("service_id");
            String service_name = request.getParameter("service_name");
            String service_description = request.getParameter("service_description");
            InputStream inputStream = null;
            Part filePart = request.getPart("service_image");
            if(filePart.getSize() != 0){
                inputStream = filePart.getInputStream();
            }
            
            if(!service_name.equals("")){
                ps = conn.prepareStatement("UPDATE services SET service_name = ? WHERE service_id = ?");
                ps.setString(1, service_name);
                ps.setString(2, service_id);
                i = ps.executeUpdate();
            }
            if(!service_description.equals("")){
                ps = conn.prepareStatement("UPDATE services SET service_description = ? WHERE service_id = ?");
                ps.setString(1, service_description);
                ps.setString(2, service_id);
                i = ps.executeUpdate();
            }
            if(filePart.getSize() != 0){
                ps = conn.prepareStatement("UPDATE services SET service_image = ? WHERE service_id = ?");
                ps.setBlob(1, inputStream);
                ps.setString(2, service_id);
                i = ps.executeUpdate();
                
                String imagePath = context.getInitParameter("imgPath") + "service\\" + service_id + ".png";
                File file = new File(imagePath);

                FileOutputStream outFile = new FileOutputStream(file);
                inputStream = filePart.getInputStream();

                int read = 0;
                int bufferSize = 1024;
                byte[] buffer = new byte[bufferSize];
                while((read = inputStream.read(buffer)) != -1){
                    outFile.write(buffer, 0, read);
                }
                inputStream.close();
                outFile.close();
            }
            response.sendRedirect("allservices");
        }catch(Exception e){
            e.printStackTrace();
            out.print(e);
            context.log("Exception: " + e);
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
