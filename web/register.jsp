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
        <link href="css/login-register.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
	<%@include file="navbar.jsp" %>
	<header id="login-header" style="background-image: url(img/desk.png); background-size: cover;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>My Account</h1>
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
                                            <a class="active" id="login-form-link">Register</a>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form id="register-form" action="RegisterServlet" method="post">
                                                <div class="form-group">
                                                    <input type="text" name="username" id="username" class="form-control" placeholder="Username" value="">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" name="confirm_password" id="confirm-password" class="form-control" placeholder="Confirm Password" required>
                                                </div>
                                                <script>
                                                    $(document).ready(function() {
                                                        $("#confirm-password").keyup(validate);
                                                    });
                                                    function validate() {
                                                        var password1 = $("#password").val();
                                                        var password2 = $("#confirm-password").val();

                                                        if(password1 === password2) {
                                                            $("#reg-password").css("border", "solid 1px #1CB94A");   
                                                            $("#confirm-password").css("border", "solid 1px #1CB94A");   
                                                        }
                                                        else {
                                                            $("#reg-password").css("border", "solid 1px #e60000");   
                                                                    $("#confirm-password").css("border", "solid 1px #e60000");   
                                                        }

                                                      }

                                                </script>
                                                <div class="form-group">
                                                        <input type="text" name="first_name" id="first_name" class="form-control" placeholder="First Name">
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" name="last_name" id="last_name" class="form-control" placeholder="Last Name">
                                                </div>
                                                <div class="form-group">
                                                    <input type="email" name="email" id="email" class="form-control" placeholder="Email Address">
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" name="mobile_number" id="mobile_number" class="form-control" placeholder="Mobile Number">
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" name="telephone_number" id="telephone_number" class="form-control" placeholder="Telephone Number">
                                                </div>
                                                <div class="form-group">
                                                    <textarea rows="4" cols="50" placeholder="Mailing Address" class="form-control" name="address" id="company_address"></textarea>
                                                </div>
                                                						
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
                                                                <a href="login.jsp" class="forgot-password">Already have an account?</a>
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
	<script>
    </body>
</html>
