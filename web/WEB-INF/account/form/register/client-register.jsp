<%-- 
    Document   : client-register
    Created on : 03 18, 17, 1:27:15 PM
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
                        <h1>Request for an Account</h1>
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
                                            <form id="register-form" action="registercontroller" method="post" autocomplete="off" autocomplete="off" enctype="multipart/form-data">
                                                <h4>Account Information</h4>
                                                <div class="form-group">
                                                    <label>Username</label>
                                                    <input type="text" name="username" id="username" class="form-control" placeholder="Username" >
                                                    <div id="username_message"></div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Confirm Password</label>
                                                    <input type="password" name="confirm_password" id="confirm-password" class="form-control" placeholder="Confirm Password" >
                                                </div>
                                                <hr>
                                                <h4>Personal Information</h4>
                                                <div class="form-group">
                                                    <label>First Name</label>
                                                        <input type="text" name="first_name" id="first_name" class="form-control" placeholder="First Name" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <input type="text" name="last_name" id="last_name" class="form-control" placeholder="Last Name" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" id="email" class="form-control" placeholder="Email Address" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Mobile Number</label>
                                                    <input type="number" name="mobile_number" id="mobile_number" class="form-control" placeholder="Mobile Number (ex. 09xxxxxxxxx)" >
                                                </div>
                                                <hr>
                                                <h4>Company Currently Employed</h4>
                                                <div class="form-group">
                                                    <label>Company Name</label> 
                                                    <input type="text" name="company_name" id="company_name" class="form-control" placeholder="Company Name" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Company Branch</label> 
                                                    <input type="text" name="company_branch" id="company_branch" class="form-control" placeholder="Company Branch" >
<!--                                                    <p id="err-msg" style="color: #FF0000;"></p>-->
                                                </div>
<!--                                                <div class="form-group">
                                                    <input type="number" name="telephone_number" id="telephone_number" class="form-control" placeholder="Telephone Number" >
                                                </div>
                                                <div class="form-group">
                                                    <textarea rows="4" cols="50" placeholder="Mailing Address" class="form-control" name="address" id="address"></textarea>
                                                </div>-->
<!--                                                <div class="form-group">
                                                    <h4>Please select image</h4>
                                                    <input type="file" accept="image/*" name="account_image" id="account_image" class="form-control">
                                                    <span id="image_size_error" style="color: #FF0000"></span>
                                                </div>-->
                                                <c:if test="${error_msg != '' || success_msg != ''}">
                                                    <div class="form-group text-center">
                                                        <div id="error-msg">${error_msg}</div>
                                                        <c:remove var="error_msg" scope="session"/>
                                                        <div id="success-msg">${success_msg}</div>
                                                        <c:remove var="success_msg" scope="session"/>
                                                    </div>
                                                </c:if>
                                                <c:set var="form_type" value="client" scope="session"></c:set>
                                                <!--<input type="hidden" name="account_type" id="account_type" class="form-control" value="client">-->
                                                <div class="form-group">
                                                <div class="row">
                                                    <div class="col-sm-6 col-sm-offset-3">
                                                        <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Request Now">
                                                    </div>
                                                </div>
                                            </div>
                                            </form>    
                                            
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
        <script type="text/javascript">
            $(window).on('load',function(){
                regSuccess();
            });
        </script>
        <script src="imports/loader-js.js" type="text/javascript"></script>
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
