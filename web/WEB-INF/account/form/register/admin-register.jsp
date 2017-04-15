<%-- 
    Document   : login
    Created on : Aug 16, 2016, 10:22:36 PM
    Author     : cruzsyd
--%>

<%@page import="java.io.PrintWriter"%>
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
                        <h1>Admin Register</h1>
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
                                            <form id="register-form" action="registercontroller" method="post" autocomplete="off" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <label>Username </label>
                                                    <input type="text" name="username" id="username" class="form-control" placeholder="Ex. MyUsername01" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Password </label>
                                                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Confirm Password </label>
                                                    <input type="password" name="confirm_password" id="confirm-password" class="form-control" placeholder="Confirm Password" >
                                                </div>                                                
                                                <div class="form-group">
                                                    <label>First Name </label>
                                                    <input type="text" name="first_name" id="first_name" class="form-control" placeholder="Ex. John" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Last Name </label>
                                                    <input type="text" name="last_name" id="last_name" class="form-control" placeholder="Ex. Doe" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Email </label>
                                                    <input type="email" name="email" id="email" class="form-control" placeholder="Ex. john.doe@gmail.com" >
                                                </div>
                                                <div class="form-group text-center">
                                                    <div id="msg">${register_error}</div>
                                                    <c:remove var="register_error" scope="session"/>
                                                </div>
                                                <input type="hidden" name="account_type" id="account_type" class="form-control" value="admin">
                                            </form>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3">
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Register Now">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="login" class="forgot-password">Already have an account?</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>    
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
        <script src="js/reg-form-validation.js" type="text/javascript"></script>
        
        <!--Alert Box Modal-->
        <div id="mssgBox" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <br>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                        Registration successful!
                    </div>
                    <div class="modal-footer">
                        <br>
                    </div>
                </div>
            </div>
        </div>
        <!--Alert Box Modal-->
        
    </body>
</html>
