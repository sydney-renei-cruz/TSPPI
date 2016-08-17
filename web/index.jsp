<%-- 
    Document   : index
    Created on : Aug 14, 2016, 9:31:43 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <%@include file="navbar.jsp" %>
    <section id="myCarousel">
        <div id="home-carousel" class="carousel slide col-lg-8 col-lg-offset-2" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#home-carousel" data-slide-to="0" class="active"></li>
                <li data-target="#home-carousel" data-slide-to="1"></li>
                <li data-target="#home-carousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="list-box">
                <div class="item active"><a href="#"><img src="img/TSPPI Logo.png" alt="" class="center-block"></a></div>
                <div class="item"><a href="#">
                    <img src="img/car-placeholder.png" alt="" class="center-block"></a>
                    <div class="carousel-caption">
                        <h3>Second</h3>
                    </div>
                </div>
                <div class="item">
                    <a href="#"><img src="img/car-placeholder.png" alt="" class="center-block"></a>
                    <div class="carousel-caption">
                        <h3>Third</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container-fluid">
        <div class="row">
            <div id="contents" class="col-md-12 col-sm-12 text-center">
                <div class="col-md-12"><img src="img/front-image-1.png" class="front-image-1"></div>
                
                <div class="col-md-3 col-md-offset-2 front-div">
                    <a href="#">
                        <div class="col-md-12">
                            <img src="img/front-image-2.png" class="front-image-1">
                            <h2>PRODUCTS</h2><hr>
                        </div>
                        <div class="col-md-12">
                            <h3>*Description*</h3>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-3 col-md-offset-2 front-div">
                    <a href="#">
                        <div class="col-md-12">
                            <img src="img/front-image-3.png" class="front-image-1">
                            <h2>SERVICES</h2><hr>
                        </div>
                        <hr>
                        <div class="col-md-12">
                            <h3>*Description*</h3>
                        </div>
                    </a>
                </div>
            </div>5
        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 style="color: #fff;">Footer</h1>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
