/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.client.invoice.function;

import com.tsppi.controller.account.register.function.RegisterController;
import com.tsppi.controller.bean.CartBean;
import com.tsppi.controller.bean.CartItemBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class CartController extends HttpServlet {
    ArrayList<CartBean> cart_bean = new ArrayList<>();
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
        ServletContext context = request.getSession().getServletContext();
        HttpSession session = request.getSession();
        
        try{
            String quantity = request.getParameter("quantity");
            int stock = 0;
            String action = request.getParameter("action");
            if(action != null && !action.equals("")){
                if(action.equals("add")){
                    stock = Integer.parseInt(request.getParameter("item_stock"));
                    if(!quantity.isEmpty()){
                        if(stock >= Integer.parseInt(quantity)){
                            addToCart(request);   
                        }
                    }
                }else if(action.equals("update")){
                    stock = Integer.parseInt(request.getParameter("item_stock"));
                    if(!quantity.isEmpty()){
                        if(stock >= Integer.parseInt(quantity)){
                            updateCart(request);
                            session.setAttribute("success_msg", "Item has been updated");
                        }else{
                            session.setAttribute("error_msg", "Quantity should not exceed stock.");
                            response.sendRedirect(request.getHeader("referer"));
                            return;
                        }
                    }
                }else if(action.equals("x")){ //delete
                    deleteCart(request);
                }
            }
            response.sendRedirect(request.getHeader("referer"));
        }catch(Exception e){
            e.printStackTrace();
            context.log("Exception: " + e);
            request.setAttribute("exception_error", e);
            request.getRequestDispatcher("/WEB-INF/error/catch-error.jsp").forward(request, response);
        }
    }
    protected void deleteCart(HttpServletRequest request){
        HttpSession session = request.getSession();
        int item_number = Integer.parseInt(request.getParameter("item_number"));
        CartBean cb = null;
        
        Object ocb = session.getAttribute("cart");
        if(ocb != null){
            cb = (CartBean) ocb;
        }else{
            cb = new CartBean();
        }
        
        cb.deleteCartItem(item_number);
    }
    protected void updateCart(HttpServletRequest request){
        HttpSession session = request.getSession();
        int item_number = Integer.parseInt(request.getParameter("item_number"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        CartBean cb = null;
        
        Object ocb = session.getAttribute("cart");
        if(ocb != null){
            cb = (CartBean) ocb;
        }else {
            cb = new CartBean();
        }
        cb.updateCartItem(item_number, quantity);
    }
    protected void addToCart(HttpServletRequest request){
        HttpSession session = request.getSession();
        
        int item_number = Integer.parseInt(request.getParameter("item_number"));
        String item_name = request.getParameter("item_name");
        int item_stock = Integer.parseInt(request.getParameter("item_stock"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float item_cost = Float.parseFloat(request.getParameter("item_cost"));
        
        CartBean cb = null;
        Object ocb = session.getAttribute("cart");
        ArrayList<CartItemBean> al;
        
        if(ocb != null){
            cb = (CartBean) ocb;
        }else{
            cb = new CartBean();
            session.setAttribute("cart", cb);
            session.setAttribute("quantity", quantity);
        }
        
        cb.addCartItem(item_number, item_name, item_stock, quantity, item_cost, request);
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
