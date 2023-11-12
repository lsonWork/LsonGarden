<%-- 
    Document   : login
    Created on : Jun 9, 2023, 9:02:17 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plant Management</title>
    </head>
    <body>
        <form action="LoginServlet" method="post">
            Username: <input type="text" name="usernameLogin">
            <br>
            Password: <input type="password" name="passwordLogin">
            <br>
            <input type="submit" name="btLogin" value="Login">
        </form>
        <br>
        <form action="SignupServlet" method="get">
            <input type="submit" name="btSignupInLoginJSP" value="Sign Up">
        </form>
        <% String msgLoginFailed = (String) request.getAttribute("msgLoginFailed");
        if (msgLoginFailed != null) {
        %>
        <h3 style="color: red; font-family: monospace"><%= msgLoginFailed %></h3>
        <%
        }
        %>
        <% String msgSignupSuccessfully = (String) request.getAttribute("msgSignupSuccessfully");
        if (msgSignupSuccessfully != null) {
        %>
        <h3 style="color: cornflowerblue; font-family: monospace"><%= msgSignupSuccessfully %></h3>
        <%
        }
        %>
    </body>
</html>
 