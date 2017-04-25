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
public class EditProductController extends HttpServlet {

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
        int success = 0;
        HttpSession session = request.getSession();
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String product_id = request.getParameter("product_id");
            String product_name = request.getParameter("product_name");
            String price = request.getParameter("msrp");
            String stock = request.getParameter("stock");
            String product_detail = request.getParameter("product_detail");
            String category_id = request.getParameter("product_category");
            InputStream inputStream = null;
            Part filePart = request.getPart("product_image");
            if(filePart.getSize() != 0){
                inputStream = filePart.getInputStream();
            }
            
            if(!product_name.equals("")){
                ps = conn.prepareStatement("UPDATE product SET product_name = ? WHERE product_id = ?");
                ps.setString(1, product_name);
                ps.setString(2, product_id);
                success = ps.executeUpdate();
            }
            if(!price.equals("")){
                ps = conn.prepareStatement("UPDATE product SET msrp = ? WHERE product_id = ?");
                ps.setString(1, price);
                ps.setString(2, product_id);
                success = ps.executeUpdate();
            }
            if(!stock.equals("")){
                ps = conn.prepareStatement("UPDATE product SET stock = ? WHERE product_id = ?");
                ps.setInt(1, Integer.parseInt(stock));
                ps.setString(2, product_id);
                success = ps.executeUpdate();
            }
            if(!product_detail.equals("")){
                ps = conn.prepareStatement("UPDATE product SET product_detail = ? WHERE product_id = ?");
                ps.setString(1, product_detail);
                ps.setString(2, product_id);
                success = ps.executeUpdate();
            }
            if(!category_id.equals("")){
                ps = conn.prepareStatement("UPDATE product SET category_id = ? WHERE product_id = ?");
                ps.setString(1, category_id);
                ps.setString(2, product_id);
                success = ps.executeUpdate();
            }
            if(filePart.getSize() != 0){
//                ps = conn.prepareStatement("UPDATE product SET product_image = ? WHERE product_id = ?");
//                ps.setBlob(1, inputStream);
//                ps.setString(2, product_id);
//                i = ps.executeUpdate();
                
                String imagePath = context.getInitParameter("imgPath") + "product\\" + product_id + ".png";
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
            if(success > 0){
                session.setAttribute("success_msg", "Product has been updated");
                Cookie mssgStatus=new Cookie("editMssg","1");
                mssgStatus.setMaxAge(1);
                response.addCookie(mssgStatus);
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
