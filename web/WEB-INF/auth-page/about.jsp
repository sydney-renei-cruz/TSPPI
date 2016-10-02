<%-- 
    Document   : about
    Created on : 09 26, 16, 11:15:55 PM
    Author     : SAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>About Us</title>

        
        <style>
            div.transbox {
                margin: 50px;
                background: rgba(255, 255, 255, 0.8)
            }
            
            div.transbox p {
                opacity: 1.0;
                margin: 10px;
                color: #000000;
                padding: 10px;
            }
            
            div.infoBox p {
                width: 98%;
                text-indent: 50px;
            }
            h1.boxTitle{
                padding: 10px;
                margin: 10px;
                color: #000000;
            }
            table, td, th {
                border: 1px solid #ddd;
                text-align: left;
            }

            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 15px;
            }       
        </style>
        

    </head>
    
    <body id="page-top">
        
        
        <%@include file="../static-page/navbar.jsp"%>
        
        <header class="container-fluid about-header" style="background-image: url(img/fine_paper_for_website.jpg); background-size: cover;"> 
        <div class="infoBox">
            <div class="header-content-inner" style="color:white;">
                <h1 align="center">About Tri-Star</h1>
                <hr>
                <div class="transbox">
                    <div>
                        <h1 class="boxTitle">Company Profile</h1>
                        <hr>
                    </div>
                    
                    <p style="color:black; text-align:justify; font-size:130%">Tri-Star Paper Products, Inc. is a manufacturer and distributor of various paper products with a strong institutional and corporate relationship in private and public sectors. The company was established in 1980 by a group of professionals with over ten years of combined experience in paper product manufacturing. Sales operations are conducted at its main office  at 1554 General Luna St., Madrigal Compound, Paco, Manila. The company maintains its manufacturing facilities at ITC Compound, Bo. Canumay , Valenzuela Metro Manila.</p>
                    <p style="color:black; text-align:justify; font-size:130%">All raw materials are of imported high quality and pass rigid quality standards. All our paper products are processed through sophisticated machinery mostly from Germany such as sheeters  , rewinders , paper guillotines, envelope making machine and ruling machines. The company purchase paper/paperboards in sheets and/or in rolls. 5 units sheeting machine are used in sheeting. Clients are assured of their inventory of paper up to a maximum of one year. Warehouse is sufficient for stocking.</p>
                    <p></p>
                </div>
            </div>
        </div>
        </header>
        
        <header class="container-fluid about-header" style="background-image: url(img/pines.png); background-size: cover;"> 
        <div class="infoBox">
            <div class="header-content-inner" style="color:white;">
                <h1 align="center">About Tri-Star</h1>
                <hr>
                <div class="transbox">
                    <div>
                        <h1 class="boxTitle">Contact Us</h1>
                        <hr>
                    </div>
                        <table align="center"; style="color:black; font-size:130%">
                            <tr>
                                <td>Telephone:</td>
                                <td>521-5002<br>521-3062<br>524-1434</td>
                            </tr>
                            <tr>
                                <td>Fax No.</td>
                                <td>521-5003</td>
                            </tr>
                            <tr>
                                <td>Mobile No.</td>
                                <td>0917-8005410</td>
                            </tr>
                            <tr>
                                <td>E-mail Address</td>
                                <td>tsppi_tristar@yahoo.com</td>
                            </tr>
                        </table>
                </div>
            </div>
        </div>
        </header>
    </body>
</html>
