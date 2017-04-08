/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.invoice.function;

import com.tsppi.controller.account.register.function.RegisterController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class CartStockCheckerController extends HttpServlet {

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
        ServletContext context = request.getSession().getServletContext();
        HttpSession session = request.getSession();
        try{
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int stock_onHand = (int) session.getAttribute("stock");
//            out.print(stock_onHand);
            if(quantity < stock_onHand){
                out.print("false");
            }else{
                out.print("true");
            }
        }catch(Exception e){
            e.printStackTrace();
            context.log("Exception: " + e);
            request.setAttribute("exception_error", e);
            request.getRequestDispatcher("/WEB-INF/error/catch-error.jsp").forward(request, response);
        }
//        Connection conn = null;
//        PreparedStatement ps;
//        ServletContext context;
//        ResultSet rs;
//        String inText = "";
//        try{
//            context = request.getSession().getServletContext();
//            Class.forName("com.mysql.jdbc.Driver");
//            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
//            
//            String item_number = request.getParameter("item_number");
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            
//            inText = "SELECT stock FROM product WHERE product_id=? LIMIT 1";
//            ps = conn.prepareStatement(inText);
//            ps.setString(1, item_number);
//            rs = ps.executeQuery();
//            
//            int currentStock;
//            while(rs.next()){
//                currentStock = rs.getInt("stock");
//                if(currentStock <  quantity){
//                    out.print("false");
//                }else{
//                    out.print("true");
//                }
//            }
//        }catch(Exception e){
//            e.printStackTrace();
//            out.print(e);
//        }
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
