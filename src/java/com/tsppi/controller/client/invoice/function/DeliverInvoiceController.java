/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.invoice.function;

import com.tsppi.controller.bean.AccountBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sydney Cruz
 */
public class DeliverInvoiceController extends HttpServlet {

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
        ServletContext context = request.getSession().getServletContext();
        String inText = "";
        ResultSet rs;
        HttpSession session = request.getSession();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            int invoice_id = Integer.parseInt(request.getParameter("invoice_id"));
//            int invoice_id = 1;
            int status_id = 6;
            
            inText = "UPDATE invoice SET status_id = ? WHERE invoice_id = ?";
            ps = conn.prepareStatement(inText);
            ps.setInt(1, status_id);
            ps.setInt(2, invoice_id);
            ps.executeUpdate();
            
            int account_num = Integer.parseInt((String) session.getAttribute("account_num"));
            inText = "SELECT a.first_name, a.last_name, a.email, j.job_type "
                    + "FROM account a "
                    + "JOIN employee e ON e.account_num = a.account_num "
                    + "JOIN job_position j ON j.job_id = e.job_id "
                    + "WHERE a.account_num = ?";
            ps = conn.prepareStatement(inText);
            ps.setInt(1, account_num);
            rs = ps.executeQuery();
            
            ArrayList<AccountBean> al = new ArrayList<>();
            AccountBean ab;
            while(rs.next()){
                ab = new AccountBean();
                ab.setFirstName(rs.getString("first_name"));
                ab.setLastName(rs.getString("last_name"));
                ab.setEmail(rs.getString("email"));
                ab.setJobType(rs.getString("job_type"));
                al.add(ab);
            }
            
            String full_name = "";
            String job_type = "";
            String email = "";
            for(int i=0; i<al.size(); i++){
                full_name = al.get(i).getFullName();
                email = al.get(i).getEmail();
                job_type = al.get(i).getJobType();
            }
            String message = "Hi, \n\n"
                + "Your invoice is now on delivery stage of our transaction. \n\n"
                + "Regards, \n" 
                + full_name + " - " + email +"\n"
                + job_type;
            String userName = "TSPPIauto@gmail.com";
            String password = "3$tarPaper!";
            String to = "";
            inText = "SELECT a.email FROM account a "
                + "JOIN client c ON c.account_num = a.account_num "
                + "JOIN invoice i ON i.client_id = c.client_id "
                + "WHERE i.invoice_id = ?";
            ps = conn.prepareStatement(inText);
            ps.setInt(1, invoice_id);
            rs = ps.executeQuery();
            while(rs.next()) to = rs.getString("email");

            String from = "TSPPIauto@gmail.com";
            String subject = "***INVOICE REQUEST***";
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
        }catch(Exception e){
            out.print(e);
            e.printStackTrace();
            context.log("Exception: " + e);
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
