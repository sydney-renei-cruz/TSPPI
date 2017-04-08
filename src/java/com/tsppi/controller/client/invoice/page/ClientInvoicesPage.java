/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.invoice.page;

import com.tsppi.controller.account.register.function.RegisterController;
import com.tsppi.controller.bean.InvoiceBean;
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
public class ClientInvoicesPage extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        Connection conn = null;
        PreparedStatement ps = null;
        ServletContext context = request.getSession().getServletContext();
        ResultSet rs = null;
        String inText = "";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String active_user = (String) session.getAttribute("account_num");
            inText = "SELECT i.invoice_id, p.payment_method, i.total_amount, i.invoice_date, i.invoice_status "
                    + "from invoice i "
                    + "join invoice_pm p on p.pm_id = i.pm_id "
                    + "join client c on c.client_id = i.client_id "
                    + "where c.account_num=? AND i.invoice_status='Pending' ";
            ps = conn.prepareStatement(inText);
            ps.setString(1, active_user);
            rs = ps.executeQuery();
            
            //retrieve invoices that are pending
            ArrayList<InvoiceBean> al1 = new ArrayList<>();
            InvoiceBean ib1;
            while(rs.next()){
                ib1 = new InvoiceBean();
                ib1.setInvoiceID(rs.getInt("invoice_id"));
                ib1.setPaymentMethod(rs.getString("payment_method"));
                ib1.setTotalAmount(rs.getFloat("total_amount"));
                ib1.setInvoiceDate(rs.getDate("invoice_date"));
                ib1.setInvoiceStatus(rs.getString("invoice_status"));
                al1.add(ib1);
            }
            //retrieve invoices that are pending
            
            //retrieve invoices that are approved
            inText = "SELECT i.invoice_id, p.payment_method, i.total_amount, i.invoice_date, i.invoice_status "
                    + "from invoice i "
                    + "join invoice_pm p on p.pm_id = i.pm_id "
                    + "join client c on c.client_id = i.client_id "
                    + "where c.account_num=? AND i.invoice_status='Approved'";
            ps = conn.prepareStatement(inText);
            ps.setString(1, active_user);
            rs = ps.executeQuery();
            
            ArrayList<InvoiceBean> al2 = new ArrayList<>();
            InvoiceBean ib2;
            while(rs.next()){
                ib2 = new InvoiceBean();
                ib2.setInvoiceID(rs.getInt("invoice_id"));
                ib2.setPaymentMethod(rs.getString("payment_method"));
                ib2.setTotalAmount(rs.getFloat("total_amount"));
                ib2.setInvoiceDate(rs.getDate("invoice_date"));
                ib2.setInvoiceStatus(rs.getString("invoice_status"));
                al2.add(ib2);
            }
            //retrieve invoices that are approved
            
            //retrieve invoices that are rejected or canceled.
            inText = "SELECT i.invoice_id, p.payment_method, i.total_amount, i.invoice_date, i.invoice_status "
                    + "from invoice i "
                    + "join invoice_pm p on p.pm_id = i.pm_id "
                    + "join client c on c.client_id = i.client_id "
                    + "where c.account_num=? AND (i.invoice_status='Rejected' OR i.invoice_status='Cancelled')";
            ps = conn.prepareStatement(inText);
            ps.setString(1, active_user);
            rs = ps.executeQuery();
            
            ArrayList<InvoiceBean> al3 = new ArrayList<>();
            InvoiceBean ib3;
            while(rs.next()){
                ib3 = new InvoiceBean();
                ib3.setInvoiceID(rs.getInt("invoice_id"));
                ib3.setPaymentMethod(rs.getString("payment_method"));
                ib3.setTotalAmount(rs.getFloat("total_amount"));
                ib3.setInvoiceDate(rs.getDate("invoice_date"));
                ib3.setInvoiceStatus(rs.getString("invoice_status"));
                al3.add(ib3);
            }
            //retrieve invoices that are rejected or canceled.
            
            //retrieve invoices that are in process
            inText = "SELECT i.invoice_id, p.payment_method, i.total_amount, i.invoice_date, i.invoice_status "
                    + "from invoice i "
                    + "join invoice_pm p on p.pm_id = i.pm_id "
                    + "join client c on c.client_id = i.client_id "
                    + "where c.account_num=? AND i.invoice_status='In Process'";
            ps = conn.prepareStatement(inText);
            ps.setString(1, active_user);
            rs = ps.executeQuery();
            
            ArrayList<InvoiceBean> al4 = new ArrayList<>();
            InvoiceBean ib4;
            while(rs.next()){
                ib4 = new InvoiceBean();
                ib4.setInvoiceID(rs.getInt("invoice_id"));
                ib4.setPaymentMethod(rs.getString("payment_method"));
                ib4.setTotalAmount(rs.getFloat("total_amount"));
                ib4.setInvoiceDate(rs.getDate("invoice_date"));
                ib4.setInvoiceStatus(rs.getString("invoice_status"));
                al4.add(ib4);
            }
            //retrieve invoices that are in process
            
            //retrieve invoices that are in delivery
            inText = "SELECT i.invoice_id, p.payment_method, i.total_amount, i.invoice_date, i.invoice_status "
                    + "from invoice i "
                    + "join invoice_pm p on p.pm_id = i.pm_id "
                    + "join client c on c.client_id = i.client_id "
                    + "where c.account_num=? AND i.invoice_status='Delivery'";
            ps = conn.prepareStatement(inText);
            ps.setString(1, active_user);
            rs = ps.executeQuery();
            
            ArrayList<InvoiceBean> al5 = new ArrayList<>();
            InvoiceBean ib5;
            while(rs.next()){
                ib5 = new InvoiceBean();
                ib5.setInvoiceID(rs.getInt("invoice_id"));
                ib5.setPaymentMethod(rs.getString("payment_method"));
                ib5.setTotalAmount(rs.getFloat("total_amount"));
                ib5.setInvoiceDate(rs.getDate("invoice_date"));
                ib5.setInvoiceStatus(rs.getString("invoice_status"));
                al5.add(ib5);
            }
            //retrieve invoices that are in delivery
            
//            retrieve invoices that are expired
            inText = "SELECT i.invoice_id, p.payment_method, i.total_amount, i.invoice_date, i.invoice_status "
                    + "from invoice i "
                    + "join invoice_pm p on p.pm_id = i.pm_id "
                    + "join client c on c.client_id = i.client_id "
                    + "where c.account_num=? AND i.invoice_status='Expired'";
            ps = conn.prepareStatement(inText);
            ps.setString(1, active_user);
            rs = ps.executeQuery();
            
            ArrayList<InvoiceBean> al6 = new ArrayList<>();
            InvoiceBean ib6;
            while(rs.next()){
                ib6 = new InvoiceBean();
                ib6.setInvoiceID(rs.getInt("invoice_id"));
                ib6.setPaymentMethod(rs.getString("payment_method"));
                ib6.setTotalAmount(rs.getFloat("total_amount"));
                ib6.setInvoiceDate(rs.getDate("invoice_date"));
                ib6.setInvoiceStatus(rs.getString("invoice_status"));
                al6.add(ib6);
            }
//            retrieve invoices that are expired
            
            

            request.setAttribute("al1", al1);           
            request.setAttribute("al2", al2);           
            request.setAttribute("al3", al3);
            request.setAttribute("al4", al4);
            request.setAttribute("al5", al5);
            request.setAttribute("al6", al6);
            request.getRequestDispatcher("/WEB-INF/client/invoice/client-invoices.jsp").forward(request, response);
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
