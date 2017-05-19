
<%-- 
    Document   : navbar
    Created on : Aug 14, 2016, 8:56:19 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="img/TSPPI Logo.png">
	<title>Tri-Star Paper Products, Inc.</title>
        <!--home css-->
        
        <!-- navbar css -->
	<link href="css/navbar.css" rel="stylesheet" type="text/css">
        <!-- Bootstrap css -->
	<link href="imports/bootstrap.min.css" rel="stylesheet">
        <!-- Jquery plugin -->
	<script src="imports/jquery-2.2.4.js"></script>
	<!-- Bootstrap plugin -->
	<script src="imports/bootstrap.js"></script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-fixed-top navbar-inverse nav-top">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="home"><img alt="" src="img/tsppi.png" id="nav-img"></a>
                        <div class="nav navbar-left">
                            <a href="home" class="btn btn-link navbar-btn">HOME</a>
                            <c:if test="${user == null || account_type == 'client'}">
                                <a href="about" class="btn btn-link navbar-btn">ABOUT US</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </nav>
            <nav class="navbar navbar-fixed-top nav-bot">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="home"><img alt="" src="img/whitespace.png"></a>
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".bot-nav">
                            <span class="sr-only">Toggle Navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse bot-nav">
                        <ul class="nav navbar-nav navbar-right">
                            <c:if test="${user == null || account_type == 'client' || inventory_score == true}">
                                <li style="overflow: hidden;">
                                    <form action="search" method="GET" class="search-bar navbar-form" style="border: 1px solid transparent;" autocomplete="off">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search a Product!" name="srch" id="srch" style="width: 150px;">
                                            <div class="input-group-btn">
                                                <button class="btn btn-default" type="submit">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </li>
                            </c:if>
                            <c:choose>
                                <c:when test="${user != null}">
                                    <c:if test="${account_type == 'client'}">
                                        <jsp:useBean id="cart" scope="session" class="com.tsppi.controller.bean.CartBean" />

                                        <c:choose>
                                            <c:when test="${cart.getCartSize() == 0}">
                                                <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart - ₱0</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="dropdown">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                                        <span class="glyphicon glyphicon-shopping-cart"></span> Cart - ₱${cart.getOrderTotal()}
                                                    </a>
                                                    <ul class="dropdown-menu dropdown-cart" role="menu">
                                                        <c:forEach var="cart_item" items="${cart.getCartItems()}" varStatus="counter">
                                                        <li>
                                                            <form id="nav-cart" name="item" action="cartcontroller" method="POST">
                                                                <span class="item">
                                                                  <span class="item-left">
                                                                      <span class="item-info">
                                                                          <span>${cart_item.getItemName()}</span>
                                                                          <span>x${cart_item.getQuantity()} - ₱${cart_item.getTotalCost()}</span>
                                                                          <input type="hidden" id="cart-quantity" name="cart-quantity" value="${cart_item.getQuantity()}">
                                                                      </span>
                                                                  </span>
                                                                        <span class="item-right">
                                                                            <input type='hidden' name='item_number' value='<c:out value="${counter.count}"/>'>
                                                                            <input type="submit" name="action" class="btn btn-xs btn-danger pull-right" value="x">
                                                                        </span>

                                                              </span>
                                                            </form>
                                                        </li>
                                                        </c:forEach>
                                                        <li><a class="text-center" href="cart">View and Edit Cart</a></li>
                                                    </ul>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href=""> ${user} <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="profile" class="text-center">View Profile</a></li>
                                            <li class="dropdown-submenu">
                                                <a class="test" tabindex="-1" href="#">Account Setting <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="editprofile" class="text-center">Edit Profile</a></li>
                                                    <li><a href="changepassword" class="text-center">Change Password</a></li>
                                                </ul>
                                            </li>                                            
                                            <li><a href="logoutcontroller" class="text-center">Logout</a></li>
                                        </ul>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="login">Log in</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>  
                        <ul class="nav navbar-nav  navbar-left">
                            
                                <c:if test="${user == null || account_type == 'client'}">
                                    <li><a href="products">PRODUCTS</a></li>
                                    <li><a href="services">SERVICES</a></li>
                                    <c:if test="${account_type == 'client'}">
                                        <li><a href="allinvoices">MY INVOICES</a></li>
                                    </c:if>
                                </c:if>
                                <c:if test="${account_type == 'admin'}">
                                    <li class="dropdown-submenu text-center">
                                        <a class="test" tabindex="-1" href="#">ACCOUNT <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="emrp" class="text-center">Register Employee</a></li>
                                            <li><a href="allaccounts" class="text-center">View All Accounts </a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown-submenu text-center">
                                        <a class="test" tabindex="-1" href="#">JOB POSITION <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="addjobposition" class="text-center">Add Job Position</a></li>
                                            <li><a href="alljobposition" class="text-center">View Job Positions</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${management_score == true || sales_score == true}">
                                    <li class="dropdown-submenu text-center">
                                        <a class="test" tabindex="-1" href="#">CLIENT<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <c:if test="${management_score == true}">
                                                <li><a href="addcompany" class="text-center">Add Client Company</a></li>
                                                <li><a href="allcompany" class="text-center">View Client Companies</a></li>
                                            </c:if>
                                            <li><a href="allaccounts" class="text-center">View Client Accounts</a></li>
                                        </ul>
                                    </li>
                                    <c:if test="${management_score == true}">
                                    <li class="dropdown-submenu text-center">
                                        <a class="test" tabindex="-1" href="#">PAYMENT METHOD<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="addpaymentmethod" class="text-center">Add Payment Method</a></li>
                                            <li><a href="allpaymentmethod" class="text-center">View Payment Methods</a></li>
                                        </ul>
                                    </li>
                                    </c:if>
                                </c:if>
                                <c:if test="${inventory_score == true}">
                                    <li class="dropdown-submenu text-center">
                                        <a class="test" tabindex="-1" href="#">PRODUCT<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="addproduct" class="text-center">Add Product</a></li>
                                            <li><a href="approveproducts" class="text-center">Approve Products</a></li>
                                            <li><a href="products" class="text-center">View Products</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown-submenu text-center">
                                        <a class="test" tabindex="-1" href="#">SERVICE<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="addservice" class="text-center">Add Service</a></li>
                                            <li><a href="allservices" class="text-center">View Services</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown-submenu text-center">
                                        <a class="test" tabindex="-1" href="#">PRODUCT CATEGORY<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="addproductcategory" class="text-center">Add Product Category</a></li>
                                            <li><a href="allproductcategory" class="text-center">View Product Categories</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${sales_score == true}">
