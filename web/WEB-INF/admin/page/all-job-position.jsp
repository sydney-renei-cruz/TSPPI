<%-- 
    Document   : all-job-position
    Created on : 02 23, 17, 7:26:51 PM
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
                        <h1>All Job Position</h1>
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
                                        <h2>No Job Positions to be shown</h2>
                                        <h3><a href="addjobposition" style="color: #fff;">Add a Job Position</a></h3>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table text-center">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                              <th class="text-center">Job Position</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                              <c:forEach var="al" items="${al}">
                                              <tr>
                                                  <td>${al.getJobType()}</td>
                                                  <td>
                                                      <form action="editjobposition" method="GET">
                                                          <input type="hidden" name="job_id" class="job_id" value="${al.getJobID()}">
                                                          <input type="submit" name="submit" id="submit" value="Edit" class="btn btn-warning">
                                                      </form>
                                                  </td>
                                                  <td>
                                                      <c:choose>
                                                          <c:when test="${al.getManagementScore() == true}">
                                                                <form action="managementprivilegecontroller" method="POST">
                                                                    <input type="hidden" name="job_id" class="job_id" value="${al.getJobID()}">
                                                                    <input type="hidden" name="management_score" class="management_score" value="${al.getManagementScore()}">
                                                                    <input type="submit" name="submit" id="submit" value="Remove Management Privilege" class="btn btn-primary" title="Remove Management Privileges">
                                                                </form>
                                                          </c:when>
                                                          <c:otherwise>
                                                                <form action="managementprivilegecontroller" method="POST">
                                                                    <input type="hidden" name="job_id" class="job_id" value="${al.getJobID()}">
                                                                    <input type="hidden" name="management_score" class="management_score" value="${al.getManagementScore()}">
                                                                    <input type="submit" name="submit" id="submit" value="Add Management Privilege" class="btn btn-primary" title="Allow Management Privileges">
                                                                </form>
                                                          </c:otherwise>
                                                      </c:choose>
                                                  </td>
                                                  <td>
                                                      <c:choose>
                                                          <c:when test="${al.getSalesScore() == true}">
                                                                <form action="salesprivilegecontroller" method="POST">
                                                                    <input type="hidden" name="job_id" class="job_id" value="${al.getJobID()}">
                                                                    <input type="hidden" name="sales_score" class="management_score" value="${al.getSalesScore()}">
                                                                    <input type="submit" name="submit" id="submit" value="Remove Sales Privilege" class="btn btn-primary" title="Remove Sales Privileges">
                                                                </form>
                                                          </c:when>
                                                          <c:otherwise>
                                                                <form action="salesprivilegecontroller" method="POST">
                                                                    <input type="hidden" name="job_id" class="job_id" value="${al.getJobID()}">
                                                                    <input type="hidden" name="sales_score" class="management_score" value="${al.getSalesScore()}">
                                                                    <input type="submit" name="submit" id="submit" value="Add Sales Privilege" class="btn btn-primary" title="Allow Sales Privileges">
                                                                </form>
                                                          </c:otherwise>
                                                      </c:choose>
                                                  </td>
                                                  <td>
                                                      <c:choose>
                                                          <c:when test="${al.getInventoryScore() == true}">
                                                                <form action="inventoryprivilegecontroller" method="POST">
                                                                    <input type="hidden" name="job_id" class="job_id" value="${al.getJobID()}">
                                                                    <input type="hidden" name="inventory_score" class="inventory_score" value="${al.getInventoryScore()}">
                                                                    <input type="submit" name="submit" id="submit" value="Remove I.O. Privilege" class="btn btn-primary" title="Remove Inventory Officer Privileges">
                                                                </form>
                                                          </c:when>
                                                          <c:otherwise>
                                                                <form action="inventoryprivilegecontroller" method="POST">
                                                                    <input type="hidden" name="job_id" class="job_id" value="${al.getJobID()}">
                                                                    <input type="hidden" name="inventory_score" class="inventory_score" value="${al.getInventoryScore()}">
                                                                    <input type="submit" name="submit" id="submit" value="Add I.O. Privilege" class="btn btn-primary" title="Allow Inventory Officer Privileges">
                                                                </form>
                                                          </c:otherwise>
                                                      </c:choose>
                                                  </td>
                                                  <td>
                                                      <c:choose>
                                                          <c:when test="${al.getShowJob() == true}">
                                                                <form action="jobvisibilityoption" method="POST">
                                                                    <input type="hidden" name="job_id" class="job_id" value="${al.getJobID()}">
                                                                    <input type="hidden" name="show_job" class="show_job" value="${al.getShowJob()}">
                                                                    <input type="submit" name="submit" id="submit" value="Hide to List" class="btn btn-danger" title="Hide this position when changing/adding a employee">
                                                                </form>
                                                          </c:when>
                                                          <c:otherwise>
                                                                <form action="jobvisibilityoption" method="POST">
                                                                    <input type="hidden" name="job_id" class="job_id" value="${al.getJobID()}">
                                                                    <input type="hidden" name="show_job" class="show_job" value="${al.getShowJob()}">
                                                                    <input type="submit" name="submit" id="submit" value="Show to List" class="btn btn-danger" title="Show this position when changing/adding a employee">
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
                                                    <a href="addjobposition" class="forgot-password" style="color: #fff;">Add Job Position.</a>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="text-center" >
                                                    <a href="allaccounts" class="forgot-password" style="color: #fff;">All Account.</a>
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
