<%-- 
    Document   : index
    Created on : Aug 14, 2016, 9:31:43 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/home.css" type="text/css"/>
</head>
<body>
    <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
    
    <!-- first section -->
    <div id="home" class="home">
        <div class="text-vcenter">
            <h1><span class="border">Tri-Star Paper Products, Inc.</span></h1>
        </div>
    </div>
    <!-- first section -->
    <!-- second section -->
    <div id="comp-offer" class="pad-section">
        <div class="container">
            <h2 class="text-center"> What we offer </h2><hr>
            <div class="row">
                <div class="col-sm-6 col-xs-6 text-center">
                    <a href="products">
                        <i class="glyphicon glyphicon-briefcase"></i>
                        <h4>Products</h4>
                        <p>We offer the best of the best paper products at an
                        affordable price.</p>
                    </a>
                </div>
                <div class="col-sm-6 col-xs-6 text-center">
                    <a href="services">
                        <i class="glyphicon glyphicon-cog"></i>
                        <h4>Services</h4>
                        <p>Our paper services will not fail you. We use high technologies
                        to produce high quality paper products.</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- second section -->
    <!-- third section -->
    <c:choose>
        <c:when test="${user != null && account_type == 'client'}">
            <div id="information-2" class="home">
                <div class="text-vcenter">
                    <h1><span class="border">Show Now!</span></h1>
                    <h3>
                        <span class="border"><a href="products">Go to Products!</a></span>
                    </h3>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div id="information" class="home">
                <div class="text-vcenter">
                    <h1><span class="border">Want to shop?</span></h1>
                    <h3>
                        <span class="border"><a href="register">Register now!</a></span>
                    </h3>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <!-- third section -->
    <!-- footer section -->
    <%--<%@include file="/WEB-INF/static-page/footer.jsp"%>--%>
    <!-- footer section -->
</body>
</html>
