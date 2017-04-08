<%-- 
    Document   : edit-job-position
    Created on : 02 23, 17, 8:38:11 PM
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
                        <h1>Edit Job Position</h1>
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
                                            <form id="edit-form" action="editjobpositioncontroller" method="post" autocomplete="off">
                                                <c:forEach var="al" items="${al}">
                                                <c:set var="job_id" value="${al.getJobID()}" scope="session"/>   
                                                <div class="form-group">
                                                    <label>Job Name </label>
                                                    <input type="text" name="job_type" id="job_type" class="form-control" placeholder="Job Name" value="${al.getJobType()}">
                                                </div>	
                                                <div class="form-group text-center">
                                                    <div id="msg">${edit_error}</div>
                                                    <c:remove var="edit_error" scope="session"/>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3"> 
                                                            <input type="hidden" name="job_id" value="${al.getJobID()}">
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Save Changes">
                                                        </div>
                                                    </div>
                                                </div>
                                                </c:forEach>
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
        <script src="js/edit-job-position-validation.js" type="text/javascript"></script>
    </body>
</html>
