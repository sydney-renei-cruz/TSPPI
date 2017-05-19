<%-- 
    Document   : add-product-category
    Created on : 02 19, 17, 7:25:20 PM
    Author     : Sydney Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/form.css" rel="stylesheet" type="text/css">
        <link href="css/form-error-validation.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Add Product Category</h1>
                    </div>
                </div>
            </div>
	</header>
        <section>
            <div id="login-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <%@include file="/WEB-INF/source/mssgBox.jsp" %>
                            <div class="panel panel-login">
                                <div class="panel-heading">
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form id="service-product-form" action="addproductcategorycontroller" method="post" autocomplete="off">
                                                <div class="form-group">
                                                    <label>Product Category Name </label>
                                                    <input type="text" name="category_name" id="category_name" class="form-control" placeholder="Ex. Folder">
                                                </div>
                                                <c:if test="${error_msg != '' || success_msg != ''}">
                                                    <div class="form-group text-center">
                                                        <div id="error-msg">${error_msg}</div>
                                                        <c:remove var="error_msg" scope="session"/>
                                                        <div id="success-msg">${success_msg}</div>
                                                        <c:remove var="success_msg" scope="session"/>
                                                    </div>
                                                </c:if>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3"> 
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Add Product Category">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="allproductcategory" class="forgot-password">See all <strong>Product Category</strong></a>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="services" class="forgot-password">See all <strong>Products</strong></a>
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
        <script type="text/javascript">
            $(window).on('load',function(){
                prodCat();
            });
        </script>
        <script src="imports/jquery.validate.js" type="text/javascript"></script>
        <script src="imports/additional-methods.js" type="text/javascript"></script>
        <script src="js/add-product-service-validation.js" type="text/javascript"></script>        
    </body>
</html>
