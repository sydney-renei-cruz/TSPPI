<%-- 
    Document   : add-service
    Created on : 10 15, 16, 1:50:56 AM
    Author     : SAM
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
                        <h1>Add Service</h1>
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
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form id="service-product-form" action="addservicecontroller" method="post" autocomplete="off" enctype="multipart/form-data" onSubmit="return fileSize();">
                                                <div class="form-group">
                                                    <label>Service Name </label>
                                                    <input type="text" name="service_name" id="service_name" class="form-control" placeholder="Service Name">
                                                </div>	
                                                <div class="form-group">
                                                    <label>Description of the Service </label>
                                                    <textarea rows="4" cols="50" name="service_description" id="product_detail" class="form-control" placeholder="Details about the service"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <h4>Please select image</h4>
                                                    <input type="file" accept="image/*" name="service_image" id="product_service_image" class="form-control">
                                                    <span id="image_size_error" style="color: #FF0000"></span>
                                                </div>
                                                <div class="form-group text-center">
                                                    <div id="msg">${add_error}</div>
                                                    <c:remove var="add_error" scope="session"/>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3"> 
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Add Service">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="services" class="forgot-password">See all services.</a>
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
        <script src="js/add-product-service-validation.js" type="text/javascript"></script>
        
    </body>
</html>