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
    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
        <table align="center" style="color: #fff;">
            <tr>
                <td align="center">
                    <b>Product Search</b></td>
            <tr>
                <td align="center"><b>Product Name</b></td>
                <td align="center"><b>Product Detail</b></td>
                <td align="center"><b>Stock For Sale</b></td>
            </tr>
            <c:forEach var="al" items="${al}">
            <tr>
                <td>${al.getProductName()}</td>
                <td>${al.getProductDetail()}</td>
                <td>${al.getForSale()}</td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
