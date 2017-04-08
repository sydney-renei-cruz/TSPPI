/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.io.form.function;

import com.tsppi.controller.account.register.function.RegisterController;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class AddServiceController extends HttpServlet {

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
        PreparedStatement ps = null;
        ServletContext context = request.getSession().getServletContext();;
        String inText = "";
        int i;
        HttpSession session = request.getSession();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String service_name = request.getParameter("service_name");
            String service_description = request.getParameter("service_description");
            InputStream inputStream = null;
            Part filePart = request.getPart("service_image");
            if(filePart.getSize() != 0){
                inputStream = filePart.getInputStream();
            }
//            if(filePart.getSize() != 0){
//                inText = "INSERT INTO services (service_name, service_description, service_image) VALUES (?,?,?)";
//                ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
//                ps.setBlob(3, inputStream);
//            }else{
//                inText = "INSERT INTO services (service_name, service_description) VALUES (?,?)";
//                ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
//            }
            inText = "INSERT INTO services (service_name, service_description) VALUES (?,?)";
            ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, service_name);
            ps.setString(2, service_description);
            i = ps.executeUpdate();
            
            int id;
            try(ResultSet generated_keys = ps.getGeneratedKeys()){
                if(generated_keys.next()){
                   id = generated_keys.getInt(1);
                   if(filePart.getSize() != 0){
                        String imagePath = context.getInitParameter("imgPath") + "service\\" + id + ".png";
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
                }
            }
            if(i>0){
                response.sendRedirect("profile");
            }else{
                response.sendRedirect("addservice");
            }
        }catch(Exception e){
            e.printStackTrace();
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
