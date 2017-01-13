<%-- 
    Document   : all-services-io
    Created on : Oct 18, 2016, 5:23:17 PM
    Author     : cruzsyd
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
                        <h1>Edit Service</h1>
                    </div>
                </div>
            </div>
	</header>
        <section class="team">            
            <div class="container">
              <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                        <h3 class="description">All Services</h3>
                        <div class="table text-center">
                          <table class="table">
                              <thead>
                                  <tr>
                                    <th></th>
                                    <th class="text-center">Service Name</th>
                                    <th class="text-center">Service Description</th>
                                    <th></th>
                                </tr>
                              </thead>
                              <tbody>
                                    <c:forEach var="sb" items="${sb}">
                                    <tr>
                                        <td><img src="img/car-placeholder.png" alt="" class="img-responsive" style="width: 100%;"></td>
                                        <td>${sb.getServiceName()}</td>
                                        <td>${sb.getServiceDesc()}</td>
                                        <td>
                                            <form action="editservice" method="GET">
                                                <input type="hidden" name="service_id" id="service_id" value="${sb.getServiceID()}">
                                                <input type="submit" name="submit" id="submit" value="Edit Service" class="btn btn-warning">
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
    </body>
</html>
