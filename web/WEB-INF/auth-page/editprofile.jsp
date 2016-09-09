<%-- 
    Document   : editprofile
    Created on : Sep 6, 2016, 8:10:00 PM
    Author     : Jasteen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <h1 align="center">Please fill up the items you want to edit</h1>
        
        <form action="Edit" method="get">
        
        <table align="center">
            <tr>
                <td align="center">Username:</td>
                <td><input type="text" name="username" id="username" class="form-control" placeholder="Username"></td>
            </tr>
            <tr>
                <td align="center">First Name:</td>
                <td><input type="text" name="firstname" id="firstname" class="form-control" placeholder="First Name"></td>
            </tr>
            <tr>
                <td align="center">Last Name:</td>
                <td><input type="text" name="lastname" id="lastname" class="form-control" placeholder="Laste Name"></td>
            </tr>
            <tr>
                <td align="center">Email Address:</td>
                <td><input type="text" name="email" id="email" class="form-control" placeholder="Email Address"></td>
            </tr>
            <tr>
                <td align="center">Mobile Number:</td>
                <td><input type="text" name="mobile" id="mobile" class="form-control" placeholder="Mobile"></td>
            </tr>
            <tr>
                <td align="center">Telephone Number:</td>
                <td><input type="text" name="telephone" id="telephone" class="form-control" placeholder="Telephone"></td>
            </tr>
            <tr>
                <td align="center">Mailing Address:</td>
                <td><textarea rows="4" cols="50" placeholder="Mailing Address" class="form-control" name="address" id="address"></textarea></td>
            </tr>
            <tr>
                <td align="center"><input type="submit" name="Submit" Value="Save Changes"></td>
            </tr>
        </table>
            
        </form>
            
    </body>
</html>
