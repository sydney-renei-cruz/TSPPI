<%-- 
    Document   : all-accounts
    Created on : Sep 7, 2016, 9:31:32 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
        <table align = "center">
            <thead>
                <tr>
                    <c:if test="${account_type == 'admin'}"><th> <b>ACCOUNT NUMBER</b> </th></c:if>
                    <th> <b>USERNAME</b> </th>
                    <c:if test="${account_type == 'admin'}"><th> <b>PASSWORD</b> </th></c:if>
                    <th> <b>FULL NAME</b> </th>
                    <th> <b>E-MAIL</b> </th>
                    <th> <b>MOBILE NO.</b> </th>
                    <th> <b>TELEPHONE NO.</b> </th>
                    <th> <b>ADDRESS</b> </th>
                    <c:if test="${account_type == 'admin'}"><th> <b>ACCOUNT TYPE</b> </th></c:if>
                    <th> <b>ACCOUNT STATUS</b> </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cb" items="${cb}">
                <tr>
                    <c:if test="${account_type == 'admin'}"><td>${cb.getAccountNum()}</td></c:if>
                    <td>${cb.getUsername()}</td>
                    <c:if test="${account_type == 'admin'}"><td>${cb.getPassword()}</td></c:if>
                    <td>${cb.getFirstName()} ${cb.getLastName()}</td>
                    <td>${cb.getEmail()}</td>
                    <td>${cb.getMobile()}</td>
                    <td>${cb.getTelephone()}</td>
                    <td>${cb.getAddress()}</td>
                    <c:if test="${account_type == 'admin'}"><td>${cb.getAccountType()}</td></c:if>
                    <td>${cb.getAccountStatus()}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <!--
            Proper way of checking whether the logged in user is an admin or a vice president
        
            the SpecAdVpFilter is always called to check whether the user is logged in or not. 
            if logged in, it will check whether the user is a vp or admin.
        -->
        <c:if test="${account_type == 'admin'}">
        <h1>Employee Accounts</h1>
        <table align = "center">
            <thead>
                <tr>
                    <th> <b>ACCOUNT NUMBER</b> </th>
                    <th> <b>USERNAME</b> </th>
                    <th> <b>PASSWORD</b> </th>
                    <th> <b>FULL NAME</b> </th>
                    <th> <b>E-MAIL</b> </th>
                    <th> <b>MOBILE NO.</b> </th>
                    <th> <b>TELEPHONE NO.</b> </th>
                    <th> <b>ADDRESS</b> </th>
                    <th> <b>ACCOUNT TYPE</b> </th>
                    <th> <b>JOB POSITION</b> </th>
                    <th> <b>ACCOUNT STATUS</b> </th>
                </tr>
            </thead>
            <tbody>
                <!--
                    > eb came from the 'request.setAttribute("eb", eb)' on the servlet
                    > refer to the AllAccountBean about the 'GET' methods
                -->
                <c:forEach var="eb" items="${eb}">
                <tr>
                    <td>${eb.getAccountNum()}</td>
                    <td>${eb.getUsername()}</td>
                    <td>${eb.getPassword()}</td>
                    <td>${eb.getFirstName()} ${eb.getLastName()}</td>
                    <td>${eb.getEmail()}</td>
                    <td>${eb.getMobile()}</td>
                    <td>${eb.getTelephone()}</td>
                    <td>${eb.getAddress()}</td>
                    <td>${eb.getAccountType()}</td>
                    <td>${eb.getJobType()}</td>
                    <td>${eb.getAccountStatus()}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        </c:if>
    </body>
</html>
