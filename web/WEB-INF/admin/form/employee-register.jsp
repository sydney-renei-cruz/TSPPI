<%-- 
    Document   : login
    Created on : Aug 16, 2016, 10:22:36 PM
    Author     : cruzsyd
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <c:choose>
                            <c:when test="${jt.size() > 0}">
                                <h1>Employee Register</h1>
                            </c:when>
                            <c:otherwise>
                                <h1>Job Position does not exist or is not activated</h1>
                                <h3><a href="alljobposition" style="color: #fff !important;">Please add/edit the Job Position first.</a></h3>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
	</header>
        <c:if test="${jt.size() > 0}">
            <section>
                <div id="login-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <%@include file="/WEB-INF/source/mssgBox.jsp" %>
                                <div class="panel panel-login">
                                    <div class="panel-heading">
                                        <hr>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <form id="register-form" action="registercontroller" method="post" autocomplete="off" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <label>Username </label>
                                                        <input type="text" name="username" id="username" class="form-control" placeholder="Ex. MyUsername01" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Password </label>
                                                        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Confirm Password </label>
                                                        <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirm Password" required>
                                                    </div> 
                                                    <div class="form-group">
                                                        <label>First Name </label>
                                                        <input type="text" name="first_name" id="first_name" class="form-control" placeholder="Ex. John" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Last Name </label>
                                                        <input type="text" name="last_name" id="last_name" class="form-control" placeholder="Ex. Doe" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Email </label>
                                                        <input type="email" name="email" id="email" class="form-control" placeholder="Ex. john.doe@gmail.com" required>
                                                    </div>
                                                    <div class="form-group text-center">
                                                        <label>Job Position: </label>
                                                        <select name="job_id">
                                                            <c:forEach var="jt" items="${jt}">
                                                                <option value="${jt.getJobID()}">${jt.getJobType()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>  
                                                    <c:if test="${error_msg != '' || success_msg != ''}">
                                                        <div class="form-group text-center">
                                                            <div id="error-msg">${error_msg}</div>
                                                            <c:remove var="error_msg" scope="session"/>
                                                            <div id="success-msg">${success_msg}</div>
                                                            <c:remove var="success_msg" scope="session"/>
                                                        </div>
                                                    </c:if>
                                                    <c:set var="form_type" value="employee" scope="session"></c:set>
                                                    <!--<input type="hidden" name="account_type" id="account_type" class="form-control" value="employee">-->
                                                    <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3">
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Register Now">
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
        </c:if>
        <script type="text/javascript">
            $(window).on('load',function(){
                regSuccess();
            });
        </script>
        <script src="imports/loader-js.js" type="text/javascript"></script>
        <script src="imports/jquery.validate.js" type="text/javascript"></script>
        <script src="imports/additional-methods.js" type="text/javascript"></script>
        <script src="js/reg-form-validation.js" type="text/javascript"></script>
        
    </body>
</html>
