<%-- 
    Document   : header
    Created on : Jun 13, 2023, 9:07:05 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color: darkcyan; font-family: monospace">LSON'S GARDEN</h1>
        Welcome, <%= (String) session.getAttribute("genderToDisplay") + (String) session.getAttribute("fullnameToDisplay") + "!" %>
        <form style="display: inline" action="LogoutServlet" method="get">
            <input style="margin-left: 5px" type="submit" name="btLogout" value="Logout">
        </form>
        <hr>
        <br>
    </body>
</html>
