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
        <style>
            .container .row{
               color:#fff;
            }
        </style>
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
            <div class="row text-center">
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
    </body>
</html>
