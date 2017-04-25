<%-- 
    Document   : login
    Created on : Aug 16, 2016, 10:22:36 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/form.css" rel="stylesheet" type="text/css">
        <link href="css/form-error-validation.css" rel="stylesheet" type="text/css">
    </head>
    <body>
	<%@include file="/WEB-INF/source/navigation/navbar.jsp"%>
	<header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Login</h1>
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
                                            <form id="login-form" action="logincontroller" method="post" role="form" autocomplete="off">
                                                <div class="form-group">
                                                    <input type="text" name="username" id="username" class="form-control" placeholder="Username" value="">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" name="password" id="log-password" class="form-control" placeholder="Password">
                                                </div>
                                                <c:if test="${error_login != ''}">
                                                    <div class="form-group text-center">
                                                        <div id="error-msg">${error_login}</div>
                                                        <c:remove var="error_login" scope="session"/>
                                                    </div>
                                                </c:if>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3">
                                                            <input type="submit" name="login-submit" id="login-submit" class="form-control btn btn-login" value="Sign in">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="forgotpassword" class="forgot-password">Forgot Password?</a>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="register" class="forgot-password">Need an account? Request for one now!</a>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="requestcompany" class="forgot-password">Company's not yet registered? Request it now!</a>
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
