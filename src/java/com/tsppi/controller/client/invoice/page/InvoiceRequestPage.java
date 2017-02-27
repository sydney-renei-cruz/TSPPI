/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.invoice.page;

import com.tsppi.controller.bean.ClientBean;
import com.tsppi.controller.bean.PaymentMethodBean;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sydney Cruz
 */
public class InvoiceRequestPage extends HttpServlet {

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
        HttpSession session = request.getSession();
        Connection conn = null;
        PreparedStatement ps;
        ServletContext context = request.getSession().getServletContext();;
        ResultSet rs;
        String inText = "";
        boolean status = false;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            inText = "SELECT a.*, t.account_type, c.* "
                    + "FROM account a "
                    + "JOIN client c ON a.account_num = c.account_num "
                    + "JOIN type_of_account t ON a.account_type_id = t.account_type_id "
                    + "WHERE t.account_type='client' AND a.account_num=?";
            ps = conn.prepareStatement(inText);
            ps.setString(1, (String) session.getAttribute("account_num"));
            rs = ps.executeQuery();
            
            ArrayList<ClientBean> al = new ArrayList<>();
            ClientBean cb;
            while(rs.next()){
                cb = new ClientBean();
                cb.setAccountNum(rs.getInt("account_num"));
                cb.setClientID(rs.getInt("client_id"));
                cb.setFirstName(rs.getString("first_name"));
                cb.setLastName(rs.getString("last_name"));
                cb.setEmail(rs.getString("email"));
                cb.setMobile(rs.getString("mobile"));
                cb.setTelephone(rs.getString("telephone"));
                cb.setAddress(rs.getString("address"));
                al.add(cb);
            }
            request.setAttribute("al", al);
            
            inText = "SELECT * FROM invoice_pm WHERE show_method=?";
            ps = conn.prepareStatement(inText);
            ps.setBoolean(1, status);
            rs = ps.executeQuery();
            ArrayList<PaymentMethodBean> al2 = new ArrayList<>();
            PaymentMethodBean pm;
            while(rs.next()){
                pm = new PaymentMethodBean();
                pm.setPMID(rs.getInt("pm_id"));
                pm.setPaymentMethod(rs.getString("payment_method"));
                al2.add(pm);
            }
            request.setAttribute("al2", al2);
            
            request.getRequestDispatcher("/WEB-INF/client/invoice/invoice-request.jsp").forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
            out.print(e);
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
