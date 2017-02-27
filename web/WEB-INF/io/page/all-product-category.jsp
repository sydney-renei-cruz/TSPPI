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
    </head>
    <body>
        <%@include file="/WEB-INF/source/navigation/navbar.jsp" %>
        <header id="login-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1>All Product Category</h1>
                    </div>
                </div>
            </div>
	</header>
        <section class="team">            
            <div class="container">
              <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                        <c:choose>
                            <c:when test="${al.size() == 0}">
                                <div class="col-md-10 col-md-offset-1" id="no-label">
                                    <div class="col-lg-12 text-center">
                                        <h2>No product categories to be shown</h2>
                                        <h3><a href="addproductcategory" style="color: #fff;">Add a Product Category</a></h3>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table text-center">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                              <th class="text-center">Product Category</th>
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
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
              </div>
            </div>
          </section>
    </body>
</html>
