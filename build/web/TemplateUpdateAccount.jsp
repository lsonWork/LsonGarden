<%-- 
    Document   : TemplateLogin
    Created on : Jun 21, 2023, 6:08:50 PM
    Author     : pc
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="son.model.Account" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>LSON's Garden</title>


        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/stylemade6.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <!-- Font Awesome -->
        <!--        <link
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
                    rel="stylesheet"
                    />
                 Google Fonts 
                <link
                    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
                    rel="stylesheet"
                    />
                 MDB 
                <link
                    href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
                    rel="stylesheet"
                    />
                 MDB 
                <script
                    type="text/javascript"
                    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"
                ></script>-->
    </head>
    <link rel="icon" href="pics/favicon.ico" type="image/x-icon">
    <body style="overflow-x: hidden; background: #C9D6CC; height: 1000px">
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <div style="width: 100%; position: relative;">
            <!--</header>-->
            <div style="position: fixed; z-index: 9999; top: 0; left: 0; background-color: #8BC6BB; width: 100%; padding: 0; margin: 0; right: 0">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="header__logo">
                                <a class="forLogo" href="TemplateIndex.jsp">
                                    <img style="width: 35%; border-radius: 50%; margin-left: 40px" src="img/logoShop.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div style="display: flex; align-items: center;" class="col-lg-6">
                            <nav class="header__menu">
                                <ul>
                                    <li><a href="TemplateIndex.jsp">Home</a></li>
                                    <li><a href="PageServlet">Shop</a></li>
                                    <li><a href="TemplateSupport.jsp">Support</a></li>
                                    <li><a href="TemplateContact.jsp">Contact</a></li>
                                    <li><a href="TemplateAboutUs.jsp">About us</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div style="display: flex; align-items: center; justify-content: space-around" class="col-lg-3">
                            <div class="header__cart">
                                <ul>
                                    <li><a class="fixhover" href="ViewCartServlet"><i style="font-size: 30px; margin-right: 10px" class="fa-solid fa-cart-shopping"></i></a></li>
                                            <%
                                            String checkIsAdmin = (String)session.getAttribute("roleToRedirrect");
                                            if (session.getAttribute("account") == null) { //nếu chưa có account thì có login, else logout (admin)
                                            %>
                                    <div class="header__top__right__language">
                                        <li><a class="fixhover"><i style="font-size: 30px" class="fa-solid fa-seedling"></i></a></li>                                    
                                        <ul>
                                            <li><a style="color: whitesmoke; font-size: 12px; margin-left: 29px" href="TemplateLogin.jsp">Login</a></li>
                                        </ul>
                                    </div>
                                    <%
                                    } else if (checkIsAdmin.equalsIgnoreCase("Admin") || checkIsAdmin.equalsIgnoreCase("Seller")) {
                                    %>
                                    <div class="header__top__right__language">
                                        <li><a class="fixhover"><i style="font-size: 30px" class="fa-solid fa-seedling"></i></a></li>                                    
                                        <ul>
                                            <li><a style="color: whitesmoke; font-size: 12px; margin-left: 27px" href="TemplateAdminMainControllerPage.jsp">Admin</a></li>
                                            <li><a style="color: whitesmoke; font-size: 12px; margin-left: 23px" href="LogoutServlet">Logout</a></li>
                                        </ul>
                                    </div>      
                                    <%
                                    } else {
                                    %>
                                    <div class="header__top__right__language">
                                        <li><a class="fixhover"><i style="font-size: 30px" class="fa-solid fa-seedling"></i></a></li>                                    
                                        <ul>
                                            <li><a style="color: whitesmoke; font-size: 12px; margin-left: 23px" href="LogoutServlet">Logout</a></li>
                                        </ul>
                                    </div>      
                                    <%
                                    }
                                    %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--</header>-->
        </div>

        <div style="margin-top: 170px; margin-left: 380px">
            <a style="color: black;" href="GoToAccountManagement"><i class="fa-solid fa-chevron-left"></i> Back to Account Management</a>
        </div>                        

        <div>
            <form action="UpdateAccountInDatabase" method="post">
                <div class="container py-5 h-100" style="padding-top: 15px">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div class="card shadow-2-strong" style="border-radius: 1rem;">
                                <div class="card-body p-5 text-center">

                                    <h3 style="font-size: 25px; text-align: center" class="mb-5">Update account in Database</h3>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="typePasswordX-2" class="form-control form-control-lg" value="${requestScope.passwordLa}" name="newPassword" required/>
                                        <label class="form-label" for="typePasswordX-2">Password</label>
                                    </div>

                                    <div class="form-outline" style="margin-bottom: 20px">
                                        <input pattern="^[A-Za-z\sÀ-ỹ]+$" type="text" id="typePasswordX-2" class="form-control form-control-lg" value="${requestScope.fullnameLa}" name="newFullname" required/>
                                        <label class="form-label" for="typePasswordX-2">FullName</label>
                                    </div>

                                    <div class="form-outline" style="margin-bottom: 20px">
                                        <select name="newGender">
                                            <option value="1" ${requestScope.genderLa == true ? 'selected' : ''}>Male</option>
                                            <option value="0" ${requestScope.genderLa == false ? 'selected' : ''}>Female</option>
                                        </select>
                                    </div>
                                    <br>
                                    <br>
                                    <br>
                                    <div class="form-outline" style="margin-bottom: 20px">
                                        <select name="newRole">
                                            <c:if test="${roleLa == 0}">
                                                <option value="0" selected>Member</option>
                                                <option value="1">Admin</option>
                                                <option value="2">Seller</option>
                                            </c:if> 
                                            <c:if test="${roleLa == 1}">
                                                <option value="0">Member</option>
                                                <option value="1" selected>Admin</option>
                                                <option value="2">Seller</option>
                                            </c:if>
                                            <c:if test="${roleLa == 2}">
                                                <option value="0">Member</option>
                                                <option value="1">Admin</option>
                                                <option value="2" selected>Seller</option>
                                            </c:if> 
                                        </select>
                                    </div>
                                    <br>

                                    <hr class="my-4">
                                    <button class="btn btn-primary btn-lg btn-block" style="background-color: #236D5E" type="submit">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
