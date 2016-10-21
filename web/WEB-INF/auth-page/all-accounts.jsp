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
                          <div class="table text-center">
                              <table class="table">
                                  <thead>
                                      <tr>
                                        <th class="text-center">Username</th>
                                        <th class="text-center">Full name</th>
                                        <th class="text-center">Role</th>
                                        <th class="text-center">Email</th>
                                        <th></th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                      <c:forEach var="eb" items="${eb}">
                                          <tr>
                                              <td>${eb.getUsername()}</td>
                                              <td>${eb.getFullName()}</td>
                                              <td>${eb.getJobType()}</td>
                                              <td>${eb.getEmail()}</td>
                                              <td>
                                                  <form action="activationB" method="POST">
                                                    <input type="hidden" name="account_num" id="account_num" value="${eb.getAccountNum()}">
                                                    <input type="hidden" name="account_status" id="account_status" value="${eb.getAccountStatus()}">
                                                    <c:if test="${eb.getAccountStatus()}">
                                                        <input type="submit" name="submit" id="submit" value="Deactivate Account" class="btn btn-danger">
                                                    </c:if>
                                                    <c:if test="${!eb.getAccountStatus()}">                                                     
                                                        <input type="submit" name="submit" id="submit" value="Activate Account" class="btn btn-primary">
                                                    </c:if>
                                                </form>
                                              </td>
                                          </tr>
                                      </c:forEach>
                                  </tbody>
                              </table>
                          </div>
                        </div>
                    </c:if>
                  <div class="col-lg-12">
                    <h3 class="description">Client</h3>
                    <div class="table text-center">
                              <table class="table">
                                  <thead>
                                      <tr>
                                        <c:if test="${account_type == 'admin'}">
                                        <th class="text-center">Username</th>
                                        </c:if>
                                        <th class="text-center">Full name</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Mobile</th>
                                        <th class="text-center">Telephone</th>
                                        <th class="text-center">Address</th>
                                        <c:if test="${account_type == 'admin'}">
                                        <th></th>
                                        </c:if>
                                    </tr>
                                  </thead>
                                  <tbody>
                                      <c:forEach var="cb" items="${cb}">
                                          <tr>
                                              <c:if test="${account_type == 'admin'}">
                                              <td>${cb.getUsername()}</td>
                                              </c:if>
                                              <td>${cb.getFullName()}</td>
                                              <td>${cb.getEmail()}</td>
                                              <td>${cb.getMobile()}</td>
                                              <td>${cb.getTelephone()}</td>
                                              <td>${cb.getAddress()}</td>
                                              <c:if test="${account_type == 'admin'}">
                                              <td>
                                                  <form action="activationB" method="POST">
                                                    <input type="hidden" name="account_num" id="account_num" value="${cb.getAccountNum()}">
                                                    <input type="hidden" name="account_status" id="account_status" value="${cb.getAccountStatus()}">
                                                    <c:if test="${cb.getAccountStatus()}">
                                                        <input type="submit" name="submit" id="submit" value="Deactivate Account" class="btn btn-danger">
                                                    </c:if>
                                                    <c:if test="${!cb.getAccountStatus()}">                                                     
                                                        <input type="submit" name="submit" id="submit" value="Activate Account" class="btn btn-primary">
                                                    </c:if>
                                                </form>
                                              </td>
                                              </c:if>
                                          </tr>
                                      </c:forEach>
                                  </tbody>
                              </table>
                          </div>
                    
                </div>
                    
                </div>
              </div>
            </div>
          </section>
    </body>
</html>
