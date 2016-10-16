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

    <link href="css/3-col-portfolio.css" rel="stylesheet">

</head>

<body>

    <!-- Navigation -->
    <%@include file="../static-page/navbar.jsp"%>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Page Heading
                    <small>Secondary Text</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        
        <c:forEach var="sb" items="${sb}">
        <div class="row">
            
            <div class="col-md-4 portfolio-item">
                <img class="img-responsive" src="img/car-placeholder.png" alt="">
            </div>
                            <h1 class="product-title">${sb.getServiceName()}</h1>
                <div>
                    <table class="product-card">
                        <tr>
                            <td>
                                ${sb.getServiceDesc()}
                            </td>
                        </tr>
                    </table>
                </div>
        </div>
        <hr>
        </c:forEach>            

        <!-- /.row -->

        
    </div>
    <!-- /.container -->

    <script src="imports/jquery.matchHeight-min.js"></script>
    <script>
        $(function(){
            $('.portfolio-item').matchHeight();
        });
    </script>
</body>

</html>
