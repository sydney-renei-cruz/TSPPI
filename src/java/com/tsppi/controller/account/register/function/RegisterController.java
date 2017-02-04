/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.account.register.function;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
        
        Connection conn = null;
        PreparedStatement ps;
        ServletContext context;
        String inText = "";
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile_number");
            String telephone = request.getParameter("telephone_number");
            String address = request.getParameter("address");
            String account_type_id = request.getParameter("type_of_account");        
            String form_identifier = request.getParameter("form_identifier");
            String job_id = request.getParameter("job_type");
            Date date = new Date();
            String time_registered = new SimpleDateFormat("yyyy-MM-dd").format(date);
            Boolean account_status = true;
            InputStream inputStream = null;
            Part filePart = request.getPart("account_image");
            if(filePart.getSize() != 0){
                inputStream = filePart.getInputStream();
            }
            int x;
            
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
            password = password + salts[rand.nextInt(10)];
            //End Salting
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte byteData[] = md.digest();
            StringBuffer sb = new StringBuffer();
            for(int i = 0; i < byteData.length; i++){
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            password = sb.toString();
            
            
            if(filePart.getSize() != 0){
                inText = "INSERT INTO account "
                    + "(username, password, first_name, last_name, email, account_type_id, account_status, time_registered, account_image) "
                    + "VALUES (?,?,?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
                ps.setBlob(9, inputStream);
            }else{
                inText = "INSERT INTO account "
                    + "(username, password, first_name, last_name, email, account_type_id, account_status, time_registered) "
                    + "VALUES (?,?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(inText, Statement.RETURN_GENERATED_KEYS);
            }
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, first_name);
            ps.setString(4, last_name);
            ps.setString(5, email);
            ps.setString(6, account_type_id);
            ps.setBoolean(7, account_status);
            ps.setString(8, time_registered);
            x = ps.executeUpdate();
            
            int id;
            try(ResultSet generated_keys = ps.getGeneratedKeys()){
                if(generated_keys.next()){
                    id = generated_keys.getInt(1);
                    if(filePart.getSize() != 0){
                        String imagePath = context.getInitParameter("imgPath") + "account\\" + id + ".png";
                        File file = new File(imagePath);
                        
                        FileOutputStream outFile = new FileOutputStream(file);
                        inputStream = filePart.getInputStream();
                        
                        int read = 0;
                        int bufferSize = 1024;
                        byte[] buffer = new byte[bufferSize];
                        while((read = inputStream.read(buffer)) != -1){
                            outFile.write(buffer, 0, read);
                        }
                        inputStream.close();
                        outFile.close();
                    }
                }
            }
            if(!form_identifier.isEmpty()){
                if(form_identifier.equals("Employee")){
                    if(!job_id.isEmpty()){
                        ps = conn.prepareStatement("INSERT INTO " + form_identifier + "(account_num, job_id) VALUES (LAST_INSERT_ID(), ?)");
                        ps.setString(1, job_id);
                        x = ps.executeUpdate(); 
                    }
                }else if(form_identifier.equals("Admin")){
                    ps = conn.prepareStatement("INSERT INTO " + form_identifier + "(account_num) VALUES (LAST_INSERT_ID())");
                    x = ps.executeUpdate();
                }else{
                    if(!mobile.isEmpty() || !telephone.isEmpty() || !address.isEmpty()){
                        ps = conn.prepareStatement("INSERT INTO " + form_identifier + "(account_num, mobile, telephone, address) VALUES (LAST_INSERT_ID(),?,?,?)");
                        ps.setString(1, mobile);
                        ps.setString(2, telephone);
                        ps.setString(3, address);
                        x = ps.executeUpdate(); 
                    }
                }
                if(x>0){
                    response.sendRedirect("login");
                }else{
                    response.sendRedirect("register");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
            out.print(e);
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
