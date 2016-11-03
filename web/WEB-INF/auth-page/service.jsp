<%-- 
    Document   : services
    Created on : 10 15, 16, 1:16:37 AM
    Author     : SAM
--%>

<%@page import="com.tsppi.bean.ServiceBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="imports/bootstrap.css" rel="stylesheet">
    <link href="css/display.css" rel="stylesheet">

</head>

<body>

    <!-- Navigation -->
    <%@include file="../static-page/navbar.jsp"%>
    
    <header id="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1>SERVICES</h1>
                </div>
            </div>
        </div>
    </header>
    <section>
        <div class="container">
            <div class="well well-sm">
                <strong>View As: </strong>
                <div class="btn-group">
                    <a href="#" id="list" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-th-list"></span>
                    </a>
                    <a href="#" id="grid" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-th"></span>
                    </a>
                </div>
            </div>
            <div id="products" class="row list-group">
                <c:forEach var="sb" items="${sb}">
                <div class="item col-xs-4 col-lg-4 content">
                    <img class="img-responsive" src="img/car-placeholder.png" alt="">
                    <div class="thumbnail">
                        <div class="caption">
                            <h4 class="group inner list-group-item-heading">${sb.getServiceName()}</h4>
                            <div class="info">
                                <p class="group inner list-group-item-text">${sb.getServiceDesc()}</p>
                            </div>
                            <c:if test="${account_type == 'client'}">
                                <a class="btn btn-danger">Inquire this service</a>
                            </c:if>
                            <c:if test="${job_position == 'Inventory Officer'}">
                            <form action="editservice" method="GET">
                                <input type="hidden" name="service_id" id="service_id" value="${sb.getServiceID()}">
                                <input type="submit" name="submit" id="submit" value="Edit Service" class="btn btn-warning">
                            </form>
                            </c:if>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    <!-- pagination -->
    <nav class="text-center">
            <div class="col-lg-12">
                    <ul class="pagination">
                            <li class="pag_prev">
                                    <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                    </a>
                            </li>
                            <li class="pag_next">
                                    <a href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                    </a>
                            </li>
                    </ul>
            </div>
    </nav>
    <script src="js/pagination.js"></script>
    <script src="js/grid-list-display.js"></script>
    <script src="js/grid-height.js"></script>
</body>

</html>
