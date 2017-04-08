<%-- 
    Document   : search-error
    Created on : Oct 16, 2016, 8:22:59 PM
    Author     : cruzsyd
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="imports/bootstrap.css" rel="stylesheet">
        <link href="css/display.css" rel="stylesheet">
    </head>
    <body>
         <%@include file="../general/navbar.jsp" %>
        
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Search Results</h1>
                    </div>
                </div>
            </div>
        </header>
        <section>
            <div class="container">
                <div id="srch-error" class="row text-center">
                    <h1>
                        Oops!
                    </h1>
                    <h2 class="">
                        No results found
                    </h2>
                    <h5 class="">
                        Try searching again.
                    </h5>
                </div>
            </div>
        </section>
    </body>
</html>
