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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class AddCompanyController extends HttpServlet {

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
        ServletContext context = request.getSession().getServletContext();;
        String inText = "";
        int success = 0;
        HttpSession session = request.getSession();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String company_name = request.getParameter("company_name");
            String company_branch = request.getParameter("company_branch");
            String company_telephone = request.getParameter("company_telephone");
            String street_line1 = request.getParameter("street_line1");
            String street_line2 = request.getParameter("street_line2");
            String spr = request.getParameter("spr"); // state/province/region
            String city = request.getParameter("city");
            String postal_code = request.getParameter("postal_code");
            String country = request.getParameter("country");
            if(!company_name.isEmpty() && !company_branch.isEmpty() && !company_telephone.isEmpty()
                    && !street_line1.isEmpty() && !spr.isEmpty()
                    && !city.isEmpty() && !postal_code.isEmpty() && !country.isEmpty()){
                inText = "INSERT INTO company (company_name, company_branch, company_telephone) VALUES (?,?,?)";
                ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, company_name);
                ps.setString(2, company_branch);
                ps.setString(3, company_telephone);
                success = ps.executeUpdate();

                int cid;
                try(ResultSet generated_keys = ps.getGeneratedKeys()){
                    if(generated_keys.next()){
                        cid = generated_keys.getInt(1);
                        inText = "INSERT INTO company_address (company_id, street_line1, street_line2, spr, city, postal_code, country) "
                                + "VALUES (?,?,?,?,?,?,?)";
                        ps = conn.prepareStatement(inText);
                        ps.setInt(1, cid);
                        ps.setString(2, street_line1);
                        ps.setString(3, street_line2);
                        ps.setString(4, spr);
                        ps.setString(5, city);
                        ps.setString(6, postal_code);
                        ps.setString(7, country);
                        success = ps.executeUpdate();
                    }
                }
            }else{
                session.setAttribute("error_msg", "All fields are required");
                response.sendRedirect(request.getHeader("referer"));
                return;
            }
            
            
            if(success>0){
                session.setAttribute("success_msg", "Company profile has been added");
                response.sendRedirect(request.getHeader("referer"));
            }else{
                session.setAttribute("error_msg", "Please review the fields");
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
