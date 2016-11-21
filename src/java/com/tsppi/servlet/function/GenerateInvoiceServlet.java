/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.servlet.function;

import com.tsppi.bean.InvoiceItemBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Date;
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
public class GenerateInvoiceServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        Connection conn = null;
        PreparedStatement ps;
        ServletContext context;
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        
        int client_id = Integer.parseInt(request.getParameter("client_id"));
        float total_amount = Float.parseFloat(request.getParameter("total_amount"));
        String[] pi = request.getParameterValues("item_number");
        String[] q = request.getParameterValues("quantity");
        int pm_id = Integer.parseInt(request.getParameter("payment_method"));
        int invoice_status = 1;
        Date date = new Date();
        String invoice_date = new SimpleDateFormat("yyyy-MM-dd").format(date);
        
    
        
        try{

            if(session.getAttribute("cart") == null){
                request.setAttribute("message", "Invoice is nullified, no items found.");
                return;
            }
            
            ps = conn.prepareStatement("insert into invoice(client_id, status_id, pm_id, total_amount, invoice_date)"
                    + "values(?,?,?,?,?)", 
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, client_id);
            ps.setInt(2, invoice_status);
            ps.setInt(3, pm_id);
            ps.setFloat(4, total_amount);
            ps.setString(5, invoice_date);
            ps.executeUpdate();
            
            int invoice_id;
            
            ArrayList<String> product_id = new ArrayList<String>(Arrays.asList(pi));
            product_id.addAll(Arrays.asList(pi));
            ArrayList<String> quantity = new ArrayList<String>(Arrays.asList(q));
            quantity.addAll(Arrays.asList(q));
            try(ResultSet generated_keys = ps.getGeneratedKeys()){
                if(generated_keys.next()){
                    invoice_id = generated_keys.getInt(1);
                    
                    for(int i=0; i<pi.length; i++){
                        ps = conn.prepareStatement("insert into invoice_item(invoice_id, product_id, item_quantity)"
                                + "values (?,?,?)");
                        ps.setInt(1, invoice_id);
                        ps.setString(2, product_id.get(i));
                        ps.setString(3, quantity.get(i));
                        ps.executeUpdate();
                    }
                }else{
                    throw new SQLException("No invoice retrieved");
                }
            }
            
            session.setAttribute("cart", null);
            
            ps = conn.prepareStatement("select * from invoice_item where invoice_id=?");
            ps.setInt(1, invoice_id);
            
            ResultSet rs = ps.executeQuery();
            ArrayList<InvoiceItemBean> al = new ArrayList<InvoiceItemBean>();
            InvoiceItemBean ib;
            while(rs.next()){
                ib= new InvoiceItemBean();
                ib.setProductID(rs.getInt("product_id"));
                al.add(ib);
            }
            
            for(InvoiceItemBean iib : al){
                ps = conn.prepareStatement("UPDATE product JOIN invoice_item ON product.product_id = invoice_item.product_id "
                        + "SET product.stock = product.stock - invoice_item.item_quantity "
                        + "WHERE product.product_id=? and invoice_item.invoice_id=?");
                ps.setInt(1, iib.getProductID());
                ps.setInt(2, invoice_id);
                ps.executeUpdate();
            }
            
            response.sendRedirect("profile");
        }catch(Exception e){
            out.println(e);
            e.printStackTrace();
        }
        
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
