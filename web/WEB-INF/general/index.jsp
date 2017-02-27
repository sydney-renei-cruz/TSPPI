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
                    <h1>
                        <span class="border">Show Now!</span><br>
                        <small>
                            <a href="products">GO TO <strong>PRODUCTS</strong></a>
                        </small>
                    </h1>
                </div>
            </div>
            <div id="information-3" class="home">
                <div class="text-vcenter">
                    <h1>
                        <span class="border">Curious about our services?</span><br>
                        <small>
                            <a href="services"><strong>Inquire</strong> about that service!</a>
                        </small>
                    </h1>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <c:if test="${account_type != 'employee' && account_type != 'admin'}">
                <div id="information" class="home">
                    <div class="text-vcenter">
                        <h1>
                            <span class="border">Want to shop?</span><br>
                            <small>
                                <a href="register">Register now!</a>
                            </small>
                        </h1>
                    </div>
                </div>
            </c:if>
        </c:otherwise>
    </c:choose>
    <!-- second section -->
    <!-- footer section -->
    <%--<%@include file="/WEB-INF/source/navigation/footer.jsp"%>--%>
    <!-- footer section -->
</body>
</html>
