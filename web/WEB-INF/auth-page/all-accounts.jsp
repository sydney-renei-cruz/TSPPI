<%-- 
    Document   : all-accounts
    Created on : Sep 7, 2016, 9:31:32 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/allaccounts.css">
        <style>
            th, td{
                color: #fff;
                border: 1px solid #fff;
            }
        </style>
    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
     
        <section class="team">            
            <div class="container">
              <div class="row">
                <div class="col-md-10 col-md-offset-1">
                  <div class="col-lg-12">
                    <h3 class="description">Client</h3>
                    <div class="row pt-md"> 
                        <c:forEach var="cb" items="${cb}">
                            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile text-center">
                                <div class="img-box">
                                    <img src="img/person-placeholder.jpg" alt="" class="img-responsive">
                                </div>
                                <h1>${cb.getUsername()}</h1>
                                <h2>${cb.getFirstName()} ${cb.getLastName()}</h2>
                                <h2>Email: ${cb.getEmail()}</h2>
                                <h2>Mobile: ${cb.getMobile()}</h2>
                                <h2>Telephone: ${cb.getTelephone()}</h2>
                                    <div class="cont-btn">
                                        <c:if test="${cb.getAccountStatus()}">
                                            <a href="#" class="btn btn-danger">Deactivate Account</a>
                                        </c:if>
                                        <c:if test="${!cb.getAccountStatus()}">  
                                            <a href="#" class="btn btn-danger">Activate Account</a>
                                        </c:if>
                                    </div>
                            </div>
                        </c:forEach >                        
                    </div>
                        
                  </div>
                  <div class="col-lg-12">
                    <h3 class="description">Employee</h3>
                    <div class="row pt-md">
                        <c:forEach var="eb" items="${eb}">
                            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile">
                                <div class="img-box">
                                    <img src="img/person-placeholder.jpg" alt="" class="img-responsive">
                                </div>
                                <h1>${eb.getUsername()}</h1>
                                <h2>${eb.getFirstName()} ${eb.getLastName()}</h2>
                                <h2>Role: ${eb.getJobType()}</h2>
                                <h2>Email: ${eb.getEmail()}</h2>
                                <h2>Mobile: ${eb.getMobile()}</h2>
                                <h2>Telephone: ${eb.getTelephone()}</h2>
                                <h2>${eb.getAccountStatus()}</h2>
                                    <div class="cont-btn">
                                        <c:if test="${eb.getAccountStatus()}">
                                            <a href="#" class="btn btn-danger">Deactivate Account</a>
                                        </c:if>
                                        <c:if test="${!eb.getAccountStatus()}">  
                                            <a href="#" class="btn btn-danger">Activate Account</a>
                                        </c:if>
                                    </div>
                            </div>
                        </c:forEach >
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
    </body>
</html>
