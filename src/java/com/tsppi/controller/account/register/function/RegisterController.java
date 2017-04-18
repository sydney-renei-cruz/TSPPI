/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.account.register.function;

import com.tsppi.controller.bean.AccountBean;
import com.tsppi.controller.bean.AdminBean;
import com.tsppi.controller.bean.CompanyBean;
import com.tsppi.controller.bean.EmployeeBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
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
public class RegisterController extends HttpServlet {

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
        ResultSet rs; 
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            context.log("Exception: " + e);
            request.setAttribute("error", e);
            request.getRequestDispatcher("/WEB-INF/error/catch-error.jsp").forward(request, response);
        }
        try{
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile_number");
            String telephone = request.getParameter("telephone_number");
            String address = request.getParameter("address");
            String account_type = request.getParameter("account_type");
            String job_id = request.getParameter("job_id");
            String company_name = request.getParameter("company_name");
            String company_branch = request.getParameter("company_branch");
            String old_password = password;
            int company_id = 0;
            Date date = new Date();
            String time_registered = new SimpleDateFormat("yyyy-MM-dd").format(date);
            Boolean account_status = true;
            int last_id = 0;
            
            int success = 0;
            ArrayList<AccountBean> al = new ArrayList<>();
            AccountBean ab = new AccountBean();
            if(account_type.equals("client") && !company_name.isEmpty() && !company_branch.isEmpty()){
                inText = "SELECT c.*, ca.* "
                + "FROM company c "
                + "JOIN company_address ca ON ca.company_id = c.company_id "
                + "WHERE c.company_name LIKE ? AND c.company_branch LIKE ? "
                + "LIMIT 1";
                ps = conn.prepareStatement(inText);
                ps.setString(1, "%" + company_name+ "%");
                ps.setString(2, "%" + company_branch + "%");
                rs = ps.executeQuery();
                if(rs.next()){
                    company_id = rs.getInt("company_id");
                    ab.setFirstName(first_name);
                    ab.setLastName(last_name);
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
                }else{
                    session.setAttribute("register_error", "All fields are required");
                    response.sendRedirect("register");
                    return;
                }
            }
            String placeholder = "";
            //Salts for the hashing
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
            Random rand = new Random();
            placeholder = password + salts[rand.nextInt(10)];
            //End Salting
            
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(placeholder.getBytes());
            byte byteData[] = md.digest();
            StringBuffer sb = new StringBuffer();
            for(int i = 0; i < byteData.length; i++){
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            password = sb.toString();
            
            if(!account_type.isEmpty() && !username.isEmpty() && !password.isEmpty() 
                && !first_name.isEmpty() && !last_name.isEmpty() && !email.isEmpty()){
                inText = " INSERT INTO account "
                    + "(account_type, username, password, first_name, last_name, "
                    + "email, account_status, time_registered) "
                    + "VALUES (?,?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, account_type);
                ps.setString(2, username);
                ps.setString(3, password);
                ps.setString(4, first_name);
                ps.setString(5, last_name);
                ps.setString(6, email);
                ps.setBoolean(7, account_status);
                ps.setString(8, time_registered);
                success = ps.executeUpdate();
                
                try(ResultSet generated_keys = ps.getGeneratedKeys()){
                    if(generated_keys.next()){
                        last_id = generated_keys.getInt(1);
                    }
                }
                context.log("Last ID Inserted: " + last_id);
            }else{
                session.setAttribute("register_error", "All fields are required");
                response.sendRedirect("register");
                return;
            }
            //image upload with blob
//            InputStream inputStream = null;
//            Part filePart = request.getPart("account_image");
//            if(filePart.getSize() != 0){
//                inputStream = filePart.getInputStream();
//            }           
//            if(filePart.getSize() != 0){
//                inText = "INSERT INTO account "
//                    + "(username, password, first_name, last_name, email, account_type_id, account_status, time_registered, account_image) "
//                    + "VALUES (?,?,?,?,?,?,?,?,?)";
//                ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
//                ps.setBlob(9, inputStream);
//            }else{
//                inText = "INSERT INTO account "
//                    + "(username, password, first_name, last_name, email, account_type_id, account_status, time_registered) "
//                    + "VALUES (?,?,?,?,?,?,?,?)";
//                ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
//            }
//            try(ResultSet generated_keys = ps.getGeneratedKeys()){
//                if(generated_keys.next()){
//                    id = generated_keys.getInt(1);
//                    if(filePart.getSize() != 0){
//                        String imagePath = context.getInitParameter("imgPath") + "account\\" + id + ".png";
//                        File file = new File(imagePath);
//                        
//                        FileOutputStream outFile = new FileOutputStream(file);
//                        inputStream = filePart.getInputStream();
//                        
//                        int read = 0;
//                        int bufferSize = 1024;
//                        byte[] buffer = new byte[bufferSize];
//                        while((read = inputStream.read(buffer)) != -1){
//                            outFile.write(buffer, 0, read);
//                        }
//                        inputStream.close();
//                        outFile.close();
//                    }
//                }
//            }
            //email configuration
            String mail_username = "TSPPIauto@gmail.com";
            String mail_password = "3$tarPaper!";
            String message = "";
            String from = "TSPPIauto@gmail.com";
            String subject = "***ACCOUNT***";
            String smtpServ = "smtp.gmail.com";
            int port = 465;
            Properties props = System.getProperties();
            Authenticator auth;
            Session session1 = null;
            Message msg = null;
            String full_name = "";
            
            if(account_type.equals("admin")){
                inText = "INSERT INTO " + account_type + " (account_num) VALUES (?)";
                ps = conn.prepareStatement(inText);
                ps.setInt(1, last_id);
                success = ps.executeUpdate();
            }else if (account_type.equals("employee")){
                inText = "INSERT INTO " + account_type + " (account_num, job_id) VALUES (?,?)";
                ps = conn.prepareStatement(inText);
                ps.setInt(1, last_id);
                ps.setString(2, job_id);
                success = ps.executeUpdate();
                
                String account_num = (String) session.getAttribute("account_num");
                context.log(account_num);
                inText = "SELECT first_name, last_name "
                        + "FROM account "
                        + "WHERE account_num=?";
                ps = conn.prepareStatement(inText);
                ps.setString(1, account_num);
                rs = ps.executeQuery();
                al = new ArrayList<>();
                while(rs.next()){
                    ab = new AccountBean();
                    ab.setFirstName(rs.getString("first_name"));
                    ab.setLastName(rs.getString("last_name"));
                    al.add(ab);
                }
                for(AccountBean acb : al)
                    full_name = acb.getFullName();
                
                message = "Hi, \n\n"
                    + "This is to inform you that you can now access the system. \n"
                    + "Below are your accound credentials: \n\n"
                    + "Username: " + username + "\n"
                    + "Temporary Password: " + old_password + "\n\n"
                    + "We advice you to update your profile immidiately to avoid any possible problems. \n\n"
                    + "Regards, \n"
                    + full_name;
                String to_employee = email;
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

                auth = new Authenticator() {
                  @Override
                  public PasswordAuthentication getPasswordAuthentication() {
                      return new PasswordAuthentication(mail_username, mail_password);
                  }
                };
                session1 = Session.getInstance(props, auth);
                // -- Create a new message --
                msg = new MimeMessage(session1);
                // -- Set the FROM and TO fields --
                msg.setFrom(new InternetAddress(from));
                msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to_employee, true));
                msg.setSubject(subject);
                msg.setText(message);
                // -- Set some other header information --
                msg.setHeader("MyMail", "Mr. XYZ" );
                msg.setSentDate(new Date());
                // -- Send the message --
                Transport.send(msg);
            }else{
                if(!mobile.isEmpty() || !telephone.isEmpty() || !address.isEmpty()){
                    account_status = false;
                    inText = "UPDATE account SET account_status=? WHERE account_num=?";
                    ps = conn.prepareStatement(inText);
                    ps.setBoolean(1, account_status);
                    ps.setInt(2, last_id);
                    success = ps.executeUpdate();
                    
                    inText = "INSERT INTO " + account_type + " (account_num, company_id, mobile) VALUES (?,?,?)";
                    ps = conn.prepareStatement(inText);
                    ps.setInt(1, last_id);
                    ps.setInt(2, company_id);
                    ps.setString(3, mobile);
                    success = ps.executeUpdate();
                    
                    full_name = "";
                    String company = "";
                    String company_telephone = "";
                    String company_address = "";
                    for(int i=0; i<al.size(); i++){
                        full_name = al.get(i).getFullName();
                        company = al.get(i).getFullCompany();
                        company_telephone = al.get(i).getCompanyTelephone();
                        company_address = al.get(i).getCompanyAddress();
        //                telephone = al.get(i).getTelephone();
                    }
                    message = "Hi, \n\n"
                        + "I would like to request this account to be approved. \n"
                        + "I want to use the services offered by your web application. \n\n"
                        + "Regards, \n"
                        + full_name + " - " + email +"\n"
                        + "Mobile No. " + mobile + "\n"
                        + "Company: " + company + "\n"
                        + "Company Telephone No. " + company_telephone + "\n"
                        + "Company Mailing Address: " + company_address;
                    inText = "SELECT a.email FROM account a "
                        + "JOIN employee e ON e.account_num = a.account_num "
                        + "JOIN job_position j ON j.job_id = e.job_id "
                        + "WHERE j.management_score = 1";
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
                    
                    auth = new Authenticator() {
                      @Override
                      public PasswordAuthentication getPasswordAuthentication() {
                          return new PasswordAuthentication(mail_username, mail_password);
                      }
                    };
                    session1 = Session.getInstance(props, auth);
                    // -- Create a new message --
                    msg = new MimeMessage(session1);
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
                }
            }
            if(success == 0){
                session.setAttribute("register_error", "Please review the fields");
                response.sendRedirect(request.getHeader("referer"));
            }else{
                response.sendRedirect("login");
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
