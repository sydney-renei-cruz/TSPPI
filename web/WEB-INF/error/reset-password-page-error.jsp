<%-- 
    Document   : reset-password-page-error
    Created on : 05 14, 17, 6:37:16 PM
    Author     : Sydney Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imports/bootstrap.css" rel="stylesheet">
        <link href="css/display.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp"%>
        
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>You have already used the link.</h1>
                    </div>
                </div>
            </div>
        </header>
        <section>
            <div class="container">
                <div id="srch-error" class="row text-center">
                    <h5 class="">
                        <a href="home" style="color: #fff;">Home.</a>
                    </h5>
                </div>
            </div>
        </section>
    </body>
</html>
