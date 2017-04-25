<%-- 
    Document   : all-payment-method
    Created on : 02 22, 17, 1:37:48 PM
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
                                <h1>All Payment Method</h1>
                            </c:when>
                            <c:otherwise>
                                <h1>No Payment Methods to be shown</h1>
                                <h3><a href="addpaymentmethod" style="color: #fff !important;">Add a Payment Method.</a></h3>
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
                                <table class="table method-table">
                                    <thead>
                                        <tr>
                                          <th class="text-center">Payment Method</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                          <c:forEach var="al" items="${al}">
                                          <tr>
                                              <td>${al.getPaymentMethod()}</td>
                                              <td>
                                                  <form action="editpaymentmethod" method="GET">
                                                      <input type="hidden" name="pm_id" class="category_id" value="${al.getPMID()}">
                                                      <input type="submit" name="submit" id="submit" value="Edit" class="btn btn-warning">
                                                  </form>
                                              </td>
                                              <td>
                                                  <c:choose>
                                                      <c:when test="${al.getShowMethod() == false}">
                                                            <form action="paymentmethodvisibilityoption" method="POST">
                                                                <input type="hidden" name="pm_id" class="pm_id" value="${al.getPMID()}">
                                                                <input type="hidden" name="show_method" class="show_method" value="${al.getShowMethod()}">
                                                                <input type="submit" name="submit" id="submit" value="Hide to List" class="btn btn-danger" title="Hide this category when changing/adding a product">
                                                            </form>
                                                      </c:when>
                                                      <c:otherwise>
                                                            <form action="paymentmethodvisibilityoption" method="POST">
                                                                <input type="hidden" name="pm_id" class="pm_id" value="${al.getPMID()}">
                                                                <input type="hidden" name="show_method" class="show_method" value="${al.getShowMethod()}">
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
                                                <a href="addpaymentmethod" class="forgot-password" style="color: #fff;">Add Payment Method.</a>
                                            </div>
                                        </div>
                                    </div>
                              </div>
                        </div>
                    </div>
                  </div>
                </div>
              </section>
            <script type="text/javascript" charset="utf8" src="imports/datatables.js"></script>
            <script>
                 $(function(){
                    $(".method-table").dataTable({
                          "columnDefs": [
                              {"orderable": false, "targets": 1},
                              {"orderable": false, "targets": 2}
                          ]
                      });
                  });
            </script>
            <script type="text/javascript">
            $(window).on('load',function(){
                payAddSuccess();
                editPayVis();
            });
        </script>
        </c:if>
    </body>
</html>
