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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Sydney Cruz
 */
public class AddProductController extends HttpServlet {

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
        ServletContext context = request.getSession().getServletContext();
        HttpSession session = request.getSession();
        String inText;
        int success = 0;
        
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String product_name = request.getParameter("product_name");
            String msrp = request.getParameter("msrp");
            String stock = request.getParameter("stock");
            String product_detail = request.getParameter("product_detail");
            String category_id = request.getParameter("product_category");
            Boolean for_sale = false;
            InputStream inputStream = null;
            Part filePart = request.getPart("product_image");
            if(filePart.getSize() != 0){
                inputStream = filePart.getInputStream();
            }
            if(!product_name.isEmpty() && !msrp.isEmpty() && !stock.isEmpty() && !product_detail.isEmpty()){
                inText = "INSERT INTO product "
                    + "(category_id, product_name, product_detail, msrp, stock, for_sale) "
                    + "VALUES (?,?,?,?,?,?)";
                ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, category_id);
                ps.setString(2, product_name);
                ps.setString(3, product_detail);
                ps.setFloat(4, Float.parseFloat(msrp));
                ps.setInt(5, Integer.parseInt(stock));
                ps.setBoolean(6, for_sale);
                success = ps.executeUpdate();

                int id;
                try(ResultSet generated_keys = ps.getGeneratedKeys()){
                    if(generated_keys.next()){
                       id = generated_keys.getInt(1);
                       if(filePart.getSize() != 0){
                            String imagePath = context.getInitParameter("imgPath") + "product\\" + id + ".png";
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
            }else{
                session.setAttribute("error_msg", "All fields are required");
                response.sendRedirect(request.getHeader("referer"));
            }
            
            if(success>0){
                Cookie mssgStatus=new Cookie("mssgStatus","1");
                mssgStatus.setMaxAge(1);
                response.addCookie(mssgStatus);
                session.setAttribute("success_msg", "Product has been added.");
                response.sendRedirect(request.getHeader("referer"));
            }else{
                session.setAttribute("error_msg", "Please review the fields");
                response.sendRedirect(request.getHeader("referer"));
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
