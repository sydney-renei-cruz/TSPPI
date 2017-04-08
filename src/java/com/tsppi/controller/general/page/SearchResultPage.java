/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.general.page;

import com.tsppi.controller.account.register.function.RegisterController;
import com.tsppi.controller.bean.ProductBean;
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
public class SearchResultPage extends HttpServlet {

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
        int i;
        HttpSession session = request.getSession();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            String srch = request.getParameter("srch");
            if(srch != ""){
                String inText = "SELECT p.*, c.* from product p "
                        + "join product_category c on c.category_id = p.category_id "
                        + "where (p.product_name like ? or p.product_detail like ? or c.category_name like ?) and p.for_sale=?";
                ps = conn.prepareStatement(inText);
                ps.setString(1, "%" + srch + "%");
                ps.setString(2, "%" + srch + "%");
                ps.setString(3, "%" + srch + "%");
                ps.setBoolean(4, true);
                rs = ps.executeQuery();

                ArrayList<ProductBean> al = new ArrayList<>();
                ProductBean pb;
                while(rs.next()){
                    
                    pb = new ProductBean();
                    pb.setProductID(rs.getInt("product_id"));
                    pb.setCategoryID(rs.getInt("category_id"));
                    pb.setCategoryName(rs.getString("category_name"));
                    pb.setProductName(rs.getString("product_name"));
                    pb.setProductDetail(rs.getString("product_detail"));
                    pb.setMSRP(rs.getFloat("msrp"));
                    pb.setStock(rs.getInt("stock"));
                    pb.setForSale(rs.getBoolean("for_sale"));
                    al.add(pb);
                }
                request.setAttribute("al", al);
                request.getRequestDispatcher("/WEB-INF/general/search-result.jsp").forward(request,response);
                
            }else{
                response.sendRedirect(request.getHeader("referer"));
            }
        }catch(SQLException e){
            request.getRequestDispatcher("/WEB-INF/error/search-error.jsp").forward(request,response);
            e.printStackTrace();
        }catch(ServletException | ClassNotFoundException | IOException e){
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
