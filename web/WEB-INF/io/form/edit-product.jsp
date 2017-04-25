<%-- 
    Document   : edit-product
    Created on : Oct 17, 2016, 6:40:29 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/form.css" rel="stylesheet" type="text/css">
        <link href="css/form-error-validation.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Edit Product</h1>
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
                                            <h4 class="active">Please fill up the items you want to change</h4>
                                            <h6 class="active">Leaving the fields blank, or as is, will not change the record</h6>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form id="edit-form" action="editproductcontroller" method="post" autocomplete="off" enctype="multipart/form-data" onSubmit="return fileSize();">
                                                <c:forEach var="pb" items="${pb}">
                                                <div class="form-group">
                                                    <label>Product Name </label>
                                                    <input type="text" name="product_name" id="product_name" class="form-control" placeholder="Product Name" value="${pb.getProductName()}">
                                                </div>                       
                                                <div class="form-group">
                                                    <label>Price </label>
                                                    <input type="number" name="msrp" id="msrp" class="form-control" placeholder="MSRP" value="${pb.getMSRP()}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Product Stock </label>
                                                    <input type="number" name="stock" id="stock" class="form-control" placeholder="Stock" value="${pb.getStock()}">
                                                </div>		
                                                <div class="form-group">
                                                    <label>Details of the Product </label>
                                                    <textarea rows="4" cols="50" name="product_detail" id="product_detail" class="form-control" placeholder="Details about the product">${pb.getProductDetail()}</textarea>
                                                </div>
                                                <div class="form-group">
                                                    <h4>Please select image</h4>
                                                    <input type="file" accept="image/*" name="product_image" id="product_service_image" class="form-control">
                                                    <span id="image_size_error" style="color: #FF0000"></span>
                                                </div>
                                                </c:forEach>
                                                <div class="form-group text-center">
                                                    <label>Product Category: </label>
                                                    <select name="product_category">
                                                        <c:forEach var="pcb" items="${pcb}">
                                                            <option value="${pcb.getCategoryID()}">${pcb.getCategoryName()}</option>
                                                        </c:forEach>
                                                    </select>
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
                                                            <c:forEach var="pb" items="${pb}">
                                                                <input type="hidden" name="product_id" value="${pb.getProductID()}">
                                                            </c:forEach>
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Save Changes">
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="approveproducts" class="forgot-password">Approve products.</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="products" class="forgot-password">See all products.</a>
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
        <script src="imports/jquery.validate.js" type="text/javascript"></script>
        <script src="imports/additional-methods.js" type="text/javascript"></script>
        <script src="js/edit-product-service-validation.js" type="text/javascript"></script>
    </body>
</html>
