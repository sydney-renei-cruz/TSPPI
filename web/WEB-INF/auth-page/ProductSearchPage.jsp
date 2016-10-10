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
            </tr>
            <%
                int f = 0;
                ArrayList pList = new ArrayList();
                try{
                    if(request.getAttribute("piList") != null)
                    {
                        ArrayList al = (ArrayList) request.getAttribute("piList");
                        System.out.println(al);
                        Iterator itr = al.iterator();
                        for(int y = 0; y< al.size(); y++)
                        {
                            pList = (ArrayList) itr.next();
                        }
                    }
                    else{ out.println("No Matches Found");}
                    }

                catch(Exception e){
                    e.printStackTrace();
                        }
                
               

            %>
            
            <%
                
              try{ 
                for(int i = 0; i < pList.size(); i++)
                {


            %>
            <tr>
                <td><%=pList.get(f)%></td>
                <td><%=pList.get(f+1)%></td>
                <td><%=pList.get(f+2)%></td>
            </tr>
            
            <%
                f = f + 2;
                
                }
              }

              catch(Exception e)
              {e.printStackTrace();}
            %>
            
        </table>
    </body>
</html>
