/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.invoice.function;

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
public class CancelInvoiceController extends HttpServlet {

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
        String inText = "";
        ResultSet rs = null;
        HttpSession session = request.getSession();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            int invoice_id = Integer.parseInt(request.getParameter("invoice_id"));
//            int invoice_id = 1;
            String invoice_status = "Cancelled";
            
            inText = "UPDATE invoice SET invoice_status = ? WHERE invoice_id = ?";
            ps = conn.prepareStatement(inText);
            ps.setString(1, invoice_status);
            ps.setInt(2, invoice_id);
            ps.executeUpdate();
            
            inText = "SELECT product_id, item_quantity "
                    + "FROM invoice_item "
                    + "WHERE invoice_id = ?";
            ps = conn.prepareStatement(inText);
            ps.setInt(1, invoice_id);
            rs = ps.executeQuery();
            
            while(rs.next()){
                inText = "UPDATE product "
                        + "SET stock = stock + ? "
                        + "WHERE product_id = ?";
                ps = conn.prepareStatement(inText);
                ps.setInt(1, rs.getInt("item_quantity"));
                ps.setInt(2, rs.getInt("product_id"));
                ps.executeUpdate();
            }
            inText = "SELECT i.client_id, "
                    + "a.first_name, a.last_name, a.email, c.mobile, "
                    + "co.company_name, co.company_branch, co.company_telephone, "
                    + "ca.street_line1, ca.street_line2, ca.spr, ca.city, ca.postal_code, ca.country "
                    + "FROM invoice i "
                    + "JOIN client c ON c.client_id = i.client_id "
                    + "JOIN account a ON a.account_num = c.account_num "
                    + "JOIN company co ON co.company_id = c.company_id "
                    + "JOIN company_address ca ON ca.company_id = co.company_id "
                    + "WHERE i.invoice_id=?";
            ps = conn.prepareStatement(inText);
            ps.setInt(1, invoice_id);
            rs = ps.executeQuery();

            ArrayList<AccountBean> al = new ArrayList<>();
            AccountBean ab;
            while(rs.next()){
                ab = new AccountBean();
                ab.setFirstName(rs.getString("first_name"));
                ab.setLastName(rs.getString("last_name"));
                ab.setEmail(rs.getString("email"));
                ab.setMobile(rs.getString("mobile"));
                ab.setCompanyName(rs.getString("company_name"));
                ab.setCompanyBranch(rs.getString("company_branch"));
                ab.setCompanyTelephone(rs.getString("company_telephone"));
                ab.setStreetLine1(rs.getString("street_line1"));
                ab.setStreetLine2(rs.getString("street_line2"));
                ab.setSPR(rs.getString("spr"));
                ab.setCity(rs.getString("city"));
                ab.setPostalCode(rs.getInt("postal_code"));
                ab.setCountry(rs.getString("country"));
                al.add(ab);
            }
            
            String full_name = "";
            String mobile = "";
            String email = "";
            String company = "";
            String company_telephone = "";
            String company_address = "";
            for(int i=0; i<al.size(); i++){
                full_name = al.get(i).getFullName();
                email = al.get(i).getEmail();
                mobile = al.get(i).getMobile();
                company = al.get(i).getFullCompany();
                company_telephone = al.get(i).getCompanyTelephone();
                company_address = al.get(i).getCompanyAddress();
//                telephone = al.get(i).getTelephone();
            }
            
            String message = "Hi, \n\n"
                + "We regret to inform you that we will be canceling our invoice. \n"
                + "If you want to know more about the details of why we cancelled our transaction, feel free to contact us. \n\n"
                + "Regards, \n"
                + full_name + " - " + email +"\n"
                + "Mobile No. " + mobile + "\n"
                + "Company: " + company + "\n"
                + "Company Telephone No. " + company_telephone + "\n"
                + "Company Mailing Address: " + company_address;
            String userName = "TSPPIauto@gmail.com";
            String password = "3$tarPaper!";
            inText = "SELECT a.email FROM account a "
                + "JOIN employee e ON e.account_num = a.account_num "
                + "JOIN job_position j ON j.job_id = e.job_id "
                + "WHERE j.sales_score = 1";
            ps = conn.prepareStatement(inText);
            rs = ps.executeQuery();
            ArrayList<AccountBean> al2 = new ArrayList<>();
            AccountBean acb;
            while(rs.next()){
                acb = new AccountBean();
                acb.setEmail(rs.getString("email"));
                al2.add(acb);
                context.log("Email: " + rs.getString("email"));
            }
            StringBuilder to = new StringBuilder();
            for(int i=0; i<al2.size(); i++){
                to.append(al2.get(i).getEmail());
                to.append(", ");
            }
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
              msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to.toString(), true));
              msg.setSubject(subject);
              msg.setText(message);
              // -- Set some other header information --
              msg.setHeader("MyMail", "Mr. XYZ" );
              msg.setSentDate(new Date());
              // -- Send the message --
              Transport.send(msg);
            response.sendRedirect(request.getHeader("referer"));
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