<!--                                    <li><a href="salesinvoices">ALL INVOICES</a></li>
                                    <li><a href="salesreport">SALES REPORT</a></li>-->
                                    <li class="dropdown-submenu text-center">
                                        <a class="test" tabindex="-1" href="#"> INVOICE <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="salesinvoices" class="text-center">Check All Invoices</a></li>
                                            <li><a href="salesreport" class="text-center">Sales Report </a></li>
                                        </ul>
                                    </li>
                                </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="scroll-top-wrapper ">
            <span class="scroll-top-inner">
                <i class="glyphicon glyphicon-chevron-up"></i>
            </span>
        </div>
        
        
        <script>
            $(document).ready(function(){
                $(function(){
                    $(document).on( 'scroll', function(){
                        if ($(window).scrollTop() > 100) {
                            $('.scroll-top-wrapper').addClass('show');
                        } else {
                            $('.scroll-top-wrapper').removeClass('show');
                        }
                    });
                    $('.scroll-top-wrapper').on('click', scrollToTop);
                });
                function scrollToTop() {
                    verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;
                    element = $('body');
                    offset = element.offset();
                    offsetTop = offset.top;
                    $('html, body').animate({scrollTop: offsetTop}, 500, 'linear');
                }
                
                $('.dropdown-submenu a.test').on("click", function(e){
                    $(this).next('ul').toggle();
                e.stopPropagation();
                e.preventDefault();
              });
            });
        </script>
    </body>
</html>
