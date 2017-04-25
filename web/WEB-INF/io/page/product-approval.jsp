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
        <link rel="stylesheet" href="imports/datatables.css">
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <c:choose>
                            <c:when test="${pb.size() > 0}">
                                <h1>All Products</h1>
                            </c:when>
                            <c:otherwise>
                                <h1>No Products to be shown</h1>
                                <h3><a href="addproduct" style="color: #fff !important;">Add a Product.</a></h3>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
	</header>
        <c:if test="${pb.size() > 0}">
            <section class="team">            
                <div class="container">

                  <div class="row">  
                    <div class="col-md-10 col-md-offset-1">
                        <%@include file="/WEB-INF/source/mssgBox.jsp" %>
                        <div class="col-lg-12">
                            <div class="table text-center">
                              <table class="table approval-table">
                                  <thead>
                                      <tr>
                                        <th></th>
                                        <th class="text-center">Product Name</th>
                                        <th class="text-center">Category</th>
                                        <th class="text-center">Price</th>
                                        <th class="text-center">Stock</th>
                                        <th class="text-center">Details</th>
                                        <th>Edit</th>
                                        <th>Approve</th>
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
                  </div>
                </div>
              </section>
                        
        <script type="text/javascript">
            $(window).on('load',function(){
                removeProd();
            });
        </script>
            <script type="text/javascript" charset="utf8" src="imports/datatables.js"></script>
            <script>
            $(function(){
              $(".approval-table").dataTable({
                    "columnDefs": [
                        {"orderable": false, "targets": 0},
                        {"orderable": false, "targets": 6},
                        {"orderable": false, "targets": 7}
                    ]
                });
            });
            </script>
        </c:if>
    </body>
</html>
