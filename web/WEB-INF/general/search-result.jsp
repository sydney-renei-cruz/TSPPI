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
        <link href="css/display.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="../source/navigation/navbar.jsp" %>
        
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Search Results</h1>
                    </div>
                </div>
            </div>
        </header>
        <section>
            <div class="container">
                <div class="well well-sm">
                    <strong>View As: </strong>
                    <div class="btn-group">
                        <a href="#" id="list" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-th-list"></span>
                        </a>
                        <a href="#" id="grid" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-th"></span>
                        </a>
                    </div>
                </div>
                <div id="products" class="row list-group">
                    <c:forEach var="al" items="${al}">
                    <div class="item col-xs-4 col-lg-4 content">
                        <img class="img-responsive" src="img/car-placeholder.png" alt="">
                        <div class="thumbnail">
                            <div class="caption">
                                <h4 class="group inner list-group-item-heading">${al.getProductName()}</h4>
                                <div class="info">
                                    <p class="group inner list-group-item-text">${al.getProductDetail()}</p>
                                    <p class="group inner list-group-item-text">Category: ${al.getCategoryName()}</p>

                                </div>
                                <p class="group inner list-group-item-text">Stock: ${al.getStock()}</p>
                                <p class="lead">₱${al.getMSRP()}</p>
                                <c:if test="${account_type == 'client'}">
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
                                </c:if>
                                <c:if test="${job_position == 'Inventory Officer'}">
                                    <form action="editproduct" method="GET">
                                        <input type="hidden" name="product_id" id="product_id" value="${al.getProductID()}">
                                        <input type="submit" name="submit" id="submit" value="Edit Product" class="btn btn-warning">
                                    </form><br>
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
                                </c:if>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    <nav class="text-center">
            <div class="col-lg-12">
                    <ul class="pagination">
                            <li class="pag_prev">
                                    <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                    </a>
                            </li>
                            <li class="pag_next">
                                    <a href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                    </a>
                            </li>
                    </ul>
            </div>
    </nav>
    <script src="js/pagination.js"></script>
    <script src="js/grid-list-display.js"></script>
    <script src="js/grid-height.js"></script>
    </body>
</html>
