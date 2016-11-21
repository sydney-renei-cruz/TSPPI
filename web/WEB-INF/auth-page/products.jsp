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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("button").click(function(){
                var qty = document.getElementById('quantity');
                var qtyInput = parseInt(qty, 10);
                
                if (qtyInput > 0)
                {
                    alert(qty);
                }else{
                    alert("Please input a number");
                }
                
            });
        });
    </script>
    
    
</head>

<body>

    <!-- Navigation -->
    <%@include file="../static-page/navbar.jsp"%>
    <header id="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1>PRODUCTS</h1>
                </div>
            </div>
        </div>
    </header>
    <!-- main content -->
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
                    
                        <select>
                            <c:forEach var="pb" items="${pb}">
                                <option value="${pb.getCategoryName()}">${pb.getCategoryName()}</option>
                            </c:forEach>
                        </select>
                    
                        <button>Filter</button>
                </div>
                
            </div>
            <div id="products" class="row list-group">
                
                <input type="hidden" id="category_val" name="x" value="Thermal Rolls">
                
                <c:set var="category" value="Envelopes"/>
                
                <c:forEach var="pb" items="${pb}">
                <div class="item col-xs-4 col-lg-4 content">
                    <img class="img-responsive" src="img/car-placeholder.png" alt="">
                        
                    <div class="thumbnail">
                        <div class="caption">
                            <h4 class="group inner list-group-item-heading">${pb.getProductName()}</h4>
                            <div class="info">
                                <p class="group inner list-group-item-text">${pb.getProductDetail()}</p>
                                <p class="group inner list-group-item-text">Category: ${pb.getCategoryName()}</p>
                                
                            </div>
                            <p class="group inner list-group-item-text">Stock: ${pb.getStock()}</p>
                            <p class="lead">₱${pb.getMSRP()}</p>
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
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
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
    <script src="js/pagination.js"></script>
    <script src="js/grid-list-display.js"></script>
    <script src="js/grid-height.js"></script>
    
</body>

</html>
