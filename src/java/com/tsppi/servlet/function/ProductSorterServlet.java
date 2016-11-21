/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.servlet.function;

import com.google.gson.Gson;
import com.tsppi.bean.ProductBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class ProductSorterServlet extends HttpServlet {

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
        PreparedStatement ps;
        ServletContext context;
        ResultSet rs;
        int i;
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        
        try{
            int category_id = Integer.parseInt(request.getParameter("category_id"));
            String inText = "";
            if(category_id == 0){
                inText = "SELECT p.*, c.category_name "
                    + "FROM product p "
                    + "JOIN product_category c ON p.category_id = c.category_id ";
            }else{
                inText = "SELECT p.*, c.category_name "
                    + "FROM product p "
                    + "JOIN product_category c ON p.category_id = c.category_id "
                    + "WHERE c.category_id=?";
            }
            
            ps = conn.prepareStatement(inText);
            ps.setInt(1, category_id);
            rs = ps.executeQuery();
            
            ArrayList<ProductBean> al = new ArrayList<>();
            ProductBean pb= new ProductBean();
            int stock = 0;
            while(rs.next()){
                pb = new ProductBean();
                pb.setProductID(rs.getInt("product_id"));
                pb.setCategoryName(rs.getString("category_name"));
                pb.setProductName(rs.getString("product_name"));
                pb.setMSRP(rs.getFloat("msrp"));
                pb.setStock(rs.getInt("stock"));
                pb.setProductDetail(rs.getString("product_detail"));
                pb.setForSale(rs.getBoolean("for_sale"));
                if(rs.getBoolean("for_sale") != false){
                    al.add(pb);
                }
                stock = rs.getInt("stock");
            }
            String json = new Gson().toJson(al);
            response.setContentType("application/json");
            out.print(json);
        }catch(Exception e){
            out.print(e);
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
