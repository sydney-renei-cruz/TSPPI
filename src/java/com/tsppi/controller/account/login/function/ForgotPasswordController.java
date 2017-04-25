/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.account.login.function;

import com.tsppi.controller.account.register.function.RegisterController;
import com.tsppi.controller.bean.AccountBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sydney Cruz
 */
public class ForgotPasswordController extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        ServletContext context = request.getSession().getServletContext();
        Connection conn = null;
        PreparedStatement ps = null;
        String inText;
        ResultSet rs = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            
            if(!email.isEmpty() && !username.isEmpty()){
                inText = "SELECT * FROM account WHERE email = ? AND username = ?";
                ps = conn.prepareStatement(inText);
                ps.setString(1, email);
                ps.setString(2, username);
                rs = ps.executeQuery();
                if(rs.next()){
                    String account_num = rs.getString("account_num");
                    boolean account_status = rs.getBoolean("account_status");
                    context.log("account status: " + account_status);
                    context.log("Account Num:" + account_num);
                    context.log("Forgot Password: " + rs.getString("forgot"));
                    if(account_status == false){
                        session.setAttribute("error_msg", "Your account is deactivated, kindly contact the administrator.");
                        response.sendRedirect(request.getHeader("referer"));
                        return;
                    }
                    if(rs.getString("forgot") == null){
                        String userName = "TSPPIauto@gmail.com";
                        String password = "3$tarPaper!";
                        String to = email;
                        String from = "TSPPIauto@gmail.com";
                        String subject = "***RESET PASSWORD***";
                        String smtpServ = "smtp.gmail.com";
                        //Salts for the hashing

                        String hashedEmail = to;
                        MessageDigest md = MessageDigest.getInstance("SHA-256");
                        md.update(hashedEmail.getBytes());
                        byte byteData[] = md.digest();
                        StringBuffer sb = new StringBuffer();
                        for(int i = 0; i < byteData.length; i++){
                            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
                        }
                        hashedEmail = sb.toString();
                        //End Hashing
                        inText = "UPDATE account SET forgot = ? WHERE account_num=?";
                        ps = conn.prepareStatement(inText);
                        ps.setString(1, hashedEmail);
                        ps.setString(2, account_num);
                        ps.executeUpdate();

                        String message = "Please click on the following link to change your TSPPI account password:\n <a href='http://localhost:8084/main_tsppi/forgotpassword2?id=" + hashedEmail + "'>Change Password</a>";

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
                        //  -- Set Body part --
                        MimeBodyPart messageBodyPart = new MimeBodyPart();
                        Session session2 = Session.getInstance(props, auth);
                        Message msg = new MimeMessage(session2);
                        // -- Set the FROM and TO fields --
                        msg.setFrom(new InternetAddress(from));
                        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
                        msg.setSubject(subject);
                        messageBodyPart.setText(message, "UTF-8", "html");
                        // -- Put Body part in message --
                        MimeMultipart multipart = new MimeMultipart();
                        multipart.addBodyPart(messageBodyPart);
                        msg.setContent(multipart);
                        // -- Set some other header information --
                        msg.setHeader("MyMail", "Mr. XYZ" );
                        msg.setSentDate(new Date());
                        // -- Send the message --
                        Transport.send(msg);
                        response.sendRedirect("forgotpassword3");
                        
                    }else{
                        session.setAttribute("error_msg", "You have an existing link, please use it.");
                        response.sendRedirect(request.getHeader("referer"));
                    }
                }else{
                    session.setAttribute("error_msg", "Incorrect Email or Username");
                    response.sendRedirect(request.getHeader("referer"));
                }
               
            }else{
                session.setAttribute("error_msg", "All fields are required");
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
