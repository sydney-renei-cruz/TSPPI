<%-- 
    Document   : editprofile
    Created on : Sep 6, 2016, 8:10:00 PM
    Author     : Jasteen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/login-register.css" rel="stylesheet" type="text/css">
        <title>Edit Profile</title>
    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
        
        <header id="login-header" style="background-image: url(img/login-register-header.png); background-size: cover;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>My Account</h1>
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
                                            <a class="active" id="login-form-link">Edit Profile</a>
                                            <h6 class="active">Please fill up the items you want to change</h6>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <c:forEach var="pb" items="${pb}">
                                        <div class="col-lg-12">
                                            <form id="register-form" action="editprofileservlet" method="get" autocomplete="off">
                                                <div class="form-group">
                                                    <input type="text" name="username" id="username" class="form-control" placeholder="Username" value="${pb.getUsername()}">
                                                </div>                       
                                                <div class="form-group">
                                                        <input type="text" name="firstname" id="first_name" class="form-control" placeholder="First Name" value="${pb.getFirstName()}">
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" name="lastname" id="last_name" class="form-control" placeholder="Last Name" value="${pb.getLastName()}">
                                                </div>
                                                <div class="form-group">
                                                    <input type="email" name="email" id="email" class="form-control" placeholder="Email Address" value="${pb.getEmail()}">
                                                </div>
                                                <div class="form-group">
                                                    <input type="number" name="mobile" id="mobile_number" class="form-control" value="${pb.getMobile()}" placeholder="Mobile Number (The length of the number should be 11)" pattern=".{11,11}" title="Required length of number is 11">
                                                </div>
                                               
                                                <div class="form-group">
                                                    <input type="number" name="telephone" id="telephone_number" class="form-control" value="${pb.getTelephone()}" placeholder="Telephone Number (The length of the number should be 7)" pattern=".{7,7}" title="Required length of number is 7">
                                                </div>
                                                <div class="form-group">
                                                    <textarea rows="4" cols="50" placeholder="Mailing Address" class="form-control" name="address" id="address">${pb.getAddress()}</textarea>
                                                </div>    						
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
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	</section>
        <%@include file="/WEB-INF/static-page/footer.jsp" %>
    </body>
</html>
