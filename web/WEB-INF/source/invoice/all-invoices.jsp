<%-- 
    Document   : all-orders
    Created on : Oct 26, 2016, 8:39:50 AM
    Author     : cruzsyd
--%>

<html>
    <head>
<!--        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">-->
        <link rel="stylesheet" href="css/item-list.css">
        <link rel="stylesheet" href="imports/datatables.css">
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <c:choose>
                            <c:when test="${al.size() > 0}">
                                <c:choose>
                                    <c:when test="${account_type == 'client'}">
                                        <h1>Your Invoices</h1>
                                    </c:when>
                                    <c:otherwise>
                                        <h1>All Invoices</h1>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <h1>No invoices to be shown.</h1>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
	</header>
        <c:if test="${al.size() > 0}">
        <section class="team">
            <div class="container-fluid">
                <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="col-lg-12">
                                    <div class="table text-center">
                                        <table class="table invoice-table">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">Tracking #</th>
                                                    <c:if test="${sales_score == true}">
                                                        <th class="text-center">Requested by</th>
                                                    </c:if>
                                                    <th class="text-center"></th>
                                                    <th class="text-center">Payment Method</th>
                                                    <th class="text-center">Total Amount</th>
                                                    <th class="text-center">Status</th>
                                                    <th class="text-center">Invoice Created</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="al" items="${al}">
                                                    <tr>
                                                        <td>${al.getTrackingID()}</td>
                                                        <c:if test="${sales_score == true}">
                                                            <td class="text-center">
                                                                <button class="btn btn-link cli">
                                                                    ${al.getFullName()}
                                                                    <input type="hidden" class="client-info" value="${al.getClientID()}">
                                                                </button>
                                                                
                                                            </td>
                                                        </c:if>
                                                        <td>
                                                            <button class="btn btn-link vib">
                                                                View Orders
                                                                <input type="hidden" class="main-item" value="${al.getInvoiceID()}">
                                                            </button>
                                                        </td>
                                                        <td>${al.getPaymentMethod()}</td>
                                                        <td>${al.getTotalAmount()}</td>
                                                        <td>${al.getInvoiceStatus()}</td>
                                                        <td>${al.getInvoiceDate()}</td>
                                                        <td>
                                                            <c:if test="${account_type == 'client'}">
                                                                <c:if test="${al.getInvoiceStatus() == 'Pending' || al.getInvoiceStatus() == 'Approved'}">
                                                                <form action="cancelinvoice" method="POST">
                                                                    <input type="hidden" name="invoice_id" value="${al.getInvoiceID()}">
                                                                    <input type="submit" name="submit" class="cancel-button form-control btn btn-link" value="Cancel Invoice">
                                                                </form>
                                                                </c:if>
                                                             </c:if>
                                                            <c:if test="${sales_score == true}">
                                                             <c:if test="${al.getInvoiceStatus() == 'Pending'}">
                                                                <button class="btn btn-link cir">
                                                                    Confirm
                                                                    <input type="hidden" class="confirm-info" value="${al.getInvoiceID()}">
                                                                </button>
                                                                </c:if>
                                                                <c:if test="${al.getInvoiceStatus() == 'Approved'}">
                                                                    <form action="deliverinvoice" method="POST">
                                                                        <input type="hidden" name="invoice_id" value="${al.getInvoiceID()}">
                                                                        <input type="hidden" name="action" value="yes">
                                                                        <input type="submit" name="submit" class="form-control btn btn-link" value="In Delivery">
                                                                    </form>
                                                                </c:if>
                                                            </c:if>
                                                        </td>
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
        <div id="confirmmodal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <tbody id="show-confirmation">
                                <td>
                                    <form action="approveinvoice" class="confirm-form" method="POST">
                                        <div class="invoice_details"></div>
                                        <input type="hidden" name="action" value="yes">
                                        <input type="submit" name="submit" class="form-control btn btn-link" value="Approve">
                                    </form>
                                </td>
                                <td>
                                    <form action="approveinvoice" class="confirm-form" method="POST">
                                        <div class="invoice_details"></div>
                                        <input type="hidden" name="action" value="no">
                                        <input type="submit" name="submit" class="form-control btn btn-link" value="Reject">
                                    </form>
                                </td>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
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
        <div id="clientmodal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Client Information</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Mobile</th>
                                    <th>Company Name - Branch</th>
                                    <th>Mailing Address</th>
                                </tr>
                            </thead>
                            <tbody id="showinfo">
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                $('.cli').click(function(){
                    $('#showinfo').empty();
                    var $client_id = $(this).find('.client-info').val();
                    $.getJSON('clientinfomodal', {client_id: $client_id})
                        .done(function(json){
                            var $tableData = "";
                            for(var i=0; i<json.length; i++){
                                $tableData = $('<tr/>');
                                $tableData.append('<td>' + json[i].first_name + " " + json[i].last_name + '</td>');
                                $tableData.append('<td>' + json[i].email + '</td>');
                                $tableData.append('<td>' + json[i].mobile + '</td>');
                                $tableData.append('<td>' + json[i].company_name + "-" + json[i].company_branch + '</td>');
                                $tableData.append('<td>' 
                                        + json[i].street_line1 + " " + json[i].street_line2 + json[i].city +
                                         " " + json[i].spr + " " + json[i].postal_code + " " + json[i].country + 
                                        '</td>');
                                $('#showinfo').append($tableData);
                            }
                        });
                    $('#clientmodal').modal('show');
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('.cir').click(function(){
                    $('.invoice_details').empty();
                    var $invoice_id = $(this).find('.confirm-info').val();
                    $.getJSON('confirmmodal', {invoice_id: $invoice_id})
                        .done(function(json){
                            var $tableData = "";
                            for(var i=0; i<json.length; i++){
                                $tableData = $('<span/>');
                                $tableData.append('<input type="hidden" name="invoice_id" value="' + json[i].invoice_id + '">');
                                $('.invoice_details').append($tableData);
                            }
                        });
                    $('#confirmmodal').modal('show');
                });
            });
        </script>
        <script type="text/javascript">
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
  
        <script type="text/javascript" src="imports/datatables.js"></script>
        <c:if test="${sales_score == true}">
            <script>
              $(function(){
                $(".invoice-table").dataTable({
                    "columnDefs": [
                        {"orderable": false, "targets": 2},
                        {"orderable": false, "targets": 7}
                    ]
                });
                $.noConflict();
              });
            </script>
        </c:if>
        <c:if test="${account_type == 'client'}">
            <script>
              $(function(){
                $(".invoice-table").dataTable({
                    "columnDefs": [
                        {"orderable": false, "targets": 1},
                        {"orderable": false, "targets": 6}
                    ]
                });
                $.noConflict();
              });
            </script>
        </c:if>    
  </c:if>
    </body>
</html>