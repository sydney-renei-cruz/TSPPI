/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.vp.page;

import com.tsppi.controller.bean.AccountBean;
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
public class AllAccountPage extends HttpServlet {

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
//            client account retrieval
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            inText = "SELECT a.*, t.account_type, c.mobile, c.telephone, c.address "
                    + "FROM account a "
                    + "JOIN client c ON a.account_num = c.account_num "
                    + "JOIN type_of_account t ON a.account_type_id = t.account_type_id "
                    + "WHERE t.account_type='client'";
            
            ps = conn.prepareStatement(inText);
            rs = ps.executeQuery();
            ArrayList<AccountBean> cb = new ArrayList<>();
            AccountBean aa;
            while(rs.next()){
                aa = new AccountBean();
                aa.setAccountNum(rs.getInt("account_num"));
                aa.setUsername(rs.getString("username"));
                aa.setPassword(rs.getString("password"));
                aa.setFirstName(rs.getString("first_name"));
                aa.setLastName(rs.getString("last_name"));
                aa.setEmail(rs.getString("email"));
                aa.setMobile(rs.getString("mobile"));
                aa.setTelephone(rs.getString("telephone"));
                aa.setAddress(rs.getString("address"));
                aa.setAccountType(rs.getString("account_type"));
                aa.setAccountStatus(rs.getBoolean("account_status"));
                cb.add(aa);
            }
            request.setAttribute("cb", cb);
//            client account retrieval

//            employee account retrieval
            inText = "SELECT a.*, t.account_type, j.job_type "
                    + "FROM account a "
                    + "JOIN type_of_account t ON a.account_type_id = t.account_type_id "
                    + "JOIN employee e ON a.account_num = e.account_num "
                    + "JOIN job_position j ON e.job_id = j.job_id "
                    + "WHERE t.account_type='employee'";
            ps = conn.prepareStatement(inText);
            rs = ps.executeQuery();
            ArrayList<AccountBean> eb = new ArrayList<>();
            while(rs.next()){
                aa = new AccountBean();
                aa.setAccountNum(rs.getInt("account_num"));
                aa.setUsername(rs.getString("username"));
                aa.setPassword(rs.getString("password"));
                aa.setFirstName(rs.getString("first_name"));
                aa.setLastName(rs.getString("last_name"));
                aa.setEmail(rs.getString("email"));
                aa.setAccountType(rs.getString("account_type"));
                aa.setJobType(rs.getString("job_type"));
                aa.setAccountStatus(rs.getBoolean("account_status"));
                eb.add(aa);
            }
            request.setAttribute("eb", eb);
//            employee account retrieval
            request.getRequestDispatcher("/WEB-INF/vp/page/all-accounts.jsp").forward(request,response);
        }catch(Exception e){
            e.printStackTrace();
            out.print(e);
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
