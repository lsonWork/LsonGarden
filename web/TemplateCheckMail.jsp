<%-- 
    Document   : TemplateLogin
    Created on : Jun 21, 2023, 6:08:50 PM
    Author     : pc
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                <h3>Check Mail</h3>
                                <br>
                                We have sent a code to your email, please check your mailbox and enter to the box below.
                                <br>
                                <br>
                                <form action="CaptchaServlet" method="post">
                                    <div>
                                        <input type="text" name="captcha">
                                    </div>
                                    <br>
                                    <h6 style="color: red; margin-bottom: 15px">${requestScope.captchaNotMatch != null ? captchaNotMatch : ""}</h6>
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
