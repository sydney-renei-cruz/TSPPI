<%-- 
    Document   : profile
    Created on : Aug 20, 2016, 8:33:10 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
        
        <c:choose>
            <c:when test="${account_type == 'client'}">
                <h1>Client PROFILE</h1>
            </c:when>
            <c:when test="${account_type == 'admin'}">
                <h1>Admin PROFILE</h1>
                <a href="emrp">Register an Employee</a>
                <a href="allaccounts">View all Accounts!</a>
            </c:when>
            <c:otherwise>
                <h1> Employee Profile</h1>
                <c:choose>
                    <c:when test="${job_position == 'Vice President'}">
                        <h1>Vice President</h1>
                        <a href="allaccounts">View all Client Accounts!</a>
                    </c:when>
                    <c:otherwise>
                        <h1>Inventory Officer</h1>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
        
        <form action="logoutservlet" method="post">
            <input type="submit" name="logout" value="Log out">
        </form>
    </body>
</html>
