/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.account.profile.page;

import com.tsppi.controller.account.register.function.RegisterController;
import com.tsppi.controller.bean.AccountBean;
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
public class ProfilePage extends HttpServlet {

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
        PreparedStatement ps = null;
        ServletContext context = request.getSession().getServletContext();
        ResultSet rs = null;
        HttpSession session = request.getSession();
        String inText = "";
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            if(session.getAttribute("account_type").equals("client")){
                inText = "SELECT a.*, c.mobile, "
                        + "co.company_id, co.company_name, co.company_branch, co.company_telephone, "
                        + "ca.address_id, ca.street_line1, ca.street_line2, ca.spr, ca.city, ca.postal_code, ca.country "
                        + "FROM account a "
                        + "JOIN client c ON c.account_num = a.account_num "
                        + "JOIN company co ON co.company_id = c.company_id "
                        + "JOIN company_address ca ON ca.company_id = co.company_id "
                        + "WHERE a.account_num = ? "
                        + "GROUP BY c.account_num ";
            }
            else{
                inText = "SELECT * FROM account "
                        + "WHERE account_num=?";
            }
            ps = conn.prepareStatement(inText);
            ps.setString(1, (String)session.getAttribute("account_num"));
            rs = ps.executeQuery();
            
            ArrayList<AccountBean> al = new ArrayList<>();
            AccountBean aa;
            while(rs.next()){
                aa = new AccountBean();
                aa.setAccountNum(rs.getInt("account_num"));
                aa.setUsername(rs.getString("username"));
                aa.setFirstName(rs.getString("first_name"));
                aa.setLastName(rs.getString("last_name"));
                aa.setEmail(rs.getString("email"));
                if(session.getAttribute("account_type").equals("client")){
                    aa.setMobile(rs.getString("mobile"));
                    aa.setCompanyID(rs.getInt("company_id"));
                    aa.setCompanyName(rs.getString("company_name"));
                    aa.setCompanyBranch(rs.getString("company_branch"));
                    aa.setCompanyTelephone(rs.getString("company_telephone"));
                    aa.setAddressID(rs.getInt("address_id"));
                    aa.setStreetLine1(rs.getString("street_line1"));
                    aa.setStreetLine2(rs.getString("street_line2"));
                    aa.setSPR(rs.getString("spr"));
                    aa.setCity(rs.getString("city"));
                    aa.setPostalCode(rs.getInt("postal_code"));
                    aa.setCountry(rs.getString("country"));
//                    aa.setTelephone(rs.getString("telephone"));
//                    aa.setAddress(rs.getString("address"));
                }
                al.add(aa);
            }
            request.setAttribute("al", al);
            request.getRequestDispatcher("/WEB-INF/account/page/profile.jsp").forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
            out.print(e);
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
