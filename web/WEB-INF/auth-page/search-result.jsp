<%-- 
    Document   : product-view
    Created on : Sep 27, 2016, 11:08:58 PM
    Author     : Jasteen
    Reference  : http://www.javaknowledge.info/search-from-database-using-servlet-and-jsp/

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imports/bootstrap.css" rel="stylesheet">
        <link href="css/display.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
        
        <header id="header" style="background-image: url(img/search.jpg); background-size: cover;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Search Results</h1>
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
        <!-- Projects Row -->
            <c:forEach var="al" items="${al}">
            <div class="row">
                <div class="col-md-4 portfolio-item">
                    <img class="img-responsive" src="img/car-placeholder.png" alt="">
                </div>
                <h1 class="product-title">${al.getProductName()}</h1>
                <div>
                    <table class="product-card">
                        <tr>
                            <td>
                                ${al.getProductDetail()}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price: ${al.getMSRP()}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Product Category: ${al.getCategoryName()}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Stock: ${al.getStock()}
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <hr>
            </c:forEach>
            <!-- /.row -->
        </div>
    </body>
</html>
