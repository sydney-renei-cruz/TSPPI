/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.general.page;

import com.tsppi.controller.bean.ProductBean;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sydney Cruz
 */
public class ProductsPage extends HttpServlet {

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
        ServletContext context;
        ResultSet rs;
        String inText = "";
        
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            inText = "SELECT p.*, c.category_name "
                    + "FROM product p "
                    + "JOIN product_category c ON c.category_id = p.category_id";
            ps = conn.prepareStatement(inText);
            rs = ps.executeQuery();
            
            ArrayList<ProductBean> pb = new ArrayList<>();
            ProductBean p;
            while(rs.next()){
                p = new ProductBean();
                p.setProductID(rs.getInt("product_id"));
                p.setCategoryName(rs.getString("category_name"));
                p.setProductName(rs.getString("product_name"));
                p.setMSRP(rs.getFloat("msrp"));
                p.setStock(rs.getInt("stock"));
                p.setProductDetail(rs.getString("product_detail"));
                p.setForSale(rs.getBoolean("for_sale"));
                if(rs.getBoolean("for_sale") != false){
                    pb.add(p);
                }
                
            }
            request.setAttribute("pb", pb);
            request.getRequestDispatcher("/WEB-INF/general/products.jsp").forward(request,response);
        }catch(ClassNotFoundException | SQLException e){
            out.print(e);
            e.printStackTrace();
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
