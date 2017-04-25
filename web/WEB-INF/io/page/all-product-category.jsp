<%-- 
    Document   : all-product-category
    Created on : 02 19, 17, 7:51:31 PM
    Author     : Sydney Cruz
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
                            <c:when test="${al.size() > 0}">
                                <h1>All Product Categories</h1>
                            </c:when>
                            <c:otherwise>
                                <h1>No Product Categories to be shown</h1>
                                <h3><a href="addproductcategory" style="color: #fff !important;">Add a Product Category.</a></h3>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
	</header>
        <c:if test="${al.size() > 0}">
            <section class="team">            
                <div class="container">
                  <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <%@include file="/WEB-INF/source/mssgBox.jsp" %>
                        <div class="col-lg-12">
                            <div class="table text-center">
                                <table class="table category-table">
                                    <thead>
                                        <tr>
                                          <th class="text-center">Product Category</th>
                                          <th></th>
                                          <th></th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                          <c:forEach var="al" items="${al}">
                                          <tr>
                                              <td>${al.getCategoryName()}</td>
                                              <td>
                                                  <form action="editproductcategory" method="GET">
                                                      <input type="hidden" name="category_id" class="category_id" value="${al.getCategoryID()}">
                                                      <input type="submit" name="submit" id="submit" value="Edit" class="btn btn-warning">
                                                  </form>
                                              </td>
                                              <td>
                                                  <c:choose>
                                                      <c:when test="${al.getShowCategory() == false}">
                                                            <form action="categoryvisibilityoption" method="POST">
                                                                <input type="hidden" name="category_id" class="category_id" value="${al.getCategoryID()}">
                                                                <input type="hidden" name="show_category" class="show_category" value="${al.getShowCategory()}">
                                                                <input type="submit" name="submit" id="submit" value="Hide to List" class="btn btn-danger" title="Hide this category when changing/adding a product">
                                                            </form>
                                                      </c:when>
                                                      <c:otherwise>
                                                            <form action="categoryvisibilityoption" method="POST">
                                                                <input type="hidden" name="category_id" class="category_id" value="${al.getCategoryID()}">
                                                                <input type="hidden" name="show_category" class="show_category" value="${al.getShowCategory()}">
                                                                <input type="submit" name="submit" id="submit" value="Show to List" class="btn btn-danger" title="Show this category when changing/adding a product">
                                                            </form>
                                                      </c:otherwise>
                                                  </c:choose>

                                              </td>
                                          </tr>
                                        </c:forEach>
                                      </tbody>
                                  </table>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center" >
                                                <a href="addproductcategory" class="forgot-password" style="color: #fff;">Add Product Category.</a>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="text-center" >
                                                <a href="addproduct" class="forgot-password" style="color: #fff;">Add Product.</a>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                        </div>
                    </div>
                  </div>
                </div>
              </section>
        </c:if>
        <script type="text/javascript">
            $(window).on('load',function(){
                removeProdCat();
            });
        </script>
        
        <script type="text/javascript" charset="utf8" src="imports/datatables.js"></script>
            <script>
            $(function(){
              $(".category-table").dataTable({
                    "columnDefs": [
                        {"orderable": false, "targets": 1},
                        {"orderable": false, "targets": 2}
                    ]
                });
            });
            </script>
    </body>
</html>
