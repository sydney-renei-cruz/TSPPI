    <%-- 
    Document   : profile
    Created on : Sep 7, 2016, 10:54:13 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/css/profile.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@include file="/WEB-INF/static-page/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
                    <div class="well profile">
                       <div class="col-sm-12">
                           <div class="col-xs-12 col-sm-4 text-center">
                               <figure>
                                   <img src="img/person-placeholder.jpg" alt="" class="img-circle img-responsive">
                               </figure>
                           </div>
                           <div class="col-xs-12 col-sm-8">
                               <c:forEach var="pb" items="${pb}">
                                   <b style="font-size: 3.5em;">${pb.getFullName()}</b>

                                   <p><strong>Username:</strong> ${pb.getUsername()}</p>
                                   <p><strong>Email: </strong> ${pb.getEmail()}</p>
                                  <c:if test="${account_type == 'employee'}"><p><strong>Role: </strong> ${job_position} </p></c:if> <!--used session-->
                                  <c:if test="${account_type == 'client'}">
                                    <p><strong>Mobile Number: </strong> ${pb.getMobile()}</p>
                                    <p><strong>Telephone Number: </strong> ${pb.getTelephone()}</p>
                                    <p><strong>Address: </strong> ${pb.getAddress()}</p>
                                  </c:if>
                               </c:forEach>
                           </div>
                       </div>            
                       <div class="col-xs-12 divider text-center">
                           <div class="col-xs-12 col-sm-4 emphasis">
                               <a href="editaccount" class="btn btn-danger btn-block"><span class="fa fa-user"></span> Edit Profile </a>
                           </div>
                           <c:if test="${account_type == 'client'}">
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="allinvoices" class="btn btn-info btn-block"><span class="fa fa-user"></span> View All Invoices </a>
                               </div>
                           </c:if>
                           <c:if test="${(job_position == 'Vice President') || (account_type == 'admin')}">
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="allaccounts" class="btn btn-info btn-block"><span class="fa fa-user"></span> View All Accounts </a>
                               </div>
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="vpinvoices" class="btn btn-success btn-block"><span class="fa fa-user"></span> View All Invoices </a>
                               </div>
                           </c:if>
                           <c:if test="${account_type == 'admin'}">
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="emrp" class="btn btn-success btn-block"><span class="fa fa-plus-circle"></span> Register Employee</a>
                               </div>
                           </c:if>
                           <c:if test="${job_position == 'Inventory Officer'}">
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="addproduct" class="btn btn-success btn-block"><span class="fa fa-plus-circle"></span> Add Product</a>
                               </div>
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="addservices" class="btn btn-warning btn-block"><span class="fa fa-user"></span> Add Services</a>
                               </div>
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="productapproval" class="btn btn-info btn-block"><span class="fa fa-user"></span> Approve Products </a>
                               </div>
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="productapproval" class="btn btn-primary btn-block"><span class="fa fa-user"></span> Edit Products </a>
                               </div>
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="allservices" class="btn btn-danger btn-block"><span class="fa fa-user"></span> Edit Services </a>
                               </div>
                           </c:if>
                           <c:if test="${account_type != 'admin'}">
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="ticket" class="btn btn-success btn-block"><span class="fa fa-plus-circle"></span> Report a Bug </a>
                               </div>
                           </c:if>
                           <c:if test="${account_type != 'employee'}">
                               <div class="col-xs-12 col-sm-4 emphasis">
                                   <a href="inquiry" class="btn btn-success btn-block"><span class="fa fa-plus-circle"></span> Inquire About a Service </a>
                               </div>
                           </c:if>
                       </div>
                    </div>                 
                </div>
            </div>
        </div>
    </body>
</html>
