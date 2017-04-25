<%-- 
    Document   : company-request
    Created on : 03 27, 17, 12:27:10 PM
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
                        <h1>Request Client Company</h1>
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
                                    <h6>Please be advised that the company profile, that you are going to request, is yet to be verified by the management with the requesting company</h6>
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form id="request-company-form" action="requestcompanycontroller" method="post" autocomplete="off">
                                                <h4>Requested by</h4>
                                                <div class="form-group">
                                                    <label>First Name</label>
                                                    <input type="text" name="first_name" id="first_name" class="form-control" placeholder="First Name">
                                                </div>
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <input type="text" name="last_name" id="last_name" class="form-control" placeholder="Last Name">
                                                </div>
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" id="email" class="form-control" placeholder="Email">
                                                </div>
                                                <h4>Company</h4>
                                                <div class="form-group">
                                                    <label>Company Name</label>
                                                    <input type="text" name="company_name" id="company_name" class="form-control" placeholder="Ex. Meralco">
                                                </div>
                                                <div class="form-group">
                                                    <label>Company Branch</label>
                                                    <input type="text" name="company_branch" id="company_branch" class="form-control" placeholder="Ex. Ortigas">
                                                </div>
                                                <div class="form-group">
                                                    <label>Company Telephone Number</label>
                                                    <input type="text" name="company_telephone" id="company_telephone" class="form-control" placeholder="Telephone Number">
                                                </div>
                                                <h4>Company Address</h4>
                                                <div class="form-group">
                                                    <label>Street line 1</label>
                                                    <input type="text" name="street_line1" id="street_line1" class="form-control" placeholder="Street Address, P.O. Box, c/o">
                                                </div>
                                                <div class="form-group">
                                                    <label>Street line 2</label>
                                                    <input type="text" name="street_line2" id="street_line2" class="form-control" placeholder="Apartment, suite, unit, building, floor, etc.">
                                                </div>
                                                <div class="form-group">
                                                    <label>State/Province/Region</label>
                                                    <input type="text" name="spr" id="spr" class="form-control" placeholder="State/Province/Region">
                                                </div>
                                                <div class="form-group">
                                                    <label>City</label>
                                                    <input type="text" name="city" id="city" class="form-control" placeholder="City">
                                                </div>
                                                <div class="form-group">
                                                    <label>ZIP/Postal Code</label>
                                                    <input type="text" name="postal_code" id="postal_code" class="form-control" placeholder="ZIP/Postal Code">
                                                </div>
                                                <div class="form-group">
                                                    <label>Country</label>
                                                    <input type="text" name="country" id="country" class="form-control" placeholder="Country">
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
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Add Client Company">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="login" class="forgot-password">Already have an account?</a>
                                                            </div>
                                                            <div class="text-center">
                                                                <a href="register" class="forgot-password">Need an account? Request for one now!</a>
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
        <script src="js/request-company-validation.js" type="text/javascript"></script>
        
    </body>
</html>
