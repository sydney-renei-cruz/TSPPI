<%-- 
    Document   : forgot-password2
    Created on : Nov 16, 2016, 9:46:50 PM
    Author     : Jasteen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <h1>Reset Your Password</h1>
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
                                            <form id="register-form" action="forgotpassword2controller" method="post" autocomplete="off">
                                                <div class="form-group">
                                                    <label>Password </label>
                                                    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                                                </div>
                                                <div class="form-group">
                                                    <label>Confirm Password </label>
                                                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm Password">
                                                </div>
                                                <c:if test="${error_msg != ''}">
                                                    <div class="form-group text-center">
                                                        <div id="error-msg">${error_msg}</div>
                                                        <c:remove var="error_msg" scope="session"/>
                                                    </div>
                                                </c:if>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3">
                                                            <input type="hidden" name="id" id="id" value="${requestScope.id}">
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Send">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="login" class="forgot-password">Login</a>
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
        <script src="js/forgot-validation.js" type="text/javascript"></script>
        <!--Alert Box Modal-->
        <div id="mssgBox" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <br>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                        Password Reset Successful!
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
