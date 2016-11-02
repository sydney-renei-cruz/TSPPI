<%-- 
    Document   : products
    Created on : Oct 1, 2016, 2:56:32 PM
    Author     : cruzsyd
--%>

<%@page import="com.tsppi.bean.CartBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="css/display.css" rel="stylesheet">
    
</head>

<body>

    <!-- Navigation -->
    <%@include file="../static-page/navbar.jsp"%>
    <header id="header" style="background-image: url(img/products.jpg); background-size: cover;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1>PRODUCTS</h1>
                </div>
            </div>
        </div>
    </header>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <c:forEach var="pb" items="${pb}">
                <div class="content">
                    <div class="col-sm-4 portfolio-item">
                        <span class="border">
                            <img class="img-responsive" src="img/car-placeholder.png" alt="">
                            <h2 class="text-center">${pb.getProductName()}</h2>
                            <h4 class="text-center">${pb.getProductDetail()}</h4>
                            <h4>Category: ${pb.getCategoryName()}</h4>
                            <h4>Price: ${pb.getMSRP()}</h4>
                            <h4>Stock: ${pb.getStock()}</h4>
                            <div class="text-center">
                                <c:if test="${account_type == 'client'}">
                                    <form method="POST" class="search-bar navbar-form" style="border: 1px solid transparent;" action="cartservlet">
                                        <div class="input-group">
                                            <input type="hidden" name="item_number" value="${pb.getProductID()}">
                                            <input type="hidden" name="item_name" value="${pb.getProductName()}">
                                            <input type="hidden" name="item_stock" value="${pb.getStock()}">
                                            <input type="hidden" name="item_cost" value="${pb.getMSRP()}">
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
                                        <input type="hidden" name="product_id" id="product_id" value="${pb.getProductID()}">
                                        <input type="submit" name="submit" id="submit" value="Edit Product" class="btn btn-warning">
                                    </form><br>
                                    <form action="productapprovalservlet" method="POST">
                                    <input type="hidden" name="product_id" id="product_id" value="${pb.getProductID()}">
                                    <input type="hidden" name="for_sale" id="for_sale" value="${pb.getForSale()}">
                                    <c:if test="${pb.getForSale()}">
                                        <input type="submit" name="submit" id="submit" value="Remove from For-Sale List" class="btn btn-danger">
                                    </c:if>
                                    <c:if test="${!pb.getForSale()}">                                                     
                                        <input type="submit" name="submit" id="submit" value="Add to For-Sale List" class="btn btn-danger">
                                    </c:if>
                                </form>
                                </c:if>
                            </div>
                        </span>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- /.container -->
    <!-- pagination -->
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

    <!-- creating a pagination -->
    <script src="imports/jquery.matchHeight-min.js"></script>
    
    <script>
        $(function(){
            $('.portfolio-item').matchHeight();
        });
    </script>
    <script src="js/pagination.js"></script>
</body>

</html>
