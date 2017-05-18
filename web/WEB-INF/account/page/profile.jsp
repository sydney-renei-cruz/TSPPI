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
        <link href="css/profile.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
                    <div class="well profile">
                       <div class="col-sm-12">
                           <div class="col-xs-12 col-sm-4 text-center">
                               <figure>
                                   <img src="img?an=${account_num}" class="img-responsive">
                               </figure>
                           </div>
                           <div class="col-xs-12 col-sm-8">
                               <c:forEach var="al" items="${al}">
                                   <b style="font-size: 3.5em;">${al.getFullName()}</b>

                                   <p><strong>Username:</strong> ${al.getUsername()}</p>
                                   <p><strong>Email: </strong> ${al.getEmail()}</p>
                                  <c:if test="${account_type == 'employee'}"><p><strong>Role: </strong> ${job_position} </p></c:if> <!--used session-->
                                  <c:if test="${account_type == 'client'}">
                                    <p><strong>Mobile Number: </strong> ${al.getMobile()}</p>
                                    <p><strong>Company: </strong> ${al.getCompanyName()} - ${al.getCompanyBranch()}</p>
                                    <p><strong>Company Telephone Number: </strong> ${al.getCompanyTelephone()}</p>
                                    <p><strong>Company Address: </strong> ${al.getCompanyAddress()}</p>
                                  </c:if>
                               </c:forEach>
                                <div class="profile-btns">
                                    <div class="col-xs-6">
                                        <a href="editprofile" class="btn btn-primary btn-block"><span class="fa fa-user"></span> Edit Profile </a>
                                    </div>
                                     <div class="col-xs-6">
                                        <a href="changepassword" class="btn btn-primary btn-block"><span class="fa fa-user"></span> Change Password </a>
                                    </div>
                                </div>
                           </div>

                       <div class="col-xs-12 divider text-center user-privileges-div">
                           <legend>User Privileges</legend>
                            <c:if test="${account_type == 'admin'}">
                                <div class="col-md-6">
                                     <legend>Account</legend>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="emrp" class="btn btn-primary btn-block">Register Employee</a>
                                     </div>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="allaccounts" class="btn btn-primary btn-block">View Accounts</a>
                                     </div>
                                </div>
                                <div class="col-md-6">
                                     <legend>Job Position</legend>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="addjobposition" class="btn btn-primary btn-block">Add Job Position</a>
                                     </div>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="alljobposition" class="btn btn-primary btn-block">View Job Positions</a>
                                     </div>
                                </div>
                            </c:if>
                            <c:if test="${management_score == true}">
                                <div class="col-md-6">
                                     <legend>Client Company</legend>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="addcompany" class="btn btn-primary btn-block">Add Client Company</a>
                                     </div>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="allcompany" class="btn btn-primary btn-block">View Client Companies </a>
                                     </div>
                                </div>
                                <div class="col-md-6">
                                     <legend>Payment Method</legend>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="addpaymentmethod" class="btn btn-primary btn-block">Add Payment Method</a>
                                     </div>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="allpaymentmethod" class="btn btn-primary btn-block">View Payment Methods </a>
                                     </div>
                                </div>
                            </c:if>
                            <c:if test="${inventory_score == true}">
                                <div class="col-md-6">
                                     <legend>Product</legend>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="addproduct" class="btn btn-primary btn-block">Add Payment Method</a>
                                     </div>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="approveproducts" class="btn btn-primary btn-block">View Products</a>
                                     </div>
                                </div>
                                <div class="col-md-6">
                                     <legend>Product Category</legend>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="addproductcategory" class="btn btn-primary btn-block">Add Product Category</a>
                                     </div>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="allproductcategory" class="btn btn-primary btn-block">View Product Categories</a>
                                     </div>
                                </div>
                                <div class="col-md-6">
                                     <legend>Services</legend>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="addservice" class="btn btn-primary btn-block">Add Service</a>
                                     </div>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="allservices" class="btn btn-primary btn-block">View Services</a>
                                     </div>
                                </div>
                            </c:if>
                            <c:if test="${sales_score == true}">
                                <div class="col-md-6">
                                     <legend>Invoice</legend>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="salesinvoices" class="btn btn-primary btn-block">View Invoices</a>
                                     </div>
                                     <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="salesreport" class="btn btn-primary btn-block">View Sales Report</a>
                                     </div>
                                </div>
                            </c:if>
                            <c:if test="${(sales_score == true && management_score == true) || management_score == true}">
                                <div class="col-md-6 col-md-offset-3">
                                    <legend>Client</legend>
                                    <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="allacounts" class="btn btn-primary btn-block">View Client Accounts</a>
                                     </div>
                                </div>
                            </c:if>
                            <c:if test="${sales_score == true && (management_score == false || inventory_score == false)}">
                                <div class="col-md-6">
                                    <legend>Client</legend>
                                    <div class="col-md-10 col-md-offset-1 emphasis">
                                         <a href="allaccounts" class="btn btn-primary btn-block">View Client Accounts</a>
                                     </div>
                                </div>
                            </c:if>
                           <c:if test="${account_type == 'client'}">
                                    <div class="col-md-4 col-md-offset-4 emphasis">
                                         <a href="allinvoices" class="btn btn-primary btn-block"><span class="fa fa-user"></span> View All Invoices </a>
                                     </div>
                                </div>
                           </c:if>
                       </div>
                    </div>                 
                </div>
            </div>
        </div>
    </body>
</html>
