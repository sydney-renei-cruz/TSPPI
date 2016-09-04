/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.java.function;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cruzsyd
 * ref = http://www.studytonight.com/servlet/login-system-example-in-servlet.php
 * 
 */
public class ValidateLogin extends HttpServlet{
    public static boolean validateUser(String username, String password, HttpServletRequest request, HttpServletResponse response){
        boolean st = false;
        ServletContext context;
        Connection conn = null;
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            PreparedStatement ps = conn.prepareStatement("Select * from account where username = ? and password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            st = rs.next();
                       
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return st;
    }
}
