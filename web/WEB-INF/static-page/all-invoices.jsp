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
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
        
<!--        <script type="text/javascript">
        $(document).ready(function(){
            $("#conf-order").click(function(){
                alert("Please check e-mail to confirm");
            });
            
            $("#cancel-order").click(function(){
                alert("Order has been canceled");
            });
        });
        </script>-->
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
                                        <td>
                                            <button class="btn btn-link view-items">
                                                View Ordered Products
                                                <input type="hidden" class="main-item" value="${al1.getInvoiceID()}">
                                            </button>
                                        </td>
                                        <td>${al1.getPaymentMethod()}</td>
                                        <td>${al1.getTotalAmount()}</td>
                                        <td>${al1.getStatusName()}</td>
                                        <td>${al1.getInvoiceDate()}</td>
                                        <c:if test="${account_type == 'client'}">
                                        <td><a id="cancel-order" href="#"> Cancel Order </a></td>
                                        </c:if>
                                        <c:if test="${job_position == 'Vice President'}">
                                            <td><a id="conf-order" href="#"> Confirm? </a></td>
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
                                      <td>
                                            <button class="btn btn-link view-items">
                                                View Ordered Products
                                                <input type="hidden" class="main-item" value="${al2.getInvoiceID()}">
                                            </button>
                                        </td>
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
                                      <td>
                                            <button class="btn btn-link view-items">
                                                View Ordered Products
                                                <input type="hidden" class="main-item" value="${al3.getInvoiceID()}">
                                            </button>
                                        </td>
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
        <div id="itemmodal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Items Purchased</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Products</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody id="showitems">
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            $(document).ready(function(){
                $('.view-items').click(function(){
                    $('#show-items').empty();
                    var $invoice_id = $(this).find('.main-item').val();
                    $.getJSON('retrieveitems', {invoice_id: $invoice_id})
                        .done(function(json){
                            var $tableData = "";
                            for(var i=0; i<json.length; i++){
                                $tableData = $('<tr/>');
                                $tableData.append('<td>' + json[i].product_name + '</td>');
                                $tableData.append('<td>' + json[i].item_quantity + '</td>');
                                $('#showitems').append($tableData);s
                            }
                        });
                        $('#itemmodal').show();
                });
            });
        </script>
    </body>
</html>
