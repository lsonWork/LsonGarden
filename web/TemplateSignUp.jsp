<%-- 
    Document   : TemplateLogin
    Created on : Jun 21, 2023, 6:08:50 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LSON's Garden</title>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
            rel="stylesheet"
            />
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"
        ></script>
    </head>
    <link rel="icon" href="pics/favicon.ico" type="image/x-icon">
    <body style="width: 100%; background-image: url(pics/bg2.png); background-size: 1520px 854px; background-repeat: repeat">
        <div class="main">
            <div class="container py-5 h-100">
                <div style="margin-top: 10px" class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <h3 class="mb-5">Create an Account</h3>
                                <form action="SignupServlet" method="post">
                                    <div class="form-outline mb-4">
                                        <input style="width: 410px; border: 0px; outline: none; margin-bottom: 15px" type="text" name="usernameSignUp" placeholder="Username" value="<%= request.getAttribute("usernameLaunch") %>"/>
                                    </div>
                                    <% String msg1 = (String) request.getAttribute("msgErrorUsername");
                                    if (msg1 != null) {
                                    %>
                                    <p style="color: red; font-weight: bold"><%= msg1 %></p>
                                    <%
                                    }
                                    %>
                                    <div class="form-outline mb-4">
                                        <input style="width: 410px; border: 0px; outline: none; margin-bottom: 15px" type="password" name="passwordSignUp" placeholder="Password" value="<%= request.getAttribute("passwordLaunch") %>"/>
                                    </div>
                                    <% String msg2 = (String) request.getAttribute("msgErrorPassword");
                                                if (msg2 != null) {
                                    %>
                                    <p style="color: red; font-weight: bold"><%= msg2 %></p>
                                    <%
                                    }
                                    %>
                                    <div class="form-outline mb-4">
                                        <input style="width: 410px; border: 0px; outline: none; margin-bottom: 15px" type="password" name="reenterSignUp" placeholder="Re-enter Password" value="<%= request.getAttribute("reenterLaunch") %>"/>
                                    </div>
                                    <% 
                                    String msg3 = (String) request.getAttribute("msgErrorReenter");
                                    String msgMatch = (String) request.getAttribute("msgErrorDoesNotMatch");
                                    if (msg3 != null) {
                                    %>
                                    <p style="color: red; font-weight: bold"><%= msg3 %></p>
                                    <%
                                    }
                                    if (msgMatch != null) {
                                    %>
                                    <p style="color: red; font-weight: bold"><%= msgMatch %></p>
                                    <%
                                    }
                                    %>
                                    <div class="form-outline" style="margin-bottom: 20px">
                                        <input style="width: 410px; border: 0px; outline: none; margin-bottom: 15px" type="text" name="fullnameSignUp" placeholder="Fullname" value="<%= request.getAttribute("fullnameLaunch") %>"/>
                                    </div>
                                    <% 
                                    String msg4 = (String) request.getAttribute("msgErrorFullname");
                                    if (msg4 != null) {
                                    %>
                                    <p style="color: red; font-weight: bold"><%= msg4 %></p>
                                    <%
                                    }
                                    %>
                                    <div class="form-outline" style="margin-bottom: 20px">
                                        <input style="width: 410px; border: 0px; outline: none; margin-bottom: 15px" type="email" name="mailSignUp" placeholder="E-mail" required=""/>
                                    </div> 
                                    <% 
                                    String msg8 = (String) request.getAttribute("msgErrorMail");
                                    if (msg8 != null) {
                                    %>
                                    <p style="color: red; font-weight: bold"><%= msg8 %></p>
                                    <%
                                    }
                                    %>
                                    <div class="form-outline mb-4">
                                        <p style="display: inline; margin-right: 5px">Gender:</p>
                                        <p style="display: inline; margin-right: 5px">Male</p>
                                        <input class="form-check-input" type="radio" name="genderSignUp" value="male"/>
                                        <p style="display: inline; margin-right: 5px">Female</p>
                                        <input class="form-check-input" type="radio" name="genderSignUp" value="female"/>
                                    </div>
                                    <% String msg5 = (String) request.getAttribute("msgErrorGender");
                                    if (msg5 != null) {
                                    %>
                                    <p style="color: red; font-weight: bold"><%= msg5 %></p>
                                    <%
                                    }
                                    %>
                                    <hr class="my-4">
                                    <% 
                                    String msg6 = (String) request.getAttribute("msgDuplicate");
                                    if (msg6 != null) {
                                    %>
                                    <p style="color: red; font-weight: bold"><%= msg6 %></p>
                                    <%
                                    }
                                    %>
                                    <button name="btSignUpInSignUpJSP" class="btn btn-primary btn-lg btn-block" style="background-color: #236D5E" type="submit">Sign Up</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
