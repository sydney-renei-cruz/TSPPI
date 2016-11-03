<%-- 
    Document   : ticketing
    Created on : Nov 3, 2016, 6:21:20 PM
    Author     : Jasteen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bug Report</title>
    </head>
    <body>
        <form action="ticketingservlet" method="POST">
            <table align="center" cellpadding="5">
                <tbody>
                    <tr> <td colspan="3" align="center">
                    <b> Send Bug Report </b> </td> </tr>
                    <tr>
                        <td> Message </td> <td> : </td>
                        <td> <textarea name="message" rows="8" cols="30">
                        </textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                        <input type="submit" value="Send" />                             
                        <td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
