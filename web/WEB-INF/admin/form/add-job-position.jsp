<%-- 
    Document   : add-job-position
    Created on : 02 23, 17, 5:26:06 PM
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
                        <h1>Add Job Position</h1>
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
                                            <form id="add-job-form" action="addjobpositioncontroller" method="post" autocomplete="off">
                                                <div class="form-group">
                                                    <label>Job Name </label>
                                                    <input type="text" name="job_type" id="job_type" class="form-control" placeholder="Ex. Vice President">
                                                </div>
                                                <div class="form-group">
                                                    <label>Management Privilege?</label> <span style="font-size: 12px; color: #888;">Allows user to modify any invoice requests.</span><br>
                                                    <input type="radio" name="management_score" class="management_score" class="form-control" value="1"> Yes
                                                    <input type="radio" name="management_score" class="management_score" class="form-control" value="0"> No
                                                    <br><label for="management_score" class="my-error-class"></label>
                                                </div>
                                                <div class="form-group">
                                                    <label>Inventory Officer Privilege? </label> <span style="font-size: 12px; color: #888;">Allows user to modify any products and services.</span><br>
                                                    <input type="radio" name="inventory_score" class="inventory_score" class="form-control" value="1"> Yes
                                                    <input type="radio" name="inventory_score" class="inventory_score" class="form-control" value="0"> No
                                                    <br><label for="inventory_score" class="my-error-class"></label>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3"> 
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Add Product Category">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="alljobposition" class="forgot-password">See all <strong>Job Position</strong></a>
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
        <script src="js/add-job-position-validation.js" type="text/javascript"></script>
        
    </body>
</html>
