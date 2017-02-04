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
    <!-- second section -->
    <!-- footer section -->
    <%--<%@include file="/WEB-INF/static-page/footer.jsp"%>--%>
    <!-- footer section -->
</body>
</html>
