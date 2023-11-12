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
    <body style="width: 100%; background-image: url(pics/bg2.png); background-size: 1520px 854px; background-repeat: no-repeat">
        <div class="main">
            <div class="container py-5 h-100">
                <div style="margin-top: 50px" class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <h3 class="mb-5">Sign in</h3>

                                <form action="LoginServlet" method="post">
                                    <div class="form-outline mb-4">
                                        <input type="text" id="typeEmailX-2" class="form-control form-control-lg" name="usernameLogin"/>
                                        <label class="form-label" for="typeEmailX-2">Username</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="typePasswordX-2" class="form-control form-control-lg" name="passwordLogin"/>
                                        <label class="form-label" for="typePasswordX-2">Password</label>
                                    </div>
                                    <button class="btn btn-primary btn-lg btn-block" style="background-color: #236D5E" type="submit">Login</button>
                                </form>
                                <% 
                                String msgLoginFailed = (String) request.getAttribute("msgLoginFailed");
                                if (msgLoginFailed != null) {
                                %>
                                <br>
                                <p style="color: red; font-weight: bold"><%= msgLoginFailed %></p>
                                <%
                                }
                                %>
                                <hr class="my-4">
                                You don't have any account? Create one
                                <br>
                                <br>
                                <a href="TemplateForgetPassword.jsp">Forgot your password?</a>
                                <br>
                                <br>
                                <% String msgSignupSuccessfully = (String) request.getAttribute("msgSignupSuccessfully");
                                if (msgSignupSuccessfully != null) {
                                %>
                                <p style="color: cornflowerblue; font-weight: bold"><%= msgSignupSuccessfully %></p>
                                <%
                                }
                                %>
                                <% String msgErrorMatchPassword = (String) request.getAttribute("msgErrorMatchPassword");
                                if (msgErrorMatchPassword != null) {
                                %>
                                <p style="color: cornflowerblue; font-weight: bold"><%= msgErrorMatchPassword %></p>
                                <%
                                }
                                %>
                                <form action="SignupServlet" method="get">
                                    <button class="btn btn-lg btn-block btn-primary" style="background-color: #000000;"
                                            type="submit">Create An Account</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
