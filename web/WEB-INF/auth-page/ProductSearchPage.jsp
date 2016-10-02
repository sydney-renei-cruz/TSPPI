<%-- 
    Document   : product-view
    Created on : Sep 27, 2016, 11:08:58 PM
    Author     : Jasteen
    Reference  : http://www.javaknowledge.info/search-from-database-using-servlet-and-jsp/

--%>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Search</title>
    </head>
    <body>
        <table align="center">
            <tr>
                <td align="center">
                    <b>Product Search</b></td>
            <tr>
                <td align="center"><b>Product Name</b></td>
                <td align="center"><b>Product Detail</b></td>
                <td align="center"><b>Stock For Sale</b></td>
                <td align="center"><b>Registration Date</b></td>
            </tr>
            <%
                int count = 0;
                ArrayList pList = new ArrayList();
                try{
                    if(request.getAttribute("piList") != null)
                    {
                        ArrayList al = (ArrayList) request.getAttribute("piList");
                        System.out.println(al);
                        Iterator itr = al.iterator();
                        count++;
                        pList = (ArrayList) itr.next();
                        }
                else{ out.println("No Matches Found");}
                }
                catch(Exception e){
                    e.printStackTrace();
                        }
            %>
            <tr>
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
            </tr>
            
        </table>
    </body>
</html>
