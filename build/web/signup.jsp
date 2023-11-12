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
            Username: <input type="text" name="usernameSignUp" value="<%= request.getAttribute("usernameLaunch") %>"> (*6-20 characters)
            <br>
            <% String msg1 = (String) request.getAttribute("msgErrorUsername");
            if (msg1 != null) {
            %>
            <p style="color: red; font-family: monospace"><%= msg1 %></p>
            <%
            }
            %>
            Password: <input type="password" name="passwordSignUp" value="<%= request.getAttribute("passwordLaunch") %>"> (*6-20 characters)
            <br>
            <% String msg2 = (String) request.getAttribute("msgErrorPassword");
            if (msg2 != null) {
            %>
            <h3 style="color: red; font-family: monospace"><%= msg2 %></h3>
            <%
            }
            %>
            Re-enter: <input type="password" name="reenterSignUp" value="<%= request.getAttribute("reenterLaunch") %>"> (*6-20 characters)
            <br>
            <% 
            String msg3 = (String) request.getAttribute("msgErrorReenter");
            String msgMatch = (String) request.getAttribute("msgErrorDoesNotMatch");
            if (msg3 != null) {
            %>
            <h3 style="color: red; font-family: monospace"><%= msg3 %></h3>
            <%
            }
            if (msgMatch != null) {
            %>
            <h3 style="color: red; font-family: monospace"><%= msgMatch %></h3>
            <%
            }
            %>
            Full Name: <input type="text" name="fullnameSignUp" value="<%= request.getAttribute("fullnameLaunch") %>"> (*6-20 characters)
            <br>
            <% String msg4 = (String) request.getAttribute("msgErrorFullname");
            if (msg4 != null) {
            %>
            <h3 style="color: red; font-family: monospace"><%= msg4 %></h3>
            <%
            }
            %>
            Gender: 
            Male<input type="radio" name="genderSignUp" value="male">
            Female<input type="radio" name="genderSignUp" value="female">
            <br>
            <% String msg5 = (String) request.getAttribute("msgErrorGender");
            if (msg5 != null) {
            %>
            <h3 style="color: red; font-family: monospace"><%= msg5 %></h3>
            <%
            }
            %>
            Role: 
            Admin<input type="radio" name="roleSignUp" value="admin">
            Member<input type="radio" name="roleSignUp" value="member">
            <br>
            <% String msg7 = (String) request.getAttribute("msgErrorRole");
            if (msg7 != null) {
            %>
            <h3 style="color: red; font-family: monospace"><%= msg7 %></h3>
            <%
            }
            %>
            <br>
            <% String msg6 = (String) request.getAttribute("msgDuplicate");
            if (msg6 != null) {
            %>
            <h3 style="color: red; font-family: monospace"><%= msg6 %></h3>
            <%
            }
            %>
            <input type="submit" name="btSignUpInSignUpJSP" value="Sign Up">
        </form>
    </body>
</html>
