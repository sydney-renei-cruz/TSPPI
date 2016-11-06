
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
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="home"><img alt="" src="img/tsppi.png" id="nav-img"></a>
                        
                        <div class="nav navbar-left">
                            <a href="home" class="btn btn-link navbar-btn">HOME</a>
                            <a href="about" class="btn btn-link navbar-btn">ABOUT US</a>
                        </div>
                        
                    </div>
                </div>
            </nav>
            <nav class="navbar navbar-fixed-top nav-bot">
                <div class="container-fluid">
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
                            <li style="overflow: hidden;">
                                <form class="search-bar navbar-form" style="border: 1px solid transparent;" action="search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search Me!" name="srch" id="srch">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default" type="submit">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </li>
                            <c:choose>
                                <c:when test="${user != null}">
                                    <c:if test="${account_type == 'client'}">
                                        <jsp:useBean id="cart" scope="session" class="com.tsppi.bean.CartBean" />

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
                                                            <form name="item" action="cartservlet" method="POST">
                                                                <span class="item">
                                                                  <span class="item-left">
                                                                      <span class="item-info">
                                                                          <span>${cart_item.getItemName()}</span>
                                                                          <span>x${cart_item.getQuantity()} - ₱${cart_item.getTotalCost()}</span>
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
                                        <a class="dropdown-toggle" data-toggle="dropdown" href=""><span class="glyphicon glyphicon-user"></span> ${user} <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="profile" class="text-center">View Profile</a></li>
                                            <li><a href="logoutservlet" class="text-center">Logout</a></li>
                                        </ul>
                                    </li>
                                    
                                </c:when>
                                <c:otherwise>
                                    <li><a href="login"><span class="glyphicon glyphicon-user"></span> Account</a></li>
                                </c:otherwise>
                            </c:choose>
                            
                        </ul>   
                        <ul class="nav navbar-nav  navbar-left">
                            <li><a href="products">PRODUCTS</a></li>
                            <li><a href="services">SERVICES</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        
    </body>
</html>
