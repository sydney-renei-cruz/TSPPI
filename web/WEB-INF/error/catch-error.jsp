<%-- 
    Document   : catch-error
    Created on : 11 25, 16, 11:39:14 AM
    Author     : Sydney Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>T.S.P.P.I.</title>
    </head>
    <body>
        <h1>OOPS!</h1>
        <h3>Something went wrong</h3>
        <h3>Report this to the system administrator, ${requestScope.exception_error}</h3>
    </body>
</html>
