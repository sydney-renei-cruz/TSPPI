<%-- 
    Document   : edit-payment-method
    Created on : 02 23, 17, 8:33:21 AM
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
                        <h1>Edit Payment Method</h1>
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
                                            <h6 class="active">Leaving the field blank, or as is, will not change the record</h6>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form id="edit-form" action="editpaymentmethodcontroller" method="post" autocomplete="off">
                                                <c:forEach var="al" items="${al}">   
                                                    <c:set var="pm_id" value="${al.getPMID()}" scope="session"></c:set>
                                                <div class="form-group">
                                                    <label>Payment Method Name </label>
                                                    <input type="text" name="payment_method" id="payment_method" class="form-control" placeholder="Payment Method Name" value="${al.getPaymentMethod()}">
                                                </div>	
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3"> 
                                                            <input type="hidden" name="pm_id" value="${al.getPMID()}">
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Save Changes">
                                                        </div>
                                                    </div>
                                                </div>
                                                </c:forEach>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="allpaymentmethod" class="forgot-password">See all <strong>Payment Method</strong></a>
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
        <script src="js/edit-product-service-validation.js" type="text/javascript"></script>
    </body>
</html>
