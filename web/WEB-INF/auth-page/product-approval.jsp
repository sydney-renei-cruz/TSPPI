<%-- 
    Document   : all-products
    Created on : Sep 11, 2016, 10:48:09 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/item-list.css">
    </head>
    <body>
        <%@include file="/WEB-INF/static-page/navbar.jsp" %>
        <section class="team">            
            <div class="container">
              <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                        <h3 class="description">Product Approval</h3>
                        <div class="row pt-md"> 
                            <c:forEach var="pb" items="${pb}">
                                <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile">
                                    <div class="img-box">
                                        <img src="img/person-placeholder.jpg" alt="" class="img-responsive">
                                    </div>
                                    <h1>${pb.getProductName()}</h1>
                                    <h2>ID: ${pb.getProductID()}</h2>
                                    <h2>MSRP: ${pb.getMSRP()}</h2>
                                    <h2>Stock: ${pb.getStock()}</h2>
                                    <h2>Product Details:<br> ${pb.getProductDetail()}</h2>
                                    <div class="cont-btn">
                                        <form action="productapprovalservlet" method="POST">
                                            <input type="hidden" name="product_id" id="product_id" value="${pb.getProductID()}">
                                            <input type="hidden" name="for_sale" id="for_sale" value="${pb.getForSale()}">
                                            <c:if test="${pb.getForSale()}">
                                                <input type="submit" name="submit" id="submit" value="Remove from For-Sale List" class="btn btn-danger">
                                            </c:if>
                                            <c:if test="${!pb.getForSale()}">                                                     
                                                <input type="submit" name="submit" id="submit" value="Add to For-Sale List" class="btn btn-danger">
                                            </c:if>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach >                        
                        </div>
                    </div>
                </div>
                        
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                        <h3 class="description">For Sale</h3>
                        <div class="row pt-md"> 
                            <c:forEach var="pb" items="${pb}">
                                <c:if test = "${pb.getForSale()}">
                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 profile">
                                        <div class="img-box">
                                            <img src="img/person-placeholder.jpg" alt="" class="img-responsive">
                                        </div>
                                        <h1>${pb.getProductName()}</h1>
                                        <h2>ID: ${pb.getProductID()}</h2>
                                        <h2>MSRP: ${pb.getMSRP()}</h2>
                                        <h2>Stock: ${pb.getStock()}</h2>
                                        <h2>Product Details:<br> ${pb.getProductDetail()}</h2>
                                            <form action="productapprovalservlet" method="POST">
                                                <input type="hidden" name="product_id" id="product_id" value="${pb.getProductID()}">
                                                <input type="hidden" name="for_sale" id="for_sale" value="${pb.getForSale()}">
                                                <c:if test="${pb.getForSale()}">
                                                    <input type="submit" name="submit" id="submit" value="Remove from For-Sale List" class="btn btn-danger">
                                                </c:if>
                                                <c:if test="${!pb.getForSale()}">                                                     
                                                    <input type="submit" name="submit" id="submit" value="Add to For-Sale List" class="btn btn-danger">
                                                </c:if>
                                            </form>
                                    </div>
                                </c:if>
                            </c:forEach >                        
                        </div>
                    </div>
                </div>        
              
              </div>
            </div>
          </section>
    </body>
</html>
