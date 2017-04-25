/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.admin.form.function;

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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sydney Cruz
 */
public class AddJobPositionController extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement ps = null;
        ServletContext context = request.getSession().getServletContext();;
        String inText = "";
        HttpSession session = request.getSession();
        int success = 0;
        
        String management_score = request.getParameter("management_score");
        String sales_score = request.getParameter("sales_score");
        String inventory_score = request.getParameter("inventory_score");
        boolean ms = false;
        boolean ss = false;
        boolean is = false;
        boolean show_job = true;
        String job_type = request.getParameter("job_type");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            if(!job_type.isEmpty() && !management_score.isEmpty() && !sales_score.isEmpty() && !inventory_score.isEmpty()){
                if(Integer.parseInt(management_score) != 0){
                    ms = true;
                }
                if(Integer.parseInt(inventory_score) != 0){
                    is = true;
                }
                if(Integer.parseInt(sales_score) != 0){
                    ss = true;
                }
                
                inText = "INSERT INTO job_position (job_type, management_score, sales_score, inventory_score, show_job) VALUES (?,?,?,?,?)";
                ps = conn.prepareStatement(inText);
                ps.setString(1, job_type);
                ps.setBoolean(2, ms);
                ps.setBoolean(3, ss);
                ps.setBoolean(4, is);
                ps.setBoolean(5, show_job);
                success = ps.executeUpdate();
            }else{
                session.setAttribute("error_msg", "All fields are required");
                response.sendRedirect(request.getHeader("referer"));
                return;
            }
            if(success > 0){
                session.setAttribute("success_msg", "Job position has been created");
                String mssgScore = "1";
                Cookie mssgStatus=new Cookie("regMssg",mssgScore);
                mssgStatus.setMaxAge(1);
                response.addCookie(mssgStatus);
                response.sendRedirect(request.getHeader("referer"));
            }else{
                session.setAttribute("error_msg", "Please review the fields");
                response.sendRedirect(request.getHeader("referer"));
            }
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
