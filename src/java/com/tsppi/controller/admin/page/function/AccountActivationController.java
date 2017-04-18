/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.admin.page.function;

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
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
public class AccountActivationController extends HttpServlet {

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
        ResultSet rs = null;
        ServletContext context = request.getSession().getServletContext();
        String inText = "";
        HttpSession session = request.getSession();
        int success = 0;
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            Boolean account_status = Boolean.parseBoolean(request.getParameter("account_status"));
            int account_num = Integer.parseInt(request.getParameter("account_num"));
            context.log("account status: " + account_status);
            context.log("account number: " + account_num);
            context.log("converted status: " + !account_status);
            
            inText = "UPDATE account SET account_status=? WHERE account_num=?";
            ps = conn.prepareStatement(inText);
            ps.setBoolean(1, !account_status);
            ps.setInt(2, account_num);
            success = ps.executeUpdate();
            
            if(success > 0){
                inText = "SELECT username, first_name, last_name, email, account_status FROM account WHERE account_num=?";
                ps = conn.prepareStatement(inText);
                ps.setInt(1, account_num);
                rs = ps.executeQuery();
                
                ArrayList<AccountBean> al = new ArrayList<>();
                AccountBean ab;
                String email = "";
                boolean retrieved_as = false;
                while(rs.next()){
                    ab = new AccountBean();
                    ab.setUsername(rs.getString("username"));
                    ab.setFirstName(rs.getString("first_name"));
                    ab.setLastName(rs.getString("last_name"));
                    ab.setEmail(rs.getString("email"));
                    ab.setAccountStatus(rs.getBoolean("account_status"));
                    al.add(ab);
                }
                for(AccountBean acb : al){
                    email = acb.getEmail();
                    retrieved_as = acb.getAccountStatus();
                }
                String message = "";
                if(retrieved_as == true){
                    message = "Hi,\n\n"
                        + "Your account has been activated, you may now use your account. \n\n"
                        + "Regards. \n";
                }else{
                    message = "Hi,\n\n"
                        + "Your account has been deactivated, please contact the administrator to address this situation. \n\n"
                        + "Regards. \n";
                }
                String userName = "TSPPIauto@gmail.com";
                String password = "3$tarPaper!";
                String to = email;
                String from = "TSPPIauto@gmail.com";
                String subject = "***ACCOUNT***";
                String smtpServ = "smtp.gmail.com";
                int port = 465;

                Properties props = System.getProperties();
                  // -- Attaching to default Session, or we could start a new one --
                  props.put("mail.transport.protocol", "smtp" );
                  props.put("mail.smtp.starttls.enable","true" );
                  props.put("mail.imap.ssl.enable", "true");
                  props.put("mail.imap.sasl.enable", "true");
                  props.put("mail.imap.auth.login.disable", "true");
                  props.put("mail.imap.auth.plain.disable", "true");
                  props.put("mail.imap.auth.mechanisms", "XOAUTH2");
                  props.put("mail.smtp.host",smtpServ);
                  props.put("mail.smtp.auth", "true" );
                  props.put("mail.smtp.port", "587");
                  Authenticator auth;
                    auth = new Authenticator() {
                    @Override
                    public PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(userName, password);
                    }
                    };
                  Session session1 = Session.getInstance(props, auth);
                  // -- Create a new message --
                  Message msg = new MimeMessage(session1);
                  // -- Set the FROM and TO fields --
                  msg.setFrom(new InternetAddress(from));
                  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
                  msg.setSubject(subject);
                  msg.setText(message);
                  // -- Set some other header information --
                  msg.setHeader("MyMail", "Mr. XYZ" );
                  msg.setSentDate(new Date());
                  // -- Send the message --
                  Transport.send(msg);
                  response.sendRedirect(request.getHeader("referer"));
                  return;
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
