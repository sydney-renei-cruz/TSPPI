<%-- 
    Document   : all-company
    Created on : 03 17, 17, 6:21:52 PM
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
                                <h1>All Client Companies</h1>
                            </c:when>
                            <c:otherwise>
                                <h1>No Client Companies to be shown</h1>
                                <h3><a href="addcompany" style="color: #fff !important;">Add a Company Profile.</a></h3>
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
                        <div class="col-lg-12">
                            <div class="table text-center">
                                <table class="table company-table">
                                    <thead>
                                        <tr>
                                          <th class="text-center">Company Name</th>
                                          <th class="text-center">Branch</th>
                                          <th class="text-center">Company Address</th>
                                          <th class="text-center">Company Telephone</th>
                                          <th class="text-center"></th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                          <c:forEach var="al" items="${al}">
                                          <tr>
                                              <td>${al.getCompanyName()}</td>
                                              <td>${al.getCompanyBranch()}</td>
                                              <td>${al.getCompanyAddress()}</td>
                                              <td>${al.getCompanyTelephone()}</td>
                                              <td>
                                                  <form action="editcompany" method="GET">
                                                      <input type="hidden" name="company_id" class="company_id" value="${al.getCompanyID()}">
                                                      <input type="submit" name="submit" id="submit" value="Edit" class="btn btn-warning">
                                                  </form>
                                              </td>
                                          </tr>
                                        </c:forEach>
                                      </tbody>
                                  </table>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center" >
                                                <a href="addcompany" class="forgot-password" style="color: #fff;">Add Client Company.</a>
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
              $(".company-table").dataTable({
                    "columnDefs": [
                        {"orderable": false, "targets": 4}
                    ]
                });
            });
            </script>
        </c:if>
    </body>
</html>
