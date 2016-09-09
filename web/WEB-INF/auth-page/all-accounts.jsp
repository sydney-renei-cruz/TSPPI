<%-- 
    Document   : all-accounts
    Created on : Sep 7, 2016, 9:31:32 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
            <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    
    <head>
        <style>
            th, td{
                color: #fff;
                border: 1px solid #fff;
            }
        </style>
    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
     
        <h1>Client Accounts</h1>
        
        
                <c:forEach var="cb" items="${cb}">
                    <div class="w3-card w3-black" padding = "16">
                        <table align = "center">
                        <tbody>
                            
                    <tr>
                        <c:if test="${account_type == 'admin'}"><th> <b>ACCOUNT NUMBER</b> </th></c:if>
                        <c:if test="${account_type == 'admin'}"><td>${cb.getAccountNum()}</td></c:if>
                    </tr>
                    
                    <tr>
                        <th> <b>USERNAME</b> </th>
                        <td>${cb.getUsername()}</td>                        
                    </tr>
                    
                    <tr>
                        <c:if test="${account_type == 'admin'}"><th> <b>PASSWORD</b> </th></c:if>
                        <c:if test="${account_type == 'admin'}"><td>${cb.getPassword()}</td></c:if>                 
                    </tr>
                    
                    <tr>
                        <th> <b>FULL NAME</b> </th>
                        <td>${cb.getFirstName()} ${cb.getLastName()}</td>                        
                    </tr>
                    
                    <tr>
                        <th> <b>E-MAIL</b> </th>
                        <td>${cb.getEmail()}</td>       
                    </tr>
                    
                    <tr>
                        <th> <b>MOBILE NO.</b> </th>
                        <td>${cb.getMobile()}</td>                        
                    </tr>

                    <tr>
                        <th> <b>TELEPHONE NO.</b> </th>
                        <td>${cb.getTelephone()}</td>                        
                    </tr>
                    
                    <tr>
                        <th> <b>ADDRESS</b> </th>
                        <td>${cb.getAddress()}</td>
                    </tr>
                    
                    <tr>
                        <c:if test="${account_type == 'admin'}"><th> <b>ACCOUNT TYPE</b> </th></c:if>
                        <c:if test="${account_type == 'admin'}"><td>${cb.getAccountType()}</td></c:if>
                    </tr>
                    
                    <tr>
                        <th> <b>ACCOUNT STATUS</b> </th>
                        <td>${cb.getAccountStatus()}</td>                        
                    </tr>
                    
                    </tbody>
                    </table>
                    </div>
                </c:forEach>
            
        <!--
            Proper way of checking whether the logged in user is an admin or a vice president
        
            the SpecAdVpFilter is always called to check whether the user is logged in or not. 
            if logged in, it will check whether the user is a vp or admin.
        -->
        <c:if test="${account_type == 'admin'}">
        <h1>Employee Accounts</h1>
        
                <c:forEach var="eb" items="${eb}">
                    <div class="w3-card w3-black" padding = "16">
                        
                    <table align = "center">
                        <tbody>
                            <tr>
                                <th> <b>ACCOUNT NUMBER</b> </th>
                                <td>${eb.getAccountNum()}</td>
                            </tr>
                
                            <tr>
                                <th> <b>USERNAME</b> </th>
                                <td>${eb.getUsername()}</td>                    
                            </tr>
                
                            <tr>
                                <th> <b>PASSWORD</b> </th>
                                <td>${eb.getPassword()}</td>
                            </tr>
                
                            <tr>
                                <th> <b>FULL NAME</b> </th>
                                <td>${eb.getFirstName()} ${eb.getLastName()}</td>
                            </tr>
                
                            <tr>
                                <th> <b>E-MAIL</b> </th>
                                <td>${eb.getEmail()}</td>
                            </tr>
                
                            <tr>
                                <th> <b>MOBILE NO.</b> </th>
                                <td>${eb.getMobile()}</td>
                            </tr>
                
                            <tr>
                                <th> <b>TELEPHONE NO.</b> </th>
                                <td>${eb.getTelephone()}</td>
                            </tr>
                
                            <tr>
                                <th> <b>ADDRESS</b> </th>
                                <td>${eb.getAddress()}</td>
                            </tr>
                
                            <tr>
                                <th> <b>ACCOUNT TYPE</b> </th>
                                <td>${eb.getAccountType()}</td>
                            </tr>
                    
                            <tr>
                                <th> <b>JOB POSITION</b> </th>
                                <td>${eb.getJobType()}</td>
                            </tr>    
                    
                            <tr>
                                <th> <b>ACCOUNT STATUS</b> </th>
                                <td>${eb.getAccountStatus()}</td>
                            </tr>
                        </tbody>
                    </table>
                            
                    </div>        
                </c:forEach>
            
        </c:if>
    </body>
</html>
