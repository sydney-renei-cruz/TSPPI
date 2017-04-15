<%-- 
    Document   : all-accounts
    Created on : Sep 7, 2016, 9:31:32 PM
    Author     : cruzsyd
--%>
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
                        <c:if test="${management_score == true}">
                        <h1>All Client Accounts</h1>
                        </c:if>
                        <c:if test="${account_type == 'admin'}">
                        <h1>All Accounts</h1>
                        </c:if>
                    </div>
                </div>
            </div>
	</header>
        <section class="team">            
            <div class="container">
              <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <c:if test="${account_type == 'admin'}">
                        <div class="col-lg-12">
                          <h3 class="description">Employee</h3>
                          <div class="table text-center">
                              <table class="table">
                                  <thead>
                                      <tr>
                                        <th class="text-center">Username</th>
                                        <th class="text-center">Full name</th>
                                        <th class="text-center">Role</th>
                                        <th class="text-center">Email</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                      <c:forEach var="eb" items="${eb}">
                                          <tr>
                                              <td>${eb.getUsername()}</td>
                                              <td>${eb.getFullName()}</td>
                                              <td>${eb.getJobType()}</td>
                                              <td>${eb.getEmail()}</td>
                                              <td>
                                                  <form action="controlstatus" method="POST">
                                                    <input type="hidden" name="account_num" id="account_num" value="${eb.getAccountNum()}">
                                                    <input type="hidden" name="account_status" id="account_status" value="${eb.getAccountStatus()}">
                                                    <c:if test="${eb.getAccountStatus()}">
                                                        <input type="submit" name="submit" id="deactivate" value="Deactivate Account" class="btn btn-danger" data-toggle="modal" data-target="#mssgBox">
                                                    </c:if>
                                                    <c:if test="${!eb.getAccountStatus()}">                                                     
                                                        <input type="submit" name="submit" id="activate" value="Activate Account" class="btn btn-primary" data-toggle="modal" data-target="#mssgBox">
                                                    </c:if>
                                                </form>
                                              </td>
                                          </tr>
                                      </c:forEach>
                                  </tbody>
                              </table>
                          </div>
                        </div>
                    </c:if>
                  <div class="col-lg-12">
                    <h3 class="description">Client</h3>
                    <div class="table text-center">
                              <table class="table">
                                  <thead>
                                      <tr>
                                        <c:if test="${account_type == 'admin'}">
                                        <th class="text-center">Username</th>
                                        </c:if>
                                        <th class="text-center">Full name</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Mobile</th>
                                        <th class="text-center">Company</th>
                                        <th class="text-center">Company Telephone</th>
                                        <th class="text-center">Company Mailing Address</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                      <c:forEach var="cb" items="${cb}">
                                          <tr>
                                              <c:if test="${account_type == 'admin'}">
                                              <td>${cb.getUsername()}</td>
                                              </c:if>
                                              <td>${cb.getFullName()}</td>
                                              <td>${cb.getEmail()}</td>
                                              <td>${cb.getMobile()}</td>
                                              <td>${cb.getFullCompany()}</td>
                                              <td>${cb.getCompanyTelephone()}</td>
                                              <td>${cb.getCompanyAddress()}</td>
                                            <td>
                                                <form action="controlstatus" method="POST">
                                                  <input type="hidden" name="account_num" id="account_num" value="${cb.getAccountNum()}">
                                                  <input type="hidden" name="account_status" id="account_status" value="${cb.getAccountStatus()}">
                                                  <c:if test="${cb.getAccountStatus()}">
                                                      <input type="submit" name="submit" id="submit" value="Deactivate Account" class="btn btn-danger" data-toggle="modal" data-target="#mssgBox">
                                                  </c:if>
                                                  <c:if test="${!cb.getAccountStatus()}">                                                     
                                                      <input type="submit" name="submit" id="submit" value="Activate Account" class="btn btn-primary" data-toggle="modal" data-target="#mssgBox">
                                                  </c:if>
                                              </form>
                                            </td>
                                          </tr>
                                      </c:forEach>
                                  </tbody>
                              </table>
                          </div>
                    </div>
                    <div class="col-lg-12 text-center" id="all-acc">
                        <a href="profile">Go back to profile.</a>
                    </div>
                </div>
              </div>
            </div>
          </section>
        
        <!--Alert Box Modal-->
        <div id="mssgBox" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        Registration Successful!
                    </div>
                </div>
            </div>
        </div>
        <!--Alert Box Modal-->
        
    </body>
</html>
