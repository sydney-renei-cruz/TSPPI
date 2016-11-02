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
	<%@include file="../static-page/navbar.jsp" %>
	<header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Register</h1>
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
                                            <form id="register-form" action="registerservlet" method="post" autocomplete="off">
                                                <div class="form-group">
                                                    <input type="text" name="username" id="username" class="form-control" placeholder="Username" >
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" >
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" name="confirm_password" id="confirm-password" class="form-control" placeholder="Confirm Password" >
                                                </div>                                                
                                                <div class="form-group">
                                                        <input type="text" name="first_name" id="first_name" class="form-control" placeholder="First Name" >
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" name="last_name" id="last_name" class="form-control" placeholder="Last Name" >
                                                </div>
                                                <div class="form-group">
                                                    <input type="email" name="email" id="email" class="form-control" placeholder="Email Address" >
                                                </div>
                                                <div class="form-group">
                                                    <input type="number" name="mobile_number" id="mobile_number" class="form-control" placeholder="Mobile Number (ex. 09xxxxxxxxx)" >
                                                </div>
                                               
                                                <div class="form-group">
                                                    <input type="number" name="telephone_number" id="telephone_number" class="form-control" placeholder="Telephone Number" >
                                                </div>
                                                <div class="form-group">
                                                    <textarea rows="4" cols="50" placeholder="Mailing Address" class="form-control" name="address" id="address"></textarea>
                                                </div>
                                                						
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3">
                                                            <input type="hidden" name="type_of_account" id="form_identifier" value="3">
                                                            <input type="hidden" name="form_identifier" value="Client">
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
        <script src="js/reg-form-validation.js" type="text/javascript"></script>
    </body>
</html>
