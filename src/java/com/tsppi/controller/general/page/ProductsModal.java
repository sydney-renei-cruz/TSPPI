/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.general.page;

import com.google.gson.Gson;
import com.tsppi.controller.bean.ProductBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sydney Cruz
 */
public class ProductsModal extends HttpServlet {

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
        
        Connection conn = null;
        PreparedStatement ps;
        ServletContext context = request.getSession().getServletContext();
        ResultSet rs;
        String inText = "";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String product_id = request.getParameter("product_id");
   
            inText = "SELECT p.product_name, c.category_name, p.product_detail, p.msrp, p.stock "
                    + "FROM product p "
                    + "JOIN product_category c ON c.category_id = p.category_id "
                    + "WHERE p.product_id = ?";
            ps = conn.prepareStatement(inText);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            
            ArrayList<ProductBean> al = new ArrayList<>();
            ProductBean pb;
            while(rs.next()){
                pb = new ProductBean();
                pb.setProductID(Integer.parseInt(product_id));
                pb.setProductName(rs.getString("product_name"));
                pb.setCategoryName(rs.getString("category_name"));
                pb.setMSRP(rs.getFloat("msrp"));
                pb.setStock(rs.getInt("stock"));
                pb.setProductDetail(rs.getString("product_detail"));
                al.add(pb);
            }
           
            
            String json = new Gson().toJson(al);
            response.setContentType("application/json");
            out.print(json);
        }catch(Exception e){
            e.printStackTrace();
            out.print(e);
            context.log("Exception: " + e);
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
