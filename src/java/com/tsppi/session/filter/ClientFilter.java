/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.session.filter;

import com.tsppi.bean.CartBean;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cruzsyd
 */
public class ClientFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession();
        CartBean cb = (CartBean) session.getAttribute("cart");
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
        }else {
            if(!session.getAttribute("account_type").equals("client")){
                request.getRequestDispatcher("/WEB-INF/err-page/authpage-error.jsp").forward(request, response);
            }else{
                if(cb.getCartSize() > 0 ){
                    chain.doFilter(request, response);
                }else{
                    response.sendRedirect("products");
                }
            }
        }
    }

    @Override
    public void destroy() {
    }
    
}
