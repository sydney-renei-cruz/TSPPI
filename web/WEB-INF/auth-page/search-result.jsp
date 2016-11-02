<%-- 
    Document   : product-view
    Created on : Sep 27, 2016, 11:08:58 PM
    Author     : Jasteen
    Reference  : http://www.javaknowledge.info/search-from-database-using-servlet-and-jsp/

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imports/bootstrap.css" rel="stylesheet">
        <link href="css/display.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
        
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Search Results</h1>
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
        <!-- Projects Row -->
            <c:forEach var="al" items="${al}">
            <div class="row">
                <div class="col-md-4 service-item">
                    <img class="img-responsive" src="img/car-placeholder.png" alt="">
                </div>
                <h1 class="product-title">${al.getProductName()}</h1>
                <div>
                    <table class="product-card">
                        <tr>
                            <td>
                                ${al.getProductDetail()}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price: ${al.getMSRP()}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Product Category: ${al.getCategoryName()}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Stock: ${al.getStock()}
                            </td>
                        </tr>
                        <c:if test="${account_type == 'client'}">
                        <tr>
                            <td>
                                <form method="POST" class="search-bar navbar-form" style="border: 1px solid transparent;" action="cartservlet">
                                    <div class="input-group">
                                        <input type="hidden" name="item_number" value="${al.getProductID()}">
                                        <input type="hidden" name="item_name" value="${al.getProductName()}">
                                        <input type="hidden" name="item_stock" value="${al.getStock()}">
                                        <input type="hidden" name="item_cost" value="${al.getMSRP()}">
                                        <input type="hidden" name="action" value="add">
                                        <input type="number" class="form-control" placeholder="Quantity..." name="quantity" id="quantity">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" type="submit">
                                                <i class="glyphicon glyphicon-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        </c:if>
                        <c:if test="${job_position == 'Inventory Officer'}">
                        <tr>
                            <td>
                                <form action="editproduct" method="GET">
                                    <input type="hidden" name="product_id" id="product_id" value="${al.getProductID()}">
                                    <input type="submit" name="submit" id="submit" value="Edit Product" class="btn btn-warning">
                                </form>
                                <form action="productapprovalservlet" method="POST">
                                    <input type="hidden" name="product_id" id="product_id" value="${al.getProductID()}">
                                    <input type="hidden" name="for_sale" id="for_sale" value="${al.getForSale()}">
                                    <c:if test="${al.getForSale()}">
                                        <input type="submit" name="submit" id="submit" value="Remove from For-Sale List" class="btn btn-danger">
                                    </c:if>
                                    <c:if test="${!al.getForSale()}">                                                     
                                        <input type="submit" name="submit" id="submit" value="Add to For-Sale List" class="btn btn-danger">
                                    </c:if>
                                </form>
                            </td>
                        </tr>
                        </c:if>
                    </table>
                </div>
            </div>
            <hr>
            </c:forEach>
            <!-- /.row -->
        </div>
    </body>
</html>
