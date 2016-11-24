/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsppi.controller.session.filter;

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
public class SpecAdVpFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
        }else {
            if(!(session.getAttribute("account_type").equals("admin") || session.getAttribute("job_position").equals("Vice President"))){
                request.getRequestDispatcher("/WEB-INF/error/authpage-error.jsp").forward(request, response);
            }else{
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
    }
    
}
