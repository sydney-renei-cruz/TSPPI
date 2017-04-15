<%-- 
    Document   : products
    Created on : Oct 1, 2016, 2:56:32 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="css/display.css" rel="stylesheet">
        <link href="css/form-error-validation.css" rel="stylesheet" type="text/css">
</head>
<body>

    <!-- Navigation -->
    <%@include file="../source/navigation/navbar.jsp"%>
    
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
                <strong>Sort: </strong>
                <form action="products" method="POST" id="product-filter">
                    <select class="sort-options" id="sort-options" name="sort-options" onchange="filterProducts()"">
                        <option value="All">All</option>
                        <c:forEach var="pc" items="${pc}">
                            <option value="${pc.getCategoryName()}">${pc.getCategoryName()}</option>
                        </c:forEach>
                    </select>
                </form>
            </div>
            <div id="products" class="row list-group">
                <div id="columns">
                    <c:forEach var="pb" items="${pb}">
                        <div class="content">
                            <figure class="item" data-groups='["${pb.getCategoryName()}"]' data-title='["${pb.getProductName()}"]'>
                                <img src="img?pi=${pb.getProductID()}">
                                <figcaption>
                                    <div class="view-product">
                                        <h4>${pb.getProductName()}</h4>
                                        <button class="btn btn-link vib">
                                            <h5>View Details</h5>
                                            <input type="hidden" class="main-product" value="${pb.getProductID()}">
                                        </button>
                                        <c:if test="${inventory_score == true}">
                                        <form action="approveproduct" method="POST">
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
                                </figcaption>
                            </figure>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    
    <!--Product Details Modal-->
    <div id="product-modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Product Category</th>
                                <th>Stock</th>
                                <th>Price</th>
                                <th>Product Details</th>
                            </tr>
                        </thead>
                        <tbody id="show-products">
                        </tbody>
                    </table>
                    <c:if test="${account_type == 'client'}">
                        
                        <div class="row text-center">
                            <div class="col-md-6 col-md-offset-3">
                                <h4><strong>Add to Cart</strong></h4>
                                <form method="POST" class="search-bar navbar-form cart-form" action="cartcontroller" autocomplete="off" id="addForm">
                                    <div class="form-group cart-element"></div>
                                    <div class="form-group">
                                        <input type="hidden" name="action" value="add">
                                        <input type="number" class="form-control quantity" placeholder="How many do you want?" name="quantity">
                                        <span class="err-msg" style="color: #FF0000"></span>
                                    </div>
                                </form>
                                <div class="form-group">
                                        <button class="btn btn-primary add-product-btn" id="addToCart">
                                            <i class="glyphicon glyphicon-plus"></i> Add
                                        </button>
                                    </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${job_position == 'Inventory Officer'}">
                        <form action="editproduct" method="GET">
                            <div class="edit-element"></div>
                            <input type="submit" name="submit" id="submit" value="Edit Product" class="btn btn-warning">
                        </form>
                    </c:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!--Product Details Modal-->
        
    <!--Alert Box Modal-->
    <div id="mssgBox" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <br>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    Your order was filed successfully!
                </div>
                <div class="modal-footer">
                    <br>
                </div>
            </div>
        </div>
    </div>
    <!--Alert Box Modal-->
    
    <c:if test="${job_position == 'Inventory Officer'}">
    <div class="text-center">
        <a href="approveproducts" style="color: #fff;">Approve Products</a>
    </div>
    </c:if>
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
    <!-- pagination -->
    <script>
            $(document).ready(function(){
                $('.vib').click(function(){
                    $('#show-products').empty();
                    $('.modal-title').empty();
                    $('.cart-element').empty();
                    $('.edit-element').empty();
                    
                    var $product_id = $(this).find('.main-product').val();
                    $.getJSON('retrieveproducts', {product_id: $product_id})
                        .done(function(json){
                            var $tableData = "";
                            var $spanData = "";
                            var $cartData = "";
                            var $editData = "";
                            
                            for(var i=0; i<json.length; i++){
                                $spanData = $('<span/>');
                                $spanData.append(json[i].product_name);
                                $('.modal-title').append($spanData);
                                
                                $tableData = $('<tr/>');
                                $tableData.append('<td>' + json[i].category_name + '</td>');
                                $tableData.append('<td>' + json[i].stock + '</td>');
                                $tableData.append('<td>' + json[i].msrp + '</td>');
                                $tableData.append('<td>' + json[i].product_detail + '</td>');
                                $('#show-products').append($tableData);
                                
                                $cartData = $('<span/>');
                                $cartData.append('<input type="hidden" class="item_number" name="item_number" value="'+ json[i].product_id +'">');
                                $cartData.append('<input type="hidden" class="item_name" name="item_name" value="'+ json[i].product_name +'">');
                                $cartData.append('<input type="hidden" name="item_stock" value="'+ json[i].stock +'">');
                                $cartData.append('<input type="hidden" name="item_cost" value="'+ json[i].msrp +'">');
                                $('.cart-element').append($cartData);
                                
                                $editData = $('<span/>');
                                $editData.append('<input type="hidden" name="product_id" value="'+ json[i].product_id +'">');
                                $('.edit-element').append($editData);
                            }
                        
                        });
                    $('#product-modal').modal('show');
                });
                $('.mssg').click(function(){
                    $('#mssgBox').modal('show');
                });
            });
        </script>
        
        <script>
            function createCookie(name,value,days) {
                var expires = "";
                if (days) {
                    var date = new Date();
                    date.setTime(date.getTime() + (days*24*60*60*1000));
                    expires = "; expires=" + date.toUTCString();
                }
                document.cookie = name + "=" + value + expires + "; path=/";
            }

            function readCookie(name) {
                var nameEQ = name + "=";
                var ca = document.cookie.split(';');
                for(var i=0;i < ca.length;i++) {
                    var c = ca[i];
                    while (c.charAt(0)==' ') c = c.substring(1,c.length);
                    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
                }
                return null;
            }

            function eraseCookie(name) {
                createCookie(name,"",-1);
            }
            
            function filterProducts(){
                var e = document.getElementById("sort-options");
                var strValue = e.options[e.selectedIndex].text;
                createCookie('sort-category', strValue, 7);
                document.getElementById("product-filter").submit();
            }
            
            $(function(){
                var x = readCookie('sort-category');
                
                if(x){
                    
                    $("#sort-options").val(x);
                }
            });
        </script>
    
    <script src="js/pagination.js"></script>
    <script src="imports/jquery.validate.js" type="text/javascript"></script>
    <script src="js/to-cart-validation.js" type="text/javascript"></script>
    
    <script src="imports/shuffle.js" type="text/javascript"></script>
    <script src="js/shuffle-sort.js" type="text/javascript"></script>
</body>

</html>
