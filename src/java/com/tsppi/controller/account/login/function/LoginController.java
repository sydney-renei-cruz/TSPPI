/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.account.login.function;

import com.tsppi.controller.account.register.function.RegisterController;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class LoginController extends HttpServlet {

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
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean status = false;
        String pwplaceholder = "";
        String pass = "";
        String newpass= "";
        //conditional if-else >>>> session
        String account_type = "";
        String account_num = "";
        String job_id = "";
        String job_position = "";
        boolean management_score = false;
        boolean sales_score = false;
        boolean inventory_score = false;
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        HttpSession session = request.getSession();
        ServletContext context = request.getSession().getServletContext();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            ps = conn.prepareStatement("SELECT * FROM account WHERE username = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            
            //Try the 10 different Salts
            String[] salts = new String[10];
            salts[0] = "7LsDFJ9oHjDnfUr12";
            salts[1] = "K8oMilIOi0ji43amS";
            salts[2] = "AFIOUVAJNONVASJja";
            salts[3] = "nVaWIdsj19Aij63df";
            salts[4] = "uahRksD47kljnJN9k";
            salts[5] = "dMna7sY01jfIoaPlY";
            salts[6] = "Wg480ioAjEdsf31Ka";
            salts[7] = "gMutRHj70ubQnjB67";
            salts[8] = "gnQiaOhfXquh82z74";
            salts[9] = "mKvqn7834wHjk1kLa";

            MessageDigest md = MessageDigest.getInstance("SHA-256");

            if(rs.next()){
                pass = rs.getString("password");
                status = rs.getBoolean("account_status");
            }
            for(int i = 0; i <= 9; i++){
                pwplaceholder = password + salts[i];
                
                md.update(pwplaceholder.getBytes());
        
                byte byteData[] = md.digest();
                StringBuilder sb = new StringBuilder();
                for(int y = 0; y < byteData.length; y++){
                    sb.append(Integer.toString((byteData[y] & 0xff) + 0x100, 16).substring(1));
                }
                context.log("new password: " + sb.toString());
                //      correct will become TRUE if a match is found
                if(pass.equals(sb.toString())){

                    account_num = rs.getString("account_num");
                    account_type = rs.getString("account_type");

                    if(account_type.equals("employee") ){
                        ps = conn.prepareStatement("SELECT * FROM employee WHERE account_num=?");
                        ps.setString(1, account_num);
                        rs = ps.executeQuery();
                        if(rs.next()) job_id = rs.getString("job_id");

                        ps = conn.prepareStatement("SELECT * FROM job_position WHERE job_id=?");
                        ps.setString(1, job_id);
                        rs = ps.executeQuery();
                        if(rs.next()){
                            job_position = rs.getString("job_type");
                            management_score = rs.getBoolean("management_score");
                            sales_score = rs.getBoolean("sales_score");
                            inventory_score = rs.getBoolean("inventory_score");
                        }
                        session.setAttribute("management_score", management_score);
                        session.setAttribute("sales_score", sales_score);
                        session.setAttribute("inventory_score", inventory_score);
                        session.setAttribute("job_position", job_position);
                    }

                    session.setAttribute("account_num", account_num);
                    session.setAttribute("account_type", account_type);
                    session.setAttribute("account_status", status);
                    session.setAttribute("user", username);
                    session.setMaxInactiveInterval(30*60);

                }
            }
            
            if(!rs.previous()){
                session.setAttribute("login_error", "Incorrect username or password");
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}