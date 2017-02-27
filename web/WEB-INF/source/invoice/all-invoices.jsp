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
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <c:choose>
                            <c:when test="${account_type == 'client'}">
                                <h1>Your Invoices</h1>
                            </c:when>
                            <c:otherwise>
                                <h1>All Invoices</h1>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
	</header>
        <section class="team">            
            <div class="container">
                <div class="row">
                    <c:if test="${al1.size() == 0 && al2.size() == 0 && al3.size() == 0 && al4.size() == 0 && al5.size() == 0 && al6.size() == 0}">
                        <div class="col-md-10 col-md-offset-1" id="no-label">
                            <div class="col-lg-12 text-center">
                                <h2>No invoices to be shown</h2>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${al1.size() != 0}">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="col-lg-12">
                                <h3 class="description">Pending Invoices</h3>
                                    <div class="table text-center">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">Tracking ID</th>
                                                    <c:if test="${management_score == true}">
                                                        <th class="text-center">Client Name</th>
                                                    </c:if>
                                                    <th class="text-center">Products</th>
                                                    <th class="text-center">Payment Method</th>
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
                                                        <c:if test="${management_score == true}">
                                                            <td class="text-center">${al1.getFullName()}</td>
                                                        </c:if>
                                                        <td>
                                                            <button class="btn btn-link vib">
                                                                View Ordered Products
                                                                <input type="hidden" class="main-item" value="${al1.getInvoiceID()}">
                                                            </button>
                                                        </td>
                                                        <td>${al1.getPaymentMethod()}</td>
                                                        <td>${al1.getTotalAmount()}</td>
                                                        <td>${al1.getStatusName()}</td>
                                                        <td>${al1.getInvoiceDate()}</td>
                                                        <c:if test="${account_type == 'client'}">
                                                            <td>
                                                                <form action="cancelinvoice" method="POST">
                                                                    <input type="hidden" name="invoice_id" value="${al1.getInvoiceID()}">
                                                                    <input type="submit" name="submit" class="cancel-button form-control btn btn-link" value="Cancel Invoice">
                                                                </form>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${inventory_score == true}">
                                                            <td>
                                                                <form action="approveinvoice" method="POST">
                                                                    <input type="hidden" name="invoice_id" value="${al1.getInvoiceID()}">
                                                                    <input type="hidden" name="action" value="yes">
                                                                    <input type="submit" name="submit" class="form-control btn btn-link" value="Approve Invoice">
                                                                </form>
                                                            </td>
                                                            <td>
                                                                <form action="approveinvoice" method="POST">
                                                                    <input type="hidden" name="invoice_id" value="${al1.getInvoiceID()}">
                                                                    <input type="hidden" name="action" value="no">
                                                                    <input type="submit" name="submit" class="form-control btn btn-link" value="Reject Invoice">
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
                        </c:if>
                        <c:if test="${al2.size() != 0}">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="col-lg-12">
                                    <h3 class="description">Approved Invoices</h3>
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
                                                            <button class="btn btn-link vib">
                                                                View Ordered Products
                                                                <input type="hidden" class="main-item" value="${al2.getInvoiceID()}">
                                                            </button>
                                                        </td>
                                                        <td>${al2.getPaymentMethod()}</td>
                                                        <td>${al2.getTotalAmount()}</td>
                                                        <td>${al2.getStatusName()}</td>
                                                        <td>${al2.getInvoiceDate()}</td>
                                                        <c:if test="${account_type == 'client'}">
                                                            <td>
                                                                <form action="cancelinvoice" method="POST">
                                                                    <input type="hidden" name="invoice_id" value="${al2.getInvoiceID()}">
                                                                    <input type="submit" name="submit" class="form-control btn btn-link" value="Cancel Invoice">
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
                        </c:if>
                        <c:if test="${al4.size() != 0}">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="col-lg-12">
                                    <h3 class="description">Invoices In Process</h3>
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
                                                <c:forEach var="al4" items="${al4}">
                                                    <tr>
                                                        <td>${al4.getInvoiceID()}</td>
                                                        <td>
                                                            <button class="btn btn-link vib">
                                                                View Ordered Products
                                                                <input type="hidden" class="main-item" value="${al4.getInvoiceID()}">
                                                            </button>
                                                        </td>
                                                        <td>${al4.getPaymentMethod()}</td>
                                                        <td>${al4.getTotalAmount()}</td>
                                                        <td>${al4.getStatusName()}</td>
                                                        <td>${al4.getInvoiceDate()}</td>
                                                        <c:if test="${management_score == true}">
                                                            <td>
                                                                <form action="deliverinvoice" method="POST">
                                                                    <input type="hidden" name="invoice_id" value="${al4.getInvoiceID()}">
                                                                    <input type="hidden" name="action" value="yes">
                                                                    <input type="submit" name="submit" class="form-control btn btn-link" value="Deliver!">
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
                        </c:if>
                        <c:if test="${al5.size() != 0}">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="col-lg-12">
                                    <h3 class="description">Invoices in Delivery</h3>
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
                                                <c:forEach var="al5" items="${al5}">
                                                    <tr>
                                                        <td>${al5.getInvoiceID()}</td>
                                                        <td>
                                                            <button class="btn btn-link vib">
                                                                View Ordered Products
                                                                <input type="hidden" class="main-item" value="${al5.getInvoiceID()}">
                                                            </button>
                                                        </td>
                                                        <td>${al5.getPaymentMethod()}</td>
                                                        <td>${al5.getTotalAmount()}</td>
                                                        <td>${al5.getStatusName()}</td>
                                                        <td>${al5.getInvoiceDate()}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>                  
                            </div>
                        </c:if>
                        <c:if test="${al6.size() != 0}">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="col-lg-12">
                                    <h3 class="description">Expired Invoices (Not yet approved nor rejected)</h3>
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
                                                <c:forEach var="al6" items="${al6}">
                                                    <tr>
                                                        <td>${al6.getInvoiceID()}</td>
                                                        <td>
                                                            <button class="btn btn-link vib">
                                                                View Ordered Products
                                                                <input type="hidden" class="main-item" value="${al6.getInvoiceID()}">
                                                            </button>
                                                        </td>
                                                        <td>${al6.getPaymentMethod()}</td>
                                                        <td>${al6.getTotalAmount()}</td>
                                                        <td>${al6.getStatusName()}</td>
                                                        <td>${al6.getInvoiceDate()}</td>
                                                        <c:if test="${account_type == 'client'}">
                                                            <td>
                                                                <form action="resubmitinvoice" method="POST">
                                                                    <input type="hidden" name="invoice_id" value="${al6.getInvoiceID()}">
                                                                    <input type="submit" name="submit" class="form-control btn btn-link" value="Resubmit Invoice">
                                                                </form>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${account_type == 'client'}">
                                                            <td>
                                                                <form action="cancelinvoice" method="POST">
                                                                    <input type="hidden" name="invoice_id" value="${al6.getInvoiceID()}">
                                                                    <input type="submit" name="submit" class="form-control btn btn-link" value="Cancel Invoice">
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
                                                            <button class="btn btn-link vib">
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
                $('.vib').click(function(){
                    $('#showitems').empty();
                    var $invoice_id = $(this).find('.main-item').val();
                    $.getJSON('retrieveitems', {invoice_id: $invoice_id})
                        .done(function(json){
                            var $tableData = "";
                            for(var i=0; i<json.length; i++){
                                $tableData = $('<tr/>');
                                $tableData.append('<td>' + json[i].product_name + '</td>');
                                $tableData.append('<td>' + json[i].item_quantity + '</td>');
                                $('#showitems').append($tableData);
                            }
                        
                        });
                    $('#itemmodal').modal('show');
                });
            });
        </script>
    </body>
</html>
