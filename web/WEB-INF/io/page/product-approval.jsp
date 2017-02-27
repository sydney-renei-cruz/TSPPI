<%-- 
    Document   : all-products
    Created on : Sep 11, 2016, 10:48:09 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/item-list.css">
        <link rel="stylesheet" href="imports/tablesorter.style.css">
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>Approve/Edit Products</h1>
                    </div>
                </div>
            </div>
	</header>
        <section class="team">            
            <div class="container">
              
              <div class="row">  
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                        <div class="well well-sm">
                            <h4 class="description">Product Approval</h4>
                        </div>
                        <div class="table text-center">
                          <table class="table tablesorter">
                              <thead>
                                  <tr>
                                    <th></th>
                                    <th class="text-center">Product Name</th>
                                    <th class="text-center">Category</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Stock</th>
                                    <th class="text-center">Details</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                              </thead>
                              <tbody>
                                  <c:forEach var="pb" items="${pb}">
                                      <tr class="content">
                                            <td><img src="img?pi=${pb.getProductID()}" alt="" class="img-responsive appr-product"></td>
                                            <td>${pb.getProductName()}</td>
                                            <td>${pb.getCategoryName()}</td>
                                            <td>${pb.getMSRP()}</td>
                                            <td>${pb.getStock()}</td>
                                            <td>${pb.getProductDetail()}</td>
                                            <td>
                                                <form action="editproduct" method="GET">
                                                    <input type="hidden" name="product_id" id="product_id" value="${pb.getProductID()}">
                                                    <input type="submit" name="submit" id="submit" value="Edit Product" class="btn btn-warning">
                                                </form>
                                            </td>
                                            <td>
                                                <form action="approveproduct" method="POST">
                                                    <input type="hidden" name="product_id" id="product_id" value="${pb.getProductID()}">
                                                    <input type="hidden" name="for_sale" id="for_sale" value="${pb.getForSale()}">
                                                    <c:if test="${pb.getForSale()}">
                                                        <input type="submit" name="submit" id="remForSale" value="Remove from For-Sale List" class="btn btn-danger">
                                                    </c:if>
                                                    <c:if test="${!pb.getForSale()}">                                                     
                                                        <input type="submit" name="submit" id="addForSale" value="Add to For-Sale List" class="btn btn-danger">
                                                    </c:if>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- pagination -->
                <nav class="text-center">
                    <div class="col-lg-12">
                        <ul class="pagination">
                            <li class="pag_prev">
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="pag_next">
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <!-- pagination -->
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                        <div class="well well-sm">
                            <h4 class="description">For Sale</h4>
                        </div>
                        <div class="table text-center">
                              <table class="table tablesorter">
                                  <thead>
                                      <tr>
                                        <th class="text-center">Product Name</th>
                                        <th class="text-center">Category</th>
                                        <th class="text-center">Price</th>
                                        <th class="text-center">Stock</th>
                                        <th class="text-center">Details</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                      <c:forEach var="pb2" items="${pb2}">
                                          <tr>
                                              <td>${pb2.getProductName()}</td>
                                              <td>${pb2.getCategoryName()}</td>
                                              <td>${pb2.getMSRP()}</td>
                                              <td>${pb2.getStock()}</td>
                                              <td>${pb2.getProductDetail()}</td>
                                          </tr>
                                      </c:forEach>
                                  </tbody>
                              </table>
                          </div>
                    </div>
                </div>        
              
              </div>
            </div>
          </section>
        <script src="js/pagination.js"></script>
	<script src="imports/jquery.tablesorter.min.js"></script>
        <script>
            $(document).ready(function(){
               $('.table').tablesorter({
                   sortList: [[0,0], [1,0]]
               }); 
            });
        </script>
    </body>
</html>
