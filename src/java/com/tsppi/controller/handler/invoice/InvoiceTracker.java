/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.handler.invoice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
public class InvoiceTracker implements ServletContextListener {
    
    private ScheduledExecutorService scheduler;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        scheduler = Executors.newSingleThreadScheduledExecutor();
        scheduler.scheduleAtFixedRate(new NYVInvoice(sce.getServletContext()), 0, 2, TimeUnit.DAYS);
        scheduler.scheduleAtFixedRate(new CancelInvoice(sce.getServletContext()), 0, 7, TimeUnit.DAYS);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
class NYVInvoice implements Runnable{
    private ServletContext context;
    private static final Logger LOGGER = Logger.getLogger( NYVInvoice.class.getName() );
    public NYVInvoice(ServletContext conin){
        context = conin;
    }
    
    public void run(){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String inText = "";
        PreparedStatement ps;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            inText = "SELECT i.invoice_id, i.verified, s.status_name "
                    + "FROM invoice i "
                    + "JOIN invoice_status s ON s.status_id = i.status_id";
            ps = conn.prepareStatement(inText);
            rs = ps.executeQuery();
            
            boolean verified = false;
            int invoice_id = 0;
            String status_name = "";
            while(rs.next()){
                verified = rs.getBoolean("verified");
                invoice_id = rs.getInt("invoice_id");
                status_name = rs.getString("status_name");
                
                if(verified == false && status_name.equals("Pending")){
                    inText = "UPDATE invoice i "
                        + "SET i.status_id = "
                        + "(SELECT s.status_id "
                            + "FROM invoice_status s "
                            + "WHERE s.status_name = 'Expired') "
                        + "WHERE i.invoice_id = ?";
                    ps = conn.prepareStatement(inText);
                    ps.setInt(1, invoice_id);
                    ps.executeUpdate();
                }
            }
        }catch(Exception ex){
            LOGGER.log( Level.FINE, ex.getMessage());
        }
        
    }
}
class CancelInvoice implements Runnable{
    private ServletContext context;
    private static final Logger LOGGER = Logger.getLogger( CancelInvoice.class.getName() );
    public CancelInvoice(ServletContext conin){
        context = conin;
    }
    
    public void run(){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String inText = "";
        PreparedStatement ps;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
            
            inText = "SELECT i.invoice_id, i.verified, s.status_name "
                    + "FROM invoice i "
                    + "JOIN invoice_status s ON s.status_id = i.status_id";
            ps = conn.prepareStatement(inText);
            rs = ps.executeQuery();
            
            boolean verified = false;
            int invoice_id = 0;
            String status_name = "";
            while(rs.next()){
                verified = rs.getBoolean("verified");
                invoice_id = rs.getInt("invoice_id");
                status_name = rs.getString("status_name");
                
                if(verified == true && status_name.equals("Approved")){
                    inText = "UPDATE invoice i "
                        + "SET i.status_id = "
                        + "(SELECT s.status_id "
                            + "FROM invoice_status s "
                            + "WHERE s.status_name = 'In Process') "
                        + "WHERE i.invoice_id = ?";
                    ps = conn.prepareStatement(inText);
                    ps.setInt(1, invoice_id);
                    ps.executeUpdate();
                }
            }
        }catch(Exception ex){
            LOGGER.log( Level.FINE, ex.getMessage());
        }
        
    }
}