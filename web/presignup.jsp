<%-- 
    Document   : signup
    Created on : Jun 9, 2023, 9:54:03 PM
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
        <h1 style="color: cornflowerblue">Sign Up</h1>
        <br>
        <form action="SignupServlet" method="post">
            Username: <input type="text" name="usernameSignUp"> (*6-20 characters)
            <br>
            Password: <input type="password" name="passwordSignUp"> (*6-20 characters)
            <br>
            Re-enter: <input type="password" name="reenterSignUp"> (*6-20 characters)
            <br>
            Full Name: <input type="text" name="fullnameSignUp"> (*6-20 characters)
            <br>
            Gender: 
            Male<input type="radio" name="genderSignUp" value="male">
            Female<input type="radio" name="genderSignUp" value="female">
            <br>
            Role: 
            Admin<input type="radio" name="roleSignUp" value="admin">
            Member<input type="radio" name="roleSignUp" value="member">
            <br>
            <br>
            <input type="submit" name="btSignUpInSignUpJSP" value="Sign Up">
        </form>
    </body>
</html>
