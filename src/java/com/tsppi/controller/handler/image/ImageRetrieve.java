/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.handler.image;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sydney Cruz
 */
public class ImageRetrieve extends HttpServlet {

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
        ServletContext context = request.getSession().getServletContext();
        
        response.setContentType("image/png");
        String imagePath = context.getInitParameter("imgPath") + "placement\\car-placeholder.png";
        
        if(request.getParameter("an") != null){
            imagePath = context.getInitParameter("imgPath") + "account\\" + request.getParameter("an") + ".png";
        }else if(request.getParameter("pi") != null){
            imagePath = context.getInitParameter("imgPath") + "product\\" + request.getParameter("pi") + ".png";
        }else if(request.getParameter("si") != null){
            imagePath = context.getInitParameter("imgPath") + "service\\" + request.getParameter("si") + ".png";
        }
        
        File file = new File(imagePath);
        BufferedImage bi;
        try{
            bi = ImageIO.read(file);
        }catch(javax.imageio.IIOException e){
            if(request.getParameter("an") != null){
                file = new File(context.getInitParameter("imgPath") + "placement\\person-placeholder.jpg");
            }else{
                file = new File(context.getInitParameter("imgPath") + "placement\\car-placeholder.png");
            }
            
            bi = ImageIO.read(file);
        }
        OutputStream outImg = response.getOutputStream();
        File cacheDir = new File(context.getInitParameter("imgPath") + "cache");
        ImageIO.setCacheDirectory(cacheDir);
        ImageIO.write(bi, "png", outImg);
        
        outImg.close();
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
