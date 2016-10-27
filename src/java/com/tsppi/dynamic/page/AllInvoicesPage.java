/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.dynamic.page;

import com.tsppi.bean.InvoiceBean;
import java.io.IOException;
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
 * @author cruzsyd
 */
public class AllInvoicesPage extends HttpServlet {

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
        HttpSession session = request.getSession();
        Connection conn = null;
        PreparedStatement ps;
        ServletContext context;
        
        ResultSet rs;
        String inText;
        int i;
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        
        //session activated client
        try{
            String active_user = (String) session.getAttribute("account_num");
            inText = "SELECT i.invoice_id, s.status_name, i.total_amount, i.invoice_date"
                    + "from invoice i "
                    + "JOIN client c ON i.client_id = c.client_id "
                    + "JOIN invoice_status s ON i.status_id = s.status_id"
                    + "WHERE c.account_num=?";
            ps = conn.prepareStatement(inText);
            ps.setString(1, active_user);
            rs = ps.executeQuery();
            
            ArrayList<InvoiceBean> al = new ArrayList<>();
            InvoiceBean ib;
            while(rs.next()){
                ib = new InvoiceBean();
                ib.setInvoiceID(rs.getInt("invoice_id"));
                ib.setStatusName(rs.getString("status_name"));
                ib.setTotalAmount(rs.getFloat("total_amount"));
                ib.setInvoiceDate(rs.getDate("invoice_date"));
                al.add(ib);
            }
            request.setAttribute("al", al);
        }catch(Exception e){
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/auth-page/all-invoices.jsp").include(request, response);
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
