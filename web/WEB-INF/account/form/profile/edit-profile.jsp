<%-- 
    Document   : editprofile
    Created on : Sep 6, 2016, 8:10:00 PM
    Author     : Jasteen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/form.css" rel="stylesheet" type="text/css">
        <link href="css/form-error-validation.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Edit Profile</h1>
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
                                            <h4 class="active">Please fill up the items you want to change</h4>
                                            <h6 class="active">Leaving the fields blank, or as is, will not change the record</h6>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <c:forEach var="pb" items="${pb}">
                                        <div class="col-lg-12">
                                            <form id="register-form" action="editprofilecontroller" method="post" autocomplete="off" enctype="multipart/form-data" onSubmit="return fileSize();">
                                                <div class="form-group">
                                                    <label>Username </label>
                                                    <input type="text" name="username" id="username" class="form-control" placeholder="Ex. MyUsername01" value="${pb.getUsername()}">
                                                </div>                       
                                                <div class="form-group">
                                                    <label>First Name </label>
                                                        <input type="text" name="firstname" id="first_name" class="form-control" placeholder="Ex. John" value="${pb.getFirstName()}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Last Name </label>
                                                    <input type="text" name="lastname" id="last_name" class="form-control" placeholder="Ex. Doe" value="${pb.getLastName()}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Email Address </label>
                                                    <input type="email" name="email" id="email" class="form-control" placeholder="Ex. john.doe@gmail.com" value="${pb.getEmail()}">
                                                </div>
                                                
                                                <c:if test="${account_type == 'client'}">
                                                    <div class="form-group">
                                                        <label>Mobile Number </label>
                                                        <input type="number" name="mobile" id="mobile_number" class="form-control" value="${pb.getMobile()}" placeholder="Ex. 09*********" pattern=".{11,11}" title="Required length of number is 11">
                                                    </div>
                                                </c:if>
                                                <div class="form-group">
                                                    <h4>Please select image</h4>
                                                    <input type="file" accept="image/*" name="account_image" id="account_image" class="form-control">
                                                    <span id="image_size_error" style="color: #FF0000"></span>
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
                                                            <input type="submit" name="submit" id="register-submit" class="form-control btn btn-register" value="Save Changes">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="text-center">
                                                                <a href="profile" class="forgot-password">Go back to your profile.</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>                 
                                        </div>
                                        </c:forEach>z
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
        <script src="js/edit-prof-validation.js" type="text/javascript"></script>
    </body>
</html>
