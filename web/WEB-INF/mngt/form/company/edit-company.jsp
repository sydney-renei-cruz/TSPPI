<%-- 
    Document   : edit-company
    Created on : 03 17, 17, 6:09:50 PM
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
                        <h1>Edit Client Company</h1>
                    </div>
                </div>
            </div>
	</header>
        <section>
            <div id="login-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <%@include file="/WEB-INF/source/mssgBox.jsp" %>
                            <div class="panel panel-login">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <h6 class="active">Leaving the field blank, or as is, will not change the record</h6>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form id="edit-company-form" action="editcompanycontroller" method="post" autocomplete="off">
                                                <c:forEach var="al" items="${al}">
                                                    <c:set var="company_id" value="${al.getCompanyID()}" scope="session"/>   
                                                    <div class="form-group">
                                                        <label>Company Name</label>
                                                        <input type="text" name="company_name" id="company_name" class="form-control" placeholder="Ex. Meralco - Ortigas" value="${al.getCompanyName()}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Company Branch</label>
                                                        <input type="text" name="company_branch" id="company_branch" class="form-control" placeholder="Ex. Ortigas" value="${al.getCompanyBranch()}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Telephone Number</label>
                                                        <input type="text" name="company_telephone" id="company_telephone" class="form-control" placeholder="Ex. 02*********" value="${al.getCompanyTelephone()}">
                                                    </div>
                                                    <h4>Company Address</h4>
                                                <div class="form-group">
                                                    <label>Street line 1</label>
                                                    <input type="text" name="street_line1" id="street_line1" class="form-control" placeholder="Street Address, P.O. Box, c/o" value="${al.getStreetLine1()}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Street line 2</label>
                                                    <input type="text" name="street_line2" id="street_line2" class="form-control" placeholder="Apartment, suite, unit, building, floor, etc." value="${al.getStreetLine2()}">
                                                </div>
                                                <div class="form-group">
                                                    <label>State/Province/Region</label>
                                                    <input type="text" name="spr" id="spr" class="form-control" placeholder="State/Province/Region" value="${al.getSPR()}">
                                                </div>
                                                <div class="form-group">
                                                    <label>City</label>
                                                    <input type="text" name="city" id="city" class="form-control" placeholder="City" value="${al.getCity()}">
                                                </div>
                                                <div class="form-group">
                                                    <label>ZIP/Postal Code</label>
                                                    <input type="text" name="postal_code" id="postal_code" class="form-control" placeholder="ZIP/Postal Code" value="${al.getPostalCode()}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Country</label>
                                                    <input type="text" name="country" id="country" class="form-control" placeholder="Country" value="${al.getCountry()}">
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
                                                                <input type="hidden" name="company_id" value="${al.getCompanyID()}">
                                                                <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Edit Client Company">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <div class="text-center">
                                                                    <a href="allcompany" class="forgot-password">See all <strong>Client Companies</strong></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
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
        <script src="js/edit-company-validation.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(window).on('load',function(){
                editSuccess();
            });
        </script>
    </body>
</html>
