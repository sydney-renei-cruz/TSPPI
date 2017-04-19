/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.invoice.function;

import com.tsppi.controller.account.register.function.RegisterController;
import com.tsppi.controller.bean.AccountBean;
import com.tsppi.controller.bean.InvoiceBean;
import com.tsppi.controller.bean.InvoiceItemBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
public class GenerateInvoiceRequestController extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        Connection conn = null;
        PreparedStatement ps = null;
        ServletContext context = request.getSession().getServletContext();
        String inText = "";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            int client_id = Integer.parseInt(request.getParameter("client_id"));
            float total_amount = Float.parseFloat(request.getParameter("total_amount"));
            String[] pi = request.getParameterValues("item_number");
            String[] q = request.getParameterValues("quantity");
            String[] is = request.getParameterValues("item_stock");
            int pm_id = Integer.parseInt(request.getParameter("payment_method"));
            String invoice_status = "Pending";
            boolean verified = false;
            Date date = new Date();
            String invoice_date = new SimpleDateFormat("yyyy-MM-dd").format(date);
            int invoice_id;
            ArrayList<String> product_id = new ArrayList<String>(Arrays.asList(pi));
            product_id.addAll(Arrays.asList(pi));
            ArrayList<String> quantity = new ArrayList<String>(Arrays.asList(q));
            quantity.addAll(Arrays.asList(q));
            ArrayList<String> stock = new ArrayList<String>(Arrays.asList(is));
            stock.addAll(Arrays.asList(is));
            String tracking_id = "";
            //check if quantity is less than or equal to stock
            for(int j=0; j<pi.length; j++){
                if(Integer.parseInt(stock.get(j)) < Integer.parseInt(quantity.get(j))){
                    response.sendRedirect("invoicerequest");
                    return; //exits program
                }
            }
            //check if cart session exists
            if(session.getAttribute("cart") == null){
                response.sendRedirect("products");
                return;
            }
            
            inText = "insert into invoice(client_id, pm_id, tracking_id, total_amount, invoice_status, invoice_date, verified) "
                    + "values(?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, client_id);
            ps.setInt(2, pm_id);
            ps.setString(3, tracking_id);
            ps.setFloat(4, total_amount);
            ps.setString(5, invoice_status);
            ps.setString(6, invoice_date);
            ps.setBoolean(7, verified);
            ps.executeUpdate();
            
            
            
            try(ResultSet generated_keys = ps.getGeneratedKeys()){
                if(generated_keys.next()){
                    invoice_id = generated_keys.getInt(1);
                    
                    String letnum = "0123456789";
                    StringBuilder salt = new StringBuilder();
                    Random rnd = new Random();
                    while (salt.length() < 5) { // length of the random string.
                        int index = (int) (rnd.nextFloat() * letnum.length());
                        salt.append(letnum.charAt(index));
                    }
                    tracking_id = "TSPPIINVREQ-" + salt.toString() + invoice_id;
                    inText = "UPDATE invoice SET tracking_id=? WHERE invoice_id=?";
                    ps = conn.prepareStatement(inText);
                    ps.setString(1, tracking_id);
                    ps.setInt(2, invoice_id);
                    ps.executeUpdate();
                    
                    
                    for(int i=0; i<pi.length; i++){
                        inText = "insert into invoice_item(invoice_id, product_id, item_quantity)"
                                + "values (?,?,?)";
                        ps = conn.prepareStatement(inText);
                        ps.setInt(1, invoice_id);
                        ps.setString(2, product_id.get(i));
                        ps.setString(3, quantity.get(i));
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
                    ResultSet rs = ps.executeQuery();
                    
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
                    
                    inText = "SELECT p.product_name, ii.item_quantity "
                            + "FROM invoice_item ii "
                            + "JOIN product p ON p.product_id = ii.product_id "
                            + "WHERE ii.invoice_id=?";
                    ps = conn.prepareStatement(inText);
                    ps.setInt(1, invoice_id);
                    rs = ps.executeQuery();
                    
                    ArrayList<InvoiceItemBean> al2 = new ArrayList<>();
                    InvoiceItemBean iib;
                    while(rs.next()){
                        iib = new InvoiceItemBean();
                        iib.setProductName(rs.getString("product_name"));
                        iib.setItemQuantity(rs.getInt("item_quantity"));
                        al2.add(iib);
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
                    
                    inText = "SELECT total_amount FROM invoice WHERE invoice_id = ?";
                    ps = conn.prepareStatement(inText);
                    ps.setInt(1, invoice_id);
                    rs = ps.executeQuery();
                    
                    float total_price = 0;
                    while(rs.next())
                        total_price = rs.getFloat("total_amount");
                    StringBuilder msg_content = new StringBuilder();
                    for(int i=0; i<al2.size(); i++){
                        msg_content.append("- ");
                        msg_content.append(al2.get(i).getProductName());
                        msg_content.append(" - ");
                        msg_content.append(al2.get(i).getItemQuantity());
                        msg_content.append("x");
                        msg_content.append("\n");
                    }
                    String message = "Hi, \n\n"
                            + "These are the products, together with the quantity, that I want to buy from your company: \n\n"
                            + msg_content.toString() + "\n\n"
                            + "Total price: " + total_price + "\n"
                            + "Tracking #: " + tracking_id + "\n\n"
                            + "Regards, \n"
                            + full_name + " - " + email +"\n"
                            + "Mobile No. " + mobile +"\n"
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
                    context.log("Message: " + message);
                    ArrayList<AccountBean> al3 = new ArrayList<>();
                    AccountBean acb;
                    while(rs.next()){
                        acb = new AccountBean();
                        acb.setEmail(rs.getString("email"));
                        al3.add(acb);
                        context.log("Email: " + rs.getString("email"));
                    }
                    StringBuilder to = new StringBuilder();
                    for(int i=0; i<al3.size(); i++){
                        to.append(al3.get(i).getEmail());
                        to.append(", ");
                    }
                    
                    context.log("To: " + to);
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
                }else{
                    throw new SQLException("No invoice retrieved");
                }
            }
            session.setAttribute("cart", null);
            
            //update stock
            inText = "select * from invoice_item where invoice_id=?";
            ps = conn.prepareStatement(inText);
            ps.setInt(1, invoice_id);
            
            ResultSet rs = ps.executeQuery();
            ArrayList<InvoiceItemBean> al = new ArrayList<InvoiceItemBean>();
            InvoiceItemBean ib;
            while(rs.next()){
                ib= new InvoiceItemBean();
                ib.setProductID(rs.getInt("product_id"));
                al.add(ib);
            }
            
            inText = "UPDATE product JOIN invoice_item ON product.product_id = invoice_item.product_id "
                        + "SET product.stock = product.stock - invoice_item.item_quantity "
                        + "WHERE product.product_id=? and invoice_item.invoice_id=?";
            for(InvoiceItemBean iib : al){
                ps = conn.prepareStatement(inText);
                ps.setInt(1, iib.getProductID());
                ps.setInt(2, invoice_id);
                ps.executeUpdate();
            }
            
            //update stock
            response.sendRedirect("allinvoices");
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