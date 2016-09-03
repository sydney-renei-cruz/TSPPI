<%-- 
    Document   : sidenav
    Created on : Aug 14, 2016, 9:36:59 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div id="side-nav" class="col-md-3 col-sm-4 black">
            <div id="search-box">
                <form class="navbar-form" role="search">
                        <div class="input-group">
                                <input class="form-control" placeholder="Search" name="srch-term" id="srch-term" type="text">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                </div>
                        </div>
                </form>
            </div>
            <div class="title light"><a href="#">Products</a></div>
            <ul class="nav navbar-sidebar">
                    <li class="gray black"><a href="#">Link 1</a></li>
                    <li class="gray black"><a href="#">Link 2</a></li>
                    <li class="gray black"><a href="#">Link 3</a></li>
                    <li class="gray black"><a href="#">Link 4</a></li>
            </ul>
            <div class="title light" style="margin-top: 20px;"><a href="#">Services</a></div>
            <ul class="nav navbar-sidebar">
                    <li class="gray black"><a href="#">Link 1</a></li>
                    <li class="gray black"><a href="#">Link 2</a></li>
                    <li class="gray black"><a href="#">Link 3</a></li>
                    <li class="gray black"><a href="#">Link 4</a></li>
            </ul>
        </div>
        <!-- Jquery plugin -->
        <script src="imports/jquery-2.2.2.js"></script>
        <!-- Bootstrap plugin -->
        <script src="imports/bootstrap.js"></script>
    </body> 
</html>
