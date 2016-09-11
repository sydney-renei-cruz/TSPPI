<%-- 
    Document   : add-product
    Created on : Sep 11, 2016, 9:17:59 AM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/form.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
        
        <header id="login-header" style="background-image: url(img/Sandberg-wallpaper.jpg); background-size: cover;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Product</h1>
                    </div>
                </div>
            </div>
	</header>
        <section>
            <div id="login-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div class="panel panel-login">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <a class="active" id="login-form-link">Add Product</a>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form id="register-form" action="addproductservlet" method="post" autocomplete="off">
                                                <div class="form-group">
                                                    <input type="text" name="product_name" id="product_name" class="form-control" placeholder="Product Name">
                                                </div>                       
                                                <div class="form-group">
                                                        <input type="number" step="0.01" name="msrp" id="msrp" class="form-control" placeholder="MSRP">
                                                </div>
                                                <div class="form-group">
                                                    <input type="number" name="stock" id="stock" class="form-control" placeholder="Stock">
                                                </div>		
                                                <div class="form-group">
                                                    <textarea rows="4" cols="50" name="product_detail" id="product_detail" class="form-control" placeholder="Details about the product"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3"> 
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Add Product">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="productapproval" class="forgot-password">Approve products.</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="#" class="forgot-password">See all products.</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>                 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	</section>
    </body>
</html>
