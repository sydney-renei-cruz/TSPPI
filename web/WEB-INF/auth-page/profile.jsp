<%-- 
    Document   : profile
    Created on : Aug 20, 2016, 8:33:10 PM
    Author     : cruzsyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%@include file="../static-page/navbar.jsp" %>
        
        <% if (session.getAttribute("account_type").equals("client")){ %>
            <h1>Client PROFILE</h1>
        <% }else if (session.getAttribute("account_type").equals("admin")){%>
            <h1>Admin PROFILE</h1>
        <% }else{ %>
            <h1> Employee Profile</h1>
            <% if (session.getAttribute("job_position").equals("Vice President")){ %>
            <h1>Vice President</h1>
            <% }else{ %>
            <h1>Inventory Officer</h1>
        <%     } 
          } %>
        <form action="Logout" method="post">
            <input type="submit" name="logout" value="Log out">
        </form>
    </body>
</html>
