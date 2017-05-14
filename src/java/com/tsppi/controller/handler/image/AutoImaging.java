/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.handler.image;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author Sydney Cruz
 */
public class AutoImaging implements ServletContextListener {

    private ScheduledExecutorService scheduler;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        scheduler = Executors.newSingleThreadScheduledExecutor();
        scheduler.scheduleAtFixedRate(new ImageStore(sce.getServletContext()), 0, 1, TimeUnit.DAYS); 
   }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}

class ImageStore implements Runnable{
    private ServletContext context;
    
    public ImageStore(ServletContext conin){
        context = conin;
    }
    public void run(){
        File dir = new File(context.getInitParameter("imgPath") + "account");
        dir = new File(context.getInitParameter("imgPath") + "product");
        dir = new File(context.getInitParameter("imgPath") + "service");
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            stmt = conn.createStatement();
            
            String inText = "SELECT account_num FROM account";
            if(stmt.execute(inText))
                rs = stmt.getResultSet();
            
            while(rs.next()){
                String imagePath = context.getInitParameter("imgPath") + "account\\" + rs.getString("id") + ".png";
                File file = new File(imagePath);
//                Blob photo = rs.getBlob("account_image");
                
                FileOutputStream outFile = new FileOutputStream(file);
//                InputStream in = photo.getBinaryStream();
                
                int length = 0;
                int bufferSize = 1024;
                byte[] buffer = new byte[bufferSize];
                outFile.write(buffer, 0, length);
//                while((length = in.read(buffer)) != -1){
//                    outFile.write(buffer, 0, length);
//                }
//                in.close();
                outFile.close();
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
            inText = "SELECT product_id FROM product";
            if(stmt.execute(inText))
                rs = stmt.getResultSet();
            
            while(rs.next()){
                String imagePath = context.getInitParameter("imgPath") + "product\\" + rs.getString("id") + ".png";
                File file = new File(imagePath);
//                Blob photo = rs.getBlob("product_image");
                
                FileOutputStream outFile = new FileOutputStream(file);
//                InputStream in = photo.getBinaryStream();
                
                int length = 0;
                int bufferSize = 1024;
                byte[] buffer = new byte[bufferSize];
                outFile.write(buffer, 0, length);
//                while((length = in.read(buffer)) != -1){
//                    outFile.write(buffer, 0, length);
//                }
//                in.close();
                outFile.close();
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
            inText = "SELECT service_id FROM product";
            if(stmt.execute(inText))
                rs = stmt.getResultSet();
            
            while(rs.next()){
                String imagePath = context.getInitParameter("imgPath") + "service\\" + rs.getString("id") + ".png";
                File file = new File(imagePath);
//                Blob photo = rs.getBlob("service_image");
                
                FileOutputStream outFile = new FileOutputStream(file);
//                InputStream in = photo.getBinaryStream();
                
                int length = 0;
                int bufferSize = 1024;
                byte[] buffer = new byte[bufferSize];
                outFile.write(buffer, 0, length);
//                while((length = in.read(buffer)) != -1){
//                    outFile.write(buffer, 0, length);
//                }
//                in.close();
                outFile.close();
            }
            
            rs.close();
            stmt.close();
            conn.close();
        }catch(Exception e){
        }
    }
}