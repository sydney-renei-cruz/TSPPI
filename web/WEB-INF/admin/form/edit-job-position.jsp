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
                                            <c:forEach var="al" items="${al}">
                                            <form id="edit-form" action="editjobpositioncontroller" method="post" autocomplete="off">
                                                
                                                <c:set var="job_id" value="${al.getJobID()}" scope="session"/>   
                                                <div class="form-group">
                                                    <label>Job Name </label>
                                                    <input type="text" name="job_type" id="job_type" class="form-control" placeholder="Ex. Vice President" value="${al.getJobType()}">
                                                </div>	
                                                <c:if test="${error_msg != '' || success_msg != ''}">
                                                    <div class="form-group text-center">
                                                        <div id="error-msg">${error_msg}</div>
                                                        <c:remove var="error_msg" scope="session"/>
                                                        <div id="success-msg">${success_msg}</div>
                                                        <c:remove var="success_msg" scope="session"/>
                                                    </div>
                                                </c:if>
                                                <input type="hidden" name="job_id" value="${al.getJobID()}">
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3">
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Save Changes">
                                                        </div>
                                                    </div>
                                                </div>
                                                </form>
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
        <script type="text/javascript">
            $(window).on('load',function(){
                editSuccess();
            });
        </script>
    </body>
</html>
