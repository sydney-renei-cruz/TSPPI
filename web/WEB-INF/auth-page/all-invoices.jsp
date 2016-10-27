<%-- 
    Document   : all-orders
    Created on : Oct 26, 2016, 8:39:50 AM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/item-list.css">
    </head>
    <body>
        <%@include file="/WEB-INF/static-page/navbar.jsp" %>
        <section class="team">            
            <div class="container">
              <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="col-lg-12">
                      <h3 class="description">Employee</h3>
                      <div class="table text-center">
                          <table class="table">
                              <thead>
                                  <tr>
                                    <th class="text-center">Tracking ID</th>
                                    <th class="text-center">Products</th>
                                    <th class="text-center">Total Amount</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Invoice Created</th>
                                    <th></th>
                                </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>1</td>
                                      <td><a href="#"> View Ordered Products</a></td>
                                      <td>20.2</td>
                                      <td>Pending</td>
                                      <td>05/22/1996</td>
                                      <td><a href="#"> Cancel Order </a></td>
                                  </tr>
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
