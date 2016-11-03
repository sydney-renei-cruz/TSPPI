<%-- 
    Document   : all-orders
    Created on : Oct 26, 2016, 8:39:50 AM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/item-list.css">
    </head>
    <body>
        <%@include file="/WEB-INF/static-page/navbar.jsp" %>
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Your Invoices</h1>
                    </div>
                </div>
            </div>
	</header>
        <section class="team">            
            <div class="container">
              <div class="row">
                  <c:if test="${al1.size() != 0}">
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                      <h3 class="description">Pending Orders</h3>
                      <div class="table text-center">
                          <table class="table">
                              <thead>
                                  <tr>
                                    <th class="text-center">Tracking ID</th>
                                    <c:if test="${job_position == 'Vice President'}">
                                    <th class="text-center">Client Name</th>
                                    </c:if>
                                    <th class="text-center">Products</th>
                                    <th class="text-center">PaymentMethod</th>
                                    <th class="text-center">Total Amount</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Invoice Created</th>
                                    <th></th>
                                </tr>
                              </thead>
                              <tbody>
                                  <c:forEach var="al1" items="${al1}">
                                  <tr>
                                        <td>${al1.getInvoiceID()}</td>
                                        <c:if test="${job_position == 'Vice President'}">
                                        <td class="text-center">${al1.getFullName()}</td>
                                        </c:if>
                                        <td><a href="#"> View Ordered Products</a></td>
                                        <td>${al1.getPaymentMethod()}</td>
                                        <td>${al1.getTotalAmount()}</td>
                                        <td>${al1.getStatusName()}</td>
                                        <td>${al1.getInvoiceDate()}</td>
                                        <c:if test="${account_type == 'client'}">
                                        <td><a href="#"> Cancel Order </a></td>
                                        </c:if>
                                        <c:if test="${job_position == 'Vice President'}">
                                            <td><a href="#"> Confirm? </a></td>
                                        </c:if>
                                  </tr>
                                  </c:forEach>
                              </tbody>
                          </table>
                      </div>
                    </div>                  
                </div>
                  </c:if>
                <c:if test="${al2.size() != 0}">
                  <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                      <h3 class="description">Approved Orders</h3>
                      <div class="table text-center">
                          <table class="table">
                              <thead>
                                  <tr>
                                    <th class="text-center">Tracking ID</th>
                                    <th class="text-center">Products</th>
                                    <th class="text-center">Payment Method</th>
                                    <th class="text-center">Total Amount</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Invoice Created</th>
                                    <th></th>
                                </tr>
                              </thead>
                              <tbody>
                                  <c:forEach var="al2" items="${al2}">
                                  <tr>
                                      <td>${al2.getInvoiceID()}</td>
                                      <td><a href="#"> View Ordered Products</a></td>
                                      <td>${al2.getPaymentMethod()}</td>
                                      <td>${al2.getTotalAmount()}</td>
                                      <td>${al2.getStatusName()}</td>
                                      <td>${al2.getInvoiceDate()}</td>
                                      <c:if test="${account_type == 'client'}">
                                        <td><a href="#"> Cancel Order </a></td>
                                      </c:if>
                                  </tr>
                                  </c:forEach>
                              </tbody>
                          </table>
                      </div>
                    </div>                  
                </div>
                  </c:if>
                  <c:if test="${al3.size() != 0}">
                  <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                      <h3 class="description">Canceled and Rejected Orders</h3>
                      <div class="table text-center">
                          <table class="table">
                              <thead>
                                  <tr>
                                    <th class="text-center">Tracking ID</th>
                                    <th class="text-center">Products</th>
                                    <th class="text-center">Payment Method</th>
                                    <th class="text-center">Total Amount</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Invoice Created</th>
                                    <th></th>
                                </tr>
                              </thead>
                              <tbody>
                                  <c:forEach var="al3" items="${al3}">
                                  <tr>
                                      <td>${al3.getInvoiceID()}</td>
                                      <td><a href="#"> View Ordered Products</a></td>
                                      <td>${al3.getPaymentMethod()}</td>
                                      <td>${al3.getTotalAmount()}</td>
                                      <td>${al3.getStatusName()}</td>
                                      <td>${al3.getInvoiceDate()}</td>
                                  </tr>
                                  </c:forEach>
                              </tbody>
                          </table>
                      </div>
                    </div>                  
                </div>
                  </c:if>
              </div>
            </div>
          </section>
        
    </body>
</html>
