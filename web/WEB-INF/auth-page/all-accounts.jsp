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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/item-list.css">

    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
     
        <section class="team">            
            <div class="container">
              <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <c:if test="${account_type == 'admin'}">
                        <div class="col-lg-12">
                          <h3 class="description">Employee</h3>
                          <div class="row pt-md">
                              <c:forEach var="eb" items="${eb}">
                                  <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile text-center">
                                        <div class="img-box">
                                            <img src="img/person-placeholder.jpg" alt="" class="img-responsive">
                                        </div>
                                        <h1>${eb.getUsername()}</h1>
                                        <h2>${eb.getFirstName()} ${eb.getLastName()}</h2>
                                        <h2>Role: ${eb.getJobType()}</h2>
                                        <h2>Email: <br> ${eb.getEmail()}</h2>
                                        <div class="cont-btn">
                                            <form action="activationB" method="POST">
                                                <input type="hidden" name="account_num" id="account_num" value="${eb.getAccountNum()}">
                                                <input type="hidden" name="account_status" id="account_status" value="${eb.getAccountStatus()}">
                                                <c:if test="${eb.getAccountStatus()}">
                                                    <input type="submit" name="submit" id="submit" value="Deactivate Account" class="btn btn-danger">
                                                </c:if>
                                                <c:if test="${!eb.getAccountStatus()}">                                                     
                                                    <input type="submit" name="submit" id="submit" value="Activate Account" class="btn btn-danger">
                                                </c:if>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach >
                            </div>
                        </div>
                    </c:if>
                  <div class="col-lg-12">
                    <h3 class="description">Client</h3>
                    <div class="row pt-md"> 
                        <c:forEach var="cb" items="${cb}">
                            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile text-center">
                                <div class="img-box">
                                    <img src="img/person-placeholder.jpg" alt="" class="img-responsive">
                                </div>
                                <c:choose> 
                                    <c:when test="${account_type == 'admin'}">
                                        <h1>${cb.getUsername()}</h1>
                                        <h2>${cb.getFirstName()} ${cb.getLastName()}</h2>
                                    </c:when>
                                    <c:otherwise>
                                        <h1>${cb.getFirstName()} ${cb.getLastName()}</h1>
                                    </c:otherwise>
                                </c:choose>
                                <h2>Email:<br> ${cb.getEmail()}</h2>
                                <h2>Mobile: ${cb.getMobile()}</h2>
                                <h2>Telephone: ${cb.getTelephone()}</h2>
                                <c:if test="${job_position == 'Vice President'}">
                                    <h2>Address:<br> ${cb.getAddress()}</h2>
                                </c:if>
                                <c:if test="${account_type == 'admin'}">
                                    <div class="cont-btn">
                                        <form action="activationB" method="POST">
                                            <input type="hidden" name="account_num" id="account_num" value="${cb.getAccountNum()}">
                                            <input type="hidden" name="account_status" id="account_status" value="${cb.getAccountStatus()}">
                                            <c:if test="${cb.getAccountStatus()}">
                                                <input type="submit" name="submit" id="submit" value="Deactivate Account" class="btn btn-danger">
                                            </c:if>
                                            <c:if test="${!cb.getAccountStatus()}">                                                     
                                                <input type="submit" name="submit" id="submit" value="Activate Account" class="btn btn-danger">
                                            </c:if>
                                        </form>
                                    </div>
                                </c:if>
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
