<%-- 
    Document   : guide
    Created on : 05 20, 17, 8:01:11 PM
    Author     : Sydney Cruz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/tsppi-guide-modal.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--Modal for tips and tricks-->
        <div id="guide-modal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        Quick Guide
                    </div>
                    <div class="modal-body">
                        <div class="mui-container">
                            <div class="mui-row">
                                <div class="tabbable">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#tab1" data-toggle="tab">Profile</a></li>
                                        <li><a href="#tab2" data-toggle="tab">Navigation Menu</a></li>
                                        <c:choose>
                                            <c:when test="${account_type == 'admin'}">
                                                <li><a href="#account-tab" data-toggle="tab">Account</a></li>
                                                <li><a href="#job-position-tab" data-toggle="tab">Job Position</a></li>
                                            </c:when>
                                            <c:when test="${management_score == true}">
                                                <li><a href="#client-tab" data-toggle="tab">Client</a></li>
                                                <li><a href="#payment-method-tab" data-toggle="tab">Payment Method</a></li>
                                            </c:when>
                                            <c:when test="${inventory_score == true}">
                                                <li><a href="#product-tab" data-toggle="tab">Product</a></li>
                                                <li><a href="#product-category-tab" data-toggle="tab">Product Category</a></li>
                                                <li><a href="#service-tab" data-toggle="tab">Service</a></li>
                                            </c:when>
                                            <c:when test="${sales_score == true}">
                                                <li><a href="#client-tab" data-toggle="tab">Client</a></li>
                                                <li><a href="#invoice-tab" data-toggle="tab">Invoice</a></li>
                                                <li><a href="#sales-report-tab" data-toggle="tab">Sales Report</a></li>
                                            </c:when>
                                            <c:when test="${account_type == "client"}">
                                                <li><a href="#generate-invoice-tab" data-toggle="tab">Generate Invoice</a></li>
                                                <li><a href="#client-invoices-tab" data-toggle="tab">My Invoices</a></li>
                                            </c:when>
                                        </c:choose>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab1">
                                            <legend class="text-center">Profile</legend>
                                            <img src="img/tsppi-guide/profile.png" class="img img-responsive">
                                            <p>1. <strong>Profile</strong> - Contains all the information you registered.</p>
                                            <p>2. <strong>Edit Profile</strong> - Allows you to change your information, including the profile image.</p>
                                            <p>3. <strong>Change Password</strong> - Allows you to change your password.</p>
                                            <p>4. <strong>User Privileges Section</strong> - Contains all the account privileges pre-registered to you.</p>
                                        </div>
                                        <div class="tab-pane" id="tab2">
                                            <legend class="text-center">Navigation Menu</legend>
                                            <img src="img/tsppi-guide/navigation.png" class="img img-responsive">
                                            <p>1. <strong>Navigation Menu</strong> - Contains all compressed links and privileges.</p>
                                            <p>2. <strong>Upper Navigation Menu</strong> - Contains links that will redirect you to the Home page and About Us page.</p>
                                            <p>3. <strong>Lower Navigation Menu</strong> - Contains links and privileges pre-registered to you.</p>
                                            <p>4. <strong>Search a Product!</strong> - Allows you to search any product that is available.</p>
                                            <p>5. <strong>Lower Right Most Link</strong> - Contains profile related links.</p>
                                            <p>6. <strong>Lower Left Most Links</strong> - Contains privileges pre-registered to you.</p>
                                        </div>
                                        <div class="tab-pane" id="tab3">
                                            <legend class="text-center">Navigation Menu</legend>
                                            <img src="img/tsppi-guide/navigation.png" class="img img-responsive">
                                            <p>1. <strong>Navigation Menu</strong> - Contains all compressed links and privileges.</p>
                                            <p>2. <strong>Upper Navigation Menu</strong> - Contains links that will redirect you to the Home page and About Us page.</p>
                                            <p>3. <strong>Lower Navigation Menu</strong> - Contains links and privileges pre-registered to you.</p>
                                            <p>4. <strong>Search a Product!</strong> - Allows you to search any product that is available.</p>
                                            <p>5. <strong>Right Most Link</strong> - Contains profile related links.</p>
                                            <p>6. <strong>Left Most Links</strong> - Contains privileges pre-registered to you.</p>
                                        </div>
                                        <c:choose>
                                            <c:when test="${account_type == 'admin'}">
                                                <div class="tab-pane" id="account-tab">
                                                    <legend class="text-center">Account Privilege</legend>
                                                    <img src="img/tsppi-guide/emp-reg.png" class="img img-responsive">  
                                                    <p>
                                                        1. <strong>Register Employee</strong> - Allows you to register for an employee account.
                                                        <br><br>
                                                        Note: Before you register an employee, there must be a <strong>visible or existing</strong> Job Position.
                                                    </p>
                                                    <img src="img/tsppi-guide/all-accounts.png" class="img img-responsive">
                                                    <p>
                                                        2. <strong>View Accounts</strong> - Contains a list of all accounts.
                                                    </p>
                                                    <p>
                                                        3. <strong>Activate/Deactivate Account</strong> - Allows you to activate or deactivate an account.
                                                        The link of this privileges is found in View Accounts page.
                                                    </p>
                                                </div>
                                                <div class="tab-pane" id="job-position-tab">
                                                    <legend class="text-center">Job Position</legend>
                                                    <img src="img/tsppi-guide/add-job.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>Add Job Position</strong> - Allows you to add a job position. 
                                                        <br><br>
                                                        Note: This is a <strong>pre-requisite action</strong> before you register an employee.
                                                    </p>
                                                    <img src="img/tsppi-guide/all-jobs.png" class="img img-responsive">
                                                    <p>
                                                        2. <strong>View Job Positions</strong> - Contains a list of all job positions. 
                                                    </p>
                                                    <p>
                                                        3. <strong>Job Visibility</strong> - Allows you to change the visibility status of a job position.
                                                        The link of this privilege is found in View Job Positions page.
                                                    </p>
                                                    <p>
                                                        4. <strong>Adjust Job Privilege</strong> - Allows you to change the privilege(s) of a job position.
                                                        The link of this privilege is found in View Job Positions page.
                                                    </p>
                                                    <img src="img/tsppi-guide/edit-job.png" class="img img-responsive">
                                                    <p>
                                                        5. <strong>Edit Job Position</strong> - Allows you to edit the information of a job position.
                                                        The link of this privilege is found in View Job Positions page.
                                                    </p>
                                                    
                                                </div>
                                            </c:when>
                                            <c:when test="${management_score ==true}">
                                                <div class="tab-pane" id="client-tab">
                                                    <legend class="text-center">Client</legend>
                                                    <img src="img/tsppi-guide/add-comp.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>Add Client Company</strong> - Allows you to create a company profile requested by the client.
                                                        <br><br>
                                                        Note: This is a <strong>pre-requisite action</strong> before a user can request a client account.
                                                    </p>
                                                    <img src="img/tsppi-guide/all-comp.png" class="img img-responsive">
                                                    <p>
                                                        2. <strong>View Client Companies</strong> - Contains a list of all client companies.
                                                    </p>
                                                    <img src="img/tsppi-guide/edit-comp.png" class="img img-responsive">
                                                    <p>
                                                        3. <strong>Edit Client Company</strong> - Allows you to change the information of a company profile.
                                                        The link of this privilege is found in View Client Companies.
                                                    </p>
                                                    <img src="img/tsppi-guide/all-cli-accounts.png" class="img img-responsive">
                                                    <p>
                                                        4. <strong>View Client Accounts</strong> - Contains a list of all client accounts.
                                                    </p>
                                                    <p>
                                                        5. <strong>Activate Account</strong> - Allows you to activate a requesting client account.
                                                    </p>
                                                </div>
                                                <div class="tab-pane" id="payment-method-tab">
                                                    <legend class="text-center">Payment Method</legend>
                                                    <img src="img/tsppi-guide/add-pm.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>Add Payment Method</strong> - Allows you to add a payment method. 
                                                        <br><br>
                                                        Note: This is a <strong>pre-requisite action</strong> before a client can generate an invoice.
                                                    </p>
                                                    <img src="img/tsppi-guide/all-pm.png" class="img img-responsive">
                                                    <p>
                                                        2. <strong>View Payment Methods</strong> - Contains a list of all payment methods. 
                                                    </p>
                                                    <p>
                                                        3. <strong>Method Visibility</strong> - Allows you to change the visibility status of a payment method.
                                                        The link of this privilege is found in View Payment Methods page.
                                                    </p>
                                                    <img src="img/tsppi-guide/edit-pm.png" class="img img-responsive">
                                                    <p>
                                                        3. <strong>Edit Payment Method</strong> - Allows you to edit the information of a payment method.
                                                        The link of this privilege is found in View Payment Methods page.
                                                    </p>
                                                    
                                                </div>
                                            </c:when>
                                            <c:when test="${inventory_score ==true}">
                                                <div class="tab-pane" id="product-tab">
                                                    <legend class="text-center">Product</legend>
                                                    <img src="img/tsppi-guide/add-prod.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>Add Product</strong> - Allows you to create a product.
                                                        <br><br>
                                                        Note: The product created is still <strong>hidden</strong>. Change this in Approve/All Products page.
                                                        <br>
                                                        Note: There must be a <strong>visible or existing</strong> Product Category.
                                                    </p>
                                                    <img src="img/tsppi-guide/app-prod.png" class="img img-responsive">
                                                    <p>
                                                        2. <strong>Approve/All Products</strong> - Contains a list of all products.
                                                    </p>
                                                    <p>
                                                        3. <strong>Product Visibility</strong> - Allows you to change the visibility status of a product.
                                                        The link of this privilege is found in Approve Products page.
                                                    </p>
                                                    <img src="img/tsppi-guide/edit-prod.png" class="img img-responsive">
                                                    <p>
                                                        4. <strong>Edit Product</strong> - Allows you to change the information of a product.
                                                        The link of this privilege is found in Approve Products page.
                                                    </p>
                                                    <img src="img/tsppi-guide/gen-prods.png" class="img img-responsive">
                                                    <p>
                                                        5. <strong>View Products</strong> - Contains a gallery of products.
                                                        The link of this privilege is found on the Navigation Menu under the compressed Product.
                                                    </p>
                                                </div>
                                                <div class="tab-pane" id="product-category-tab">
                                                    <legend class="text-center">Product Category</legend>
                                                    <img src="img/tsppi-guide/add-prod-cat.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>Add Product Category</strong> - Allows you to create a product category.
                                                        <br><br>
                                                        Note: This is a <strong>pre-requisite action</strong> before you can add a Product.
                                                    </p>
                                                    <img src="img/tsppi-guide/all-prod-cat.png" class="img img-responsive">
                                                    <p>
                                                        2. <strong>View Product Categories</strong> - Contains a list of all product categories.
                                                    </p>
                                                    <p>
                                                        3. <strong>Category Visibility</strong> - Allows you to change the visibility status of a product category.
                                                        The link of this privilege is found in View Product Categories page.
                                                    </p>
                                                    <img src="img/tsppi-guide/edit-prod-cat.png" class="img img-responsive">
                                                    <p>
                                                        4. <strong>Edit Product Category</strong> - Allows you to change the information of a product category.
                                                        The link of this privilege is found in View Product Categories page.
                                                    </p>
                                                </div>
                                                <div class="tab-pane" id="service-tab">
                                                    <legend class="text-center">Service</legend>
                                                    <img src="img/tsppi-guide/add-service.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>Add Service</strong> - Allows you to create a Service.
                                                    </p>
                                                    <img src="img/tsppi-guide/view-services.png" class="img img-responsive">
                                                    <p>
                                                        2. <strong>View Services</strong> - Contains a list of all services.
                                                    </p>
                                                    <img src="img/tsppi-guide/edit-service.png" class="img img-responsive">
                                                    <p>
                                                        4. <strong>Edit Product Category</strong> - Allows you to change the information of a service.
                                                        The link of this privilege is found in View Services page.
                                                    </p>
                                                </div>
                                            </c:when>
                                            <c:when test="${sales_score == true}">
                                                <div class="tab-pane" id="client-tab">
                                                    <legend class="text-center">Client</legend>
                                                    <img src="img/tsppi-guide/sales-client-accounts.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>View Client Accounts</strong> - Contains a list of all client accounts.
                                                    </p>
                                                </div>
                                                <div class="tab-pane" id="invoice-tab">
                                                    <legend class="text-center">Invoice</legend>
                                                    <img src="img/tsppi-guide/sales-invoices.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>View Client Invoices</strong> - Contains a list of all client invoices.
                                                    </p>
                                                    <p>
                                                        2. <strong>Confirm</strong> - Allows you to accept or reject an invoice.
                                                    </p>
                                                    <p>
                                                        3. <strong>In Delivery</strong> - Allows you to change the status of an invoice.
                                                        All invoices with this state are recorded on the company's sales report.
                                                    </p>
                                                </div>
                                                <div class="tab-pane" id="sales-report-tab">
                                                    <legend class="text-center">Sales Report</legend>
                                                    <img src="img/tsppi-guide/sales-report.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>Sales Report</strong> - Contains a list of all invoices with In Delivery. 
                                                        Displays the total profit generated.
                                                    </p>
                                                </div>
                                            </c:when>
                                            <c:when test="${account_type == 'client'}">
                                                <div class="tab-pane" id="generate-invoice-tab">
                                                    <legend class="text-center">Generate Invoice</legend>
                                                    <p>
                                                        1. Go to Products.
                                                    </p>
                                                    <p>
                                                        2. Select a Product and click on View Details.
                                                    </p>
                                                    <img src="img/tsppi-guide/add-to-cart.png" class="img img-responsive">
                                                    <p>
                                                        3. Add a quantity and click Add.
                                                    </p>
                                                    <img src="img/tsppi-guide/cart-menu.png" class="img img-responsive">
                                                    <p>
                                                        4. Product is added in the cart.
                                                    </p>                                                    
                                                    <img src="img/tsppi-guide/cart-page.png" class="img img-responsive">
                                                    <p>
                                                        5. <strong>View and Edit Cart</strong> - Contains a summary of products in the cart.
                                                    </p>
                                                    <img src="img/tsppi-guide/invoice-request.png" class="img img-responsive">
                                                    <p>
                                                        6. <strong>Check Out</strong> - Contains a summary of cart and your information.
                                                    </p>
                                                    <p>
                                                        7. Select a <strong>Payment Method</strong> before generating the invoice.
                                                    </p>
                                                    <p>
                                                        8. After generating the invoice, the system will send an email notification to the sales represantive.
                                                    </p>
                                                </div>
                                                <div class="tab-pane" id="client-invoices-tab">
                                                    <legend class="text-center">My Invoices</legend>
                                                    <img src="img/tsppi-guide/client-invoices.png" class="img img-responsive">
                                                    <p>
                                                        1. <strong>My Invoices</strong> - Contains a list of your invoices.
                                                    </p>
                                                    <p>
                                                        2. <strong>Cancel Invoice</strong> - Allows you to cancel a pending invoice within 7 days.
                                                    </p>
                                                    <p>
                                                        3. <strong>Resubmit Invoice</strong> - Allows you to resubmit an expired invoice.
                                                    </p>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal for tips and tricks-->
    </body>
</html>
