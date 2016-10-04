<%-- 
    Document   : products
    Created on : Oct 1, 2016, 2:56:32 PM
    Author     : cruzsyd
--%>

<%@page import="com.tsppi.bean.CartBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table{
                color: #fff;
                border: 1px solid #fff;
            }
            input{
                color: #000 !important;
            }
        </style>
    </head>
    <body>
        <%@include file="/WEB-INF/static-page/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <table>
                        <thead>
                            <tr>
                            <th>Item Number</th>                            
                            <th>Item Name</th>                            
                            <th>Item Category</th>                                                        
                            <th>MSRP</th>                            
                            <th>Stock</th> 
                            <th>Detail</th>
                            <th>Add To Cart</th>
                            <tr>
                        </thead>
                        <tbody>
                            <c:forEach var="pb" items="${pb}">
                                
                                <tr>
                                    <td>${pb.getProductID()}</td>
                                    <td>${pb.getProductName()}</td>
                                    <td>${pb.getCategoryName()}</td>
                                    <td>${pb.getMSRP()}</td>
                                    <td>${pb.getStock()}</td>
                                    <td>${pb.getProductDetail()}</td>
                                    <form action="cart" method="POST">
                                        <td>
                                            <input type="hidden" name="item_number" value="${pb.getProductID()}">
                                            <input type="hidden" name="item_name" value="${pb.getProductName()}">
                                            <input type="hidden" name="item_cost" value="${pb.getMSRP()}">
                                            <input type="hidden" name="action" value="add">
                                            Quantity: <input type="number" name="quantity">
                                        </td>
                                        <td>
                                            <input type="submit" name="submit" class="btn btn-warning" value="Add to Cart">
                                        </td>
                                    </form>
                                </tr>
                                
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <table>
          <tr>
            <td>Model Description</td>
            <td>Quantity</td>
            <td>Unit Price</td>
            <td>Total</td>
          </tr>
          
          <c:if test="${cart.getCartSize()==0}">
          <tr>
            <td>Cart is currently empty<br/>
          </tr>
          </c:if>
          <c:forEach var="cart_item" items="${cart.getCartItems()}" varStatus="counter">
          <form name="item" method="POST" action="cart">
          <tr>
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><c:out value="${cart_item.getItemNumber()}"/></b><br/>
              <c:out value="${cart_item.getItemName()}"/></font></td>
            <td>
                <input type='hidden' name='item_number' value='<c:out value="${counter.count}"/>'><br>
                <input type='text' name="quantity" value='<c:out value="${cart_item.getQuantity()}"/>'> <br>
                <input type="submit" name="action" value="update"><br/>         
                <input type="submit" name="action" value="delete"></font></td>
            <td>$<c:out value="${cart_item.getItemCost()}"/></td>
            <td>$<c:out value="${cart_item.getTotalCost()}"/></td>
          </tr>
          </form>
          </c:forEach>
          <tr>
            <td colspan="2"> </td>
            <td></td>
            <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Subtotal: $<c:out value="${cart.getOrderTotal()}"/></font></td>
          </tr>
        </table>
    </body>
</html>
