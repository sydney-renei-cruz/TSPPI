/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.form.function;

import com.tsppi.controller.account.register.function.RegisterController;
import com.tsppi.controller.bean.AccountBean;
import com.tsppi.controller.bean.CompanyBean;
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
public class RequestCompanyProfileController extends HttpServlet {

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
        HttpSession session1 = request.getSession();
        ResultSet rs = null;
        String inText = "";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String full_name = first_name + " " + last_name;
            
            String company_name = request.getParameter("company_name");
            String company_branch = request.getParameter("company_branch");
            String company_telephone = request.getParameter("company_telephone");
            String street_line1 = request.getParameter("street_line1");
            String street_line2 = request.getParameter("street_line2");
            String spr = request.getParameter("spr"); // state/province/region
            String city = request.getParameter("city");
            String postal_code = request.getParameter("postal_code");
            String country = request.getParameter("country");
            String company_address = "";
            if(!company_name.isEmpty() && !company_branch.isEmpty() && !company_telephone.isEmpty()
                    && !street_line1.isEmpty() && !spr.isEmpty()
                    && !city.isEmpty() && !postal_code.isEmpty() && !country.isEmpty()){
                ArrayList<CompanyBean> al = new ArrayList<>();
                CompanyBean cb = new CompanyBean();
                cb.setStreetLine1(street_line1);
                cb.setStreetLine2(street_line2);
                cb.setCity(city);
                cb.setSPR(spr);
                cb.setPostalCode(Integer.parseInt(postal_code));
                cb.setCountry(country);
                al.add(cb);
                for(int i=0; i<al.size(); i++)
                    company_address = al.get(i).getCompanyAddress();

                context.log("Company Address: " + company_address);
                String content = request.getParameter("message");
                String message = "Hi,\n\n"
                        + "I would like to request for my company to be registered. \n\n"
                        + "Below are the information of my company: \n"
                        + "Company name: " + company_name + "\n"
                        + "Telephone: " + company_telephone + "\n"
                        + "Mailing Address (Specific): \n"
                        + "   Street Line 1: " + street_line1 + "\n"
                        + "   Street Line 2: " + street_line2 + "\n"
                        + "   State/Provice/Region: " + spr + "\n"
                        + "   City: " + city + "\n"
                        + "   Postal Code: " + postal_code + "\n"
                        + "   Country: " + country + "\n\n"
                        + "Feel free to contact the company for any questions. \n\n"
                        + "Regards, \n"
                        + full_name + " - " + email +"\n";

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
                context.log("To: " + to.toString());
                context.log("Message: " + message);

                String from = "TSPPIauto@gmail.com";
                String subject = "***COMPANY REQUEST***";
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
                  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to.toString(), false));
                  msg.setSubject(subject);
                  msg.setText(message);
                  // -- Set some other header information --
                  msg.setHeader("MyMail", "Mr. XYZ" );
                  msg.setSentDate(new Date());
                  // -- Send the message --
                  Transport.send(msg);
                  response.sendRedirect("login");
            }else{
                session1.setAttribute("add_error", "All fields are required");
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
