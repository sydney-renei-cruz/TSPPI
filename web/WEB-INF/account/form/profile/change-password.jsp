<%-- 
    Document   : change-password
    Created on : 04 4, 17, 8:00:23 PM
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
                        <h1>Change Password</h1>
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
                                            <form id="register-form" action="changepasswordcontroller" method="post" autocomplete="off" enctype="multipart/form-data" onSubmit="return fileSize();">
                                                <div class="form-group">
                                                    <label>Current Password </label>
                                                    <input type="password" name="current_password" id="current_password" class="form-control" placeholder="Current Password">
                                                </div>
                                                <div class="form-group">
                                                    <label>New Password </label>
                                                    <input type="password" name="new_password" id="new_password" class="form-control" placeholder="New Password">
                                                </div>
                                                <div class="form-group">
                                                    <label>Confirm New Password </label>
                                                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm New Password">
                                                </div>
                                                <div class="form-group text-center">
                                                    <div id="msg">${change_error}</div>
                                                    <c:remove var="change_error" scope="session"/>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3"> 
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Save Changes">
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>                 
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="text-center">
                                                <a href="profile" class="forgot-password">Go back to your profile.</a>
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
        <script src="js/change-password-validation.js" type="text/javascript"></script>
    </body>
</html>
