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
        <!-- Projects Row -->
        
        <div class="row">
        <c:forEach var="pb" items="${pb}">
            <div class="content">
                <div class="col-md-4 portfolio-item">
                    <img class="img-responsive" src="img/car-placeholder.png" alt="">
                    <h1 class="product-title text-center">${pb.getProductName()}</h1>
                    
                    <div>
                        <form action="cartservlet" id="cart-form" method="POST">
                        <table class="product-card">
                            <tr>
                                <th>
                                    Category: 
                                </th>
                                <td>
                                    ${pb.getCategoryName()}
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    MSRP: 
                                </th>
                                <td>
                                    ${pb.getMSRP()}
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    Stock: 
                                </th>
                                <td>
                                    ${pb.getStock()}
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    Detail: 
                                </th>
                                <td>
                                    ${pb.getProductDetail()}
                                </td>
                            </tr>
                            <c:if test="${account_type == 'client'}">
                            <tr>
                                <th>
                                    Quantity: 
                                </th>
                                <td>
                                    <input type="hidden" name="item_number" value="${pb.getProductID()}">
                                    <input type="hidden" name="item_name" value="${pb.getProductName()}">
                                    <input type="hidden" name="item_stock" value="${pb.getStock()}">
                                    <input type="hidden" name="item_cost" value="${pb.getMSRP()}">
                                    <input type="hidden" name="action" value="add">
                                    <input type="number" id="quantity" name="quantity"> <input type="submit" name="submit" class="btn btn-default" value="+">
                                </td>
                            </tr>
                            </c:if>
                        </table>
                        </form>
                    </div>
                </div>
            </div>  
        </c:forEach>            
        </div>
        <!-- /.row -->
        <hr>
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
