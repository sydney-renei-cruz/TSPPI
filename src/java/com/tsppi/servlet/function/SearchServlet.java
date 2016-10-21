/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.servlet.function;

import com.tsppi.bean.ProductBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Jasteen
 * Reference: http://www.javaknowledge.info/search-from-database-using-servlet-and-jsp/
 */

public class SearchServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        Connection conn = null;

        ServletContext context;        
        try{
            context = request.getSession().getServletContext();
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(context.getInitParameter("dbURL"),context.getInitParameter("user"),context.getInitParameter("password"));
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }  

        PreparedStatement ps;
        try {
            String srch = request.getParameter("srch");
            String query = "SELECT p.*, c.category_name FROM product p JOIN product_category c ON p.category_id = c.category_id "
                    + "WHERE p.product_name LIKE ? or c.category_name LIKE ? or p.product_detail LIKE ? or p.product_id LIKE ?";
            if(srch != ""){
                ps = conn.prepareStatement(query);
                ps.setString(1, "%" + srch + "%");
                ps.setString(2, "%" + srch + "%");
                ps.setString(3, "%" + srch + "%");
                ps.setString(4, "%" + srch + "%");
                ResultSet rs = ps.executeQuery();

                ArrayList<ProductBean> al = new ArrayList<>();
                ProductBean pb;
                if(!rs.next()){
                    request.setAttribute("srch", srch);
                    request.getRequestDispatcher("/WEB-INF/err-page/search-error.jsp").forward(request,response);
                }else{
                    while (rs.next()) {
                        pb = new ProductBean();
                        pb.setProductName(rs.getString("product_name"));
                        pb.setProductDetail(rs.getString("product_detail"));
                        pb.setMSRP(rs.getFloat("msrp"));
                        pb.setStock(rs.getInt("stock"));
                        pb.setCategoryName(rs.getString("category_name"));
                        al.add(pb);
                    }
                    request.setAttribute("al", al);
                    request.getRequestDispatcher("/WEB-INF/auth-page/search-result.jsp").forward(request,response);
                }
                
            }else{
                response.sendRedirect(request.getHeader("referer"));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
        }
    }
 
    }
