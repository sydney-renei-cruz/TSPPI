/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.io.form.page;

import com.tsppi.controller.account.register.function.RegisterController;
import com.tsppi.controller.bean.ProductBean;
import com.tsppi.controller.bean.ProductCategoryBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sydney Cruz
 */
public class EditProductPage extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement ps = null;
        ServletContext context = request.getSession().getServletContext();
        ResultSet rs = null;
        HttpSession session = request.getSession();
        String inText = "";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            //Retrieve Product Info
            String product_id = request.getParameter("product_id");
            
            inText = "SELECT p.*, c.category_name "
                    + "FROM product p "
                    + "JOIN product_category c ON p.category_id = c.category_id "
                    + "WHERE p.product_id=?";
            ps = conn.prepareStatement(inText);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            ArrayList<ProductBean> pb = new ArrayList<>();
            ProductBean p;
            while(rs.next()){
                p = new ProductBean();
                p.setProductID(rs.getInt("product_id"));
                p.setCategoryID(rs.getInt("category_id"));
                p.setCategoryName(rs.getString("category_name"));
                p.setProductName(rs.getString("product_name"));
                p.setMSRP(rs.getFloat("msrp"));
                p.setStock(rs.getInt("stock"));
                p.setProductDetail(rs.getString("product_detail"));
                pb.add(p);
            }
            //Retrieve Product Info
            //Retrieve Product Categories
            inText = "SELECT * FROM product_category";
            ps = conn.prepareStatement(inText);
            rs = ps.executeQuery();
            
            ArrayList<ProductCategoryBean> pcb = new ArrayList<>();
            ProductCategoryBean pc;
            while(rs.next()){
                pc = new ProductCategoryBean();
                pc.setCategoryID(rs.getInt("category_id"));
                pc.setCategoryName(rs.getString("category_name"));
                pcb.add(pc);
            }
            rs.close();
            
            //Retrieve Product Categories
            request.setAttribute("pb", pb);
            request.setAttribute("pcb", pcb);
            
            request.getRequestDispatcher("/WEB-INF/io/form/edit-product.jsp").forward(request,response);
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
            if(rs != null){
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
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