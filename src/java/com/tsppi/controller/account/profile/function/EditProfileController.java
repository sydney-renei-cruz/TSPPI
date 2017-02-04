/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.account.profile.function;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Sydney Cruz
 */
public class EditProfileController extends HttpServlet {

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
        PreparedStatement ps;
        ServletContext context;
        
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            String username = request.getParameter("username");
            String first_name = request.getParameter("firstname");
            String last_name = request.getParameter("lastname");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String telephone = request.getParameter("telephone");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String currentUsername = (String)session.getAttribute("account_num");
            InputStream inputStream = null;
            Part filePart = request.getPart("account_image");
            if(filePart.getSize() != 0){
                inputStream = filePart.getInputStream();
            }
            int x;
            if(!first_name.equals("")){
                ps = conn.prepareStatement("UPDATE account SET first_name = ? WHERE account_num = ?");
                ps.setString(1, first_name);
                ps.setString(2, currentUsername);
                ps.executeUpdate();
            }
            
            if(!last_name.equals("")){
                ps = conn.prepareStatement("UPDATE account SET last_name = ? WHERE account_num = ?");
                ps.setString(1, last_name);
                ps.setString(2, currentUsername);
                ps.executeUpdate();
            }
            
            if(!email.equals("")){
                ps = conn.prepareStatement("UPDATE account SET email = ? WHERE account_num = ?");
                ps.setString(1, email);
                ps.setString(2, currentUsername);
                ps.executeUpdate();
            }
             if(filePart.getSize() != 0){
                ps = conn.prepareStatement("UPDATE account SET account_image = ? WHERE account_num = ?");
                ps.setBlob(1, inputStream);
                ps.setString(2, currentUsername);
                ps.executeUpdate();
                
                String imagePath = context.getInitParameter("imgPath") + "account\\" + currentUsername + ".png";
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
            
            if(!password.equals("")){
            //                  Hash the password
                try{
        
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
        
                //              End Salting
            
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                md.update(password.getBytes());
        
                byte byteData[] = md.digest();
        
                StringBuffer sb = new StringBuffer();
        
                for(int i = 0; i < byteData.length; i++){
                    sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
                }
        
                password = sb.toString();
                }
                catch(NoSuchAlgorithmException e){
                    e.printStackTrace();
                }
                //      End Hashing
                
                //      CHANGE PASSWORD
                
                ps = conn.prepareStatement("UPDATE account SET password = ? WHERE account_num = ?");
                ps.setString(1, password);
                ps.setString(2, currentUsername);
                ps.executeUpdate();
            }
            if(session.getAttribute("account_type").equals("client")){
                if(!mobile.equals("")){
                    ps = conn.prepareStatement("UPDATE client SET mobile= ? WHERE account_num = ?");
                    ps.setString(1, mobile);
                    ps.setString(2, currentUsername);
                    ps.executeUpdate();
                }

                if(!telephone.equals("")){
                    ps = conn.prepareStatement("UPDATE client SET telephone = ? WHERE account_num = ?");
                    ps.setString(1, telephone);
                    ps.setString(2, currentUsername);
                    ps.executeUpdate();
                }

                if(!address.equals("")){
                    ps = conn.prepareStatement("UPDATE client SET address = ? WHERE account_num = ?");
                    ps.setString(1, address);
                    ps.setString(2, currentUsername);
                    ps.executeUpdate();
                }
            }
            
            
            if(!username.equals("")){
                ps = conn.prepareStatement("UPDATE account SET username = ? WHERE account_num = ?");
                ps.setString(1, username);
                ps.setString(2, currentUsername);
                ps.executeUpdate();
                
                session.setAttribute("user", username);
            }
        
            response.sendRedirect("profile");
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
