<%-- 
    Document   : order-request
    Created on : Oct 15, 2016, 8:09:33 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/form.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Invoice Request</h1>
                    </div>
                </div>
            </div>
	</header>
        <section>
            <c:choose>
                <c:when test="${al2.size() == 0}">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1" id="no-label">
                                <div class="col-lg-12 text-center" style="color: #fff;">
                                   <h2>Transaction cannot be done, No payment method to be shown.</h2>
                                   <a href="cart" style="color: #fff;">Go back to Cart.</a>
                                </div>
                            </div>
                        </div>
                    </div>  
                </c:when>
                <c:otherwise>
                    <div id="login-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <div class="panel panel-login">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <a class="active" id="login-form-link">Invoice</a>
                                                </div>
                                            </div>
                                            <hr>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-12" >
                                                    <c:forEach var="al" items="${al}">
                                                        <div class="form-group">
                                                            Name: <strong>${al.getFullName()}</strong>
                                                        </div>
                                                        <div class="form-group">
                                                            Email: <strong>${al.getEmail()}</strong>
                                                        </div>
                                                        <div class="form-group">
                                                            Mobile: <strong>${al.getMobile()}</strong>
                                                        </div>
                                                        <div class="form-group">
                                                            Company: <strong>${al.getCompanyName()} - ${al.getCompanyBranch()}</strong>
                                                        </div>
                                                        <div class="form-group">
                                                            Company Telephone: <strong>${al.getCompanyTelephone()}</strong>
                                                        </div>
                                                        <div class="form-group">
                                                            Company Mailing Address: <strong>${al.getCompanyAddress()}</strong>
                                                        </div>
                                                    </c:forEach>
                                                </div>                                        
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="text-center" style="font-size: 1.5em;"><strong>Cart Summary</strong></div>
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th>Product</th>
                                                                <th>Quantity</th>
                                                                <th class="text-center">Stock</th>
                                                                <th class="text-center">Price</th>
                                                                <th class="text-center">Total</th>
                                                                <th> </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="cart_item" items="${cart.getCartItems()}" varStatus="counter">
                                                            <tr>
                                                                <td class="col-md-1"></td>
                                                                <td class="col-md-6">
                                                                <div class="media">
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading">${cart_item.getItemName()}</h4>
                                                                    </div>
                                                                </div></td>

                                                                    <td class="col-md-1" style="text-align: center">
                                                                        x${cart_item.getQuantity()}
                                                                    </td>
                                                                    <td class="col-md-2 text-center"><strong>${cart_item.getItemStock()}</strong></td>
                                                                    <td class="col-md-2 text-center"><strong>₱${cart_item.getItemCost()}</strong></td>
                                                                    <td class="col-md-2 text-center"><strong>₱${cart_item.getTotalCost()}</strong></td>
                                                            </tr>
                                                            </c:forEach>
                                                    </tbody>
                                                    </table>
                                                    <div class="col-lg-12 text-center"> <h3><strong>Total: ₱${cart.getOrderTotal()}</strong></h3></div>
                                                </div>                                        
                                            </div>
                                            <div class="row text-center">
                                                <div class="col-lg-12">
                                                    <form class="cart-form" action="generateinvoicerequest" method="POST">
                                                        <c:forEach var="al" items="${al}">
                                                            <input type="hidden" name="client_id" value="${al.getClientID()}">
                                                        </c:forEach>
                                                        <c:forEach var="cart_item" items="${cart.getCartItems()}" varStatus="counter">
                                                            <div class="special-container">
                                                                <input type="hidden" name="item_number" value="${cart_item.getItemNumber()}">
                                                                <input type="hidden" name="item_name" value="${cart_item.getItemName()}">
                                                                <input type="hidden" name="total_amount" value="${cart.getOrderTotal()}">
                                                                <input type="hidden" name="quantity" value="${cart_item.getQuantity()}">
                                                                <input type="hidden" name="item_stock" value="${cart_item.getItemStock()}">
                                                            </div>
                                                        </c:forEach>

                                                        <label>Payment Method: </label>
                                                        <select name="payment_method">
                                                            <c:forEach var="al2" items="${al2}">
                                                                <option value="${al2.getPMID()}">${al2.getPaymentMethod()}</option>
                                                            </c:forEach>
                                                        </select><hr>
                                                        <p id="err-msg" style="color: #FF0000;"></p>
                                                        <button type="submit" class="btn btn-success">
                                                            Generate Invoice Request <span class="glyphicon glyphicon-play"></span>
                                                        </button><br>
                                                        <a href="cart">Go back to cart</a>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
	</section>
        <script src="js/invoice-request-validation.js" type="text/javascript"></script>
    </body>
</html>
