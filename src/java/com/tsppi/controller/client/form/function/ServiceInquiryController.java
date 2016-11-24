/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.form.function;

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
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
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
public class ServiceInquiryController extends HttpServlet {

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
        
        HttpSession session1 = request.getSession();
        PrintWriter out = response.getWriter();
        Connection conn = null;
        PreparedStatement ps;
        ServletContext context;
        ResultSet rs;
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String account_num = (String) session1.getAttribute("account_num");
            String service_name = request.getParameter("service_name");
            String inText = "";
            
            inText = "SELECT a.first_name, a.last_name, a.email, c.mobile, c.telephone "
                    + "FROM account a "
                    + "JOIN client c ON c.account_num = a.account_num "
                    + "WHERE a.account_num=?";
            ps = conn.prepareStatement(inText);
            ps.setString(1, account_num);
            rs = ps.executeQuery();
            
            ArrayList<AccountBean> al = new ArrayList<>();
            AccountBean aab;
            while(rs.next()){
                aab = new AccountBean();
                aab.setFirstName(rs.getString("first_name"));
                aab.setLastName(rs.getString("last_name"));
                aab.setEmail(rs.getString("email"));
                aab.setMobile(rs.getString("mobile"));
                aab.setTelephone(rs.getString("telephone"));
                al.add(aab);
            }
            
            
            String full_name = "";
            String mobile = "";
            String telephone = "";
            String email = "";
            for(int i=0; i<al.size(); i++){
                full_name = al.get(i).getFullName();
                email = al.get(i).getEmail();
                mobile = al.get(i).getMobile();
                telephone = al.get(i).getTelephone();
            }
            String content = request.getParameter("message");
            String message = "Hi,\n\n"
                    + "I would like to inquire for your service, " + service_name +".\n"
                    + content + "\n\n\n"
                    + "Regards,\n"
                    + full_name + " - " + email +"\n"
                    + "Mobile No. " + mobile +"\n"
                    + "Telephone No. " + telephone;
            
            String userName = "TSPPIauto@gmail.com";
            String password = "3$tarPaper!";
            String to = "";
            inText = "SELECT a.email FROM account a "
                    + "JOIN employee e ON e.account_num = a.account_num "
                    + "JOIN job_position j ON j.job_id = e.job_id "
                    + "WHERE j.job_type = 'Vice President'";
            ps = conn.prepareStatement(inText);
            rs = ps.executeQuery();
            while(rs.next()) to = rs.getString("email");
            
            String from = "TSPPIauto@gmail.com";
            String subject = "***SERVICE INQUIRY***";
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
              Session session = Session.getInstance(props, auth);
              // -- Create a new message --
              Message msg = new MimeMessage(session);
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
              response.sendRedirect("services");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
// Also include an inner class that is used for authentication purposes

private class SMTPAuthenticator extends javax.mail.Authenticator {
        public PasswordAuthentication getPasswordAuthentication() {
            String username =  "TSPPIauto@gmail.com";           // specify your email id here (sender's email id)
            String password = "3$tarPaper!";                                      // specify your password here
            return new PasswordAuthentication(username, password);
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
