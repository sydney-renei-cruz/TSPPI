/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.mngt.form.function;

import com.tsppi.controller.account.register.function.RegisterController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
public class EditCompanyController extends HttpServlet {

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
        int success = 0;
        HttpSession session = request.getSession();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String company_id = request.getParameter("company_id");
            String company_name = request.getParameter("company_name");
            String company_branch = request.getParameter("company_branch");
            String company_telephone = request.getParameter("company_telephone");
            String street_line1 = request.getParameter("street_line1");
            String street_line2 = request.getParameter("street_line2");
            String spr = request.getParameter("spr"); // state/province/region
            String city = request.getParameter("city");
            String postal_code = request.getParameter("postal_code");
            String country = request.getParameter("country");
            
            if(!company_name.equals("")){
                ps = conn.prepareStatement("UPDATE company SET company_name = ? WHERE company_id = ?");
                ps.setString(1, company_name);
                ps.setString(2, company_id);
                success = ps.executeUpdate();
            }
            if(!company_branch.equals("")){
                ps = conn.prepareStatement("UPDATE company SET company_branch = ? WHERE company_id = ?");
                ps.setString(1, company_branch);
                ps.setString(2, company_id);
                success = ps.executeUpdate();
            }
            if(!company_telephone.equals("")){
                ps = conn.prepareStatement("UPDATE company SET company_telephone = ? WHERE company_id = ?");
                ps.setString(1, company_telephone);
                ps.setString(2, company_id);
                success = ps.executeUpdate();
            }
            if(!street_line1.equals("")){
                ps = conn.prepareStatement("UPDATE company_address SET street_line1 = ? WHERE company_id = ?");
                ps.setString(1, street_line1);
                ps.setString(2, company_id);
                success = ps.executeUpdate();
            }
            if(!street_line2.equals("")){
                ps = conn.prepareStatement("UPDATE company_address SET street_line2 = ? WHERE company_id = ?");
                ps.setString(1, street_line2);
                ps.setString(2, company_id);
                success = ps.executeUpdate();
            }
            if(!spr.equals("")){
                ps = conn.prepareStatement("UPDATE company_address SET spr = ? WHERE company_id = ?");
                ps.setString(1, spr);
                ps.setString(2, company_id);
                success = ps.executeUpdate();
            }
            if(!city.equals("")){
                ps = conn.prepareStatement("UPDATE company_address SET city = ? WHERE company_id = ?");
                ps.setString(1, city);
                ps.setString(2, company_id);
                success = ps.executeUpdate();
            }
            if(!postal_code.equals("")){
                ps = conn.prepareStatement("UPDATE company_address SET postal_code = ? WHERE company_id = ?");
                ps.setString(1, postal_code);
                ps.setString(2, company_id);
                success = ps.executeUpdate();
            }
            if(!country.equals("")){
                ps = conn.prepareStatement("UPDATE company_address SET country = ? WHERE company_id = ?");
                ps.setString(1, country);
                ps.setString(2, company_id);
                success = ps.executeUpdate();
            }
            if(success > 0){
                response.sendRedirect("allcompany");
            }else{
                session.setAttribute("edit_error", "Please review the fields");
                response.sendRedirect(request.getHeader("referer"));
            }
            
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
