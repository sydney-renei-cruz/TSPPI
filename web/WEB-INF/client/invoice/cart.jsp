<%-- 
    Document   : cart
    Created on : Oct 15, 2016, 9:18:01 AM
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
                        <h1>Shopping Cart</h1>
                    </div>
                </div>
            </div>
	</header>
        <section>
            <div id="login-body">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-10 col-md-offset-1">
                            <div class="well profile">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th class="text-center">Price</th>
                                            <th class="text-center">Total</th>
                                            <th> </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="cart_item" items="${cart.getCartItems()}" varStatus="counter">
                                        <tr>
                                            <td class="col-md-6">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <h4 class="media-heading">${cart_item.getItemName()}</h4>
                                                        <span>Stock: ${cart_item.getItemStock()}</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <form action="cartcontroller" method="POST">
                                                <td class="col-md-1" style="text-align: center">
                                                    <input type="number" class="form-control" name="quantity" id="item_quantity" value="${cart_item.getQuantity()}">
                                                    <input type='hidden' name='item_number' value='<c:out value="${counter.count}"/>'><br>
                                                </td>
                                                <td class="col-md-1 text-center"><strong>₱${cart_item.getItemCost()}</strong></td>
                                                <td class="col-md-1 text-center"><strong>₱${cart_item.getTotalCost()}</strong></td>
                                                <td class="col-md-1">
                                                    <input type="hidden" name="item_stock" value="${cart_item.getItemStock()}">
                                                    <input type="hidden" name="action" value="update">
                                                    <button type="submit" class="btn btn-warning">
                                                        <span class="glyphicon glyphicon-repeat"></span> Update
                                                    </button>

                                                </td>
                                            </form>

                                            <td class="col-md-1">
                                                <form action="cartcontroller" method="POST">
                                                    <input type='hidden' name='item_number' value='<c:out value="${counter.count}"/>'>
                                                    <input type="hidden" name="action" value="x">
                                                    <button type="submit" class="btn btn-danger">
                                                        <span class="glyphicon glyphicon-remove"></span> Remove
                                                    </button>
                                                </form>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                        <tr>
                                            <td>   </td>
                                            <td>   </td>
                                            <td>   </td>
                                            <td>   </td>
                                            <td><h3>Total</h3></td>
                                            <td class="text-right">
                                                <h3><strong>₱${cart.getOrderTotal()}</strong></h3>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>   </td>
                                            <td>   </td>
                                            <td>   </td>
                                            <td>   </td>
                                            <td>
                                                <a href="products" class="btn btn-default">
                                                    <span class="glyphicon glyphicon-shopping-cart"></span> Go Shop
                                                </a>
                                            </td>
                                            <td>
                                                <a href="invoicerequest" class="btn btn-success">
                                                    Checkout <span class="glyphicon glyphicon-play"></span>
                                                </a>
                                            </td>
                                        </tr>
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
