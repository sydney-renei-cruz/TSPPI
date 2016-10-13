<%-- 
    Document   : products
    Created on : Oct 1, 2016, 2:56:32 PM
    Author     : cruzsyd
--%>

<%@page import="com.tsppi.bean.CartBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Products</title>

    <link href="css/bootstrap.css" rel="stylesheet">

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
        
        <div class="row">
        <c:forEach var="pb" items="${pb}">
            
            <div class="col-md-4 portfolio-item">
                <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                <h1 class="product-title">${pb.getProductName()}</h1>
                <div>
                    <table class="product-card">
                        <tr>
                            <th>
                                Item Number: 
                            </th>
                            <td>
                                ${pb.getProductID()}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Product Name: 
                            </th>
                            <td>
                                ${pb.getProductName()}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                MSRP: 
                            </th>
                            <td>
                                ${pb.getMSRP()}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Stock: 
                            </th>
                            <td>
                                ${pb.getStock()}
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Detail: 
                            </th>
                            <td>
                                ${pb.getProductDetail()}
                            </td>
                        </tr>
                        
                    </table>
                </div>
            </div>
                
        </c:forEach>
            
        </div>
            

        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>