/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.invoice.page;

import com.tsppi.controller.account.register.function.RegisterController;
import com.tsppi.controller.bean.AccountBean;
import com.tsppi.controller.bean.ClientBean;
import com.tsppi.controller.bean.PaymentMethodBean;
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
        PreparedStatement ps = null;
        ServletContext context = request.getSession().getServletContext();;
        ResultSet rs = null;
        String inText = "";
        boolean status = false;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            inText = "SELECT a.account_num, a.first_name, a.last_name, a.email, "
                + "c.client_id,c.mobile, "
                + "co.company_id, co.company_name, co.company_branch, co.company_telephone, "
                + "ca.address_id, ca.street_line1, ca.street_line2, ca.spr, ca.city, ca.postal_code, ca.country "
                + "FROM account a "
                + "JOIN client c ON c.account_num = a.account_num "
                + "JOIN company co ON co.company_id = c.company_id "
                + "JOIN company_address ca ON ca.company_id = co.company_id "
                + "WHERE a.account_num = ? "
                + "GROUP BY c.account_num ";
            ps = conn.prepareStatement(inText);
            ps.setString(1, (String) session.getAttribute("account_num"));
            rs = ps.executeQuery();
            
            ArrayList<AccountBean> al = new ArrayList<>();
            AccountBean ab;
            while(rs.next()){
                ab = new AccountBean();
                ab.setAccountNum(rs.getInt("account_num"));
                ab.setClientID(rs.getInt("client_id"));
                ab.setFirstName(rs.getString("first_name"));
                ab.setLastName(rs.getString("last_name"));
                ab.setEmail(rs.getString("email"));
                ab.setMobile(rs.getString("mobile"));
                ab.setCompanyID(rs.getInt("company_id"));
                ab.setCompanyName(rs.getString("company_name"));
                ab.setCompanyBranch(rs.getString("company_branch"));
                ab.setCompanyTelephone(rs.getString("company_telephone"));
                ab.setAddressID(rs.getInt("address_id"));
                ab.setStreetLine1(rs.getString("street_line1"));
                ab.setStreetLine2(rs.getString("street_line2"));
                ab.setSPR(rs.getString("spr"));
                ab.setCity(rs.getString("city"));
                ab.setPostalCode(rs.getInt("postal_code"));
                ab.setCountry(rs.getString("country"));
                al.add(ab);
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
