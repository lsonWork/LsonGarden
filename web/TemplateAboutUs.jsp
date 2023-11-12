<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@page import="son.model.Account" %>
<!DOCTYPE html>
<html lang="zxx">

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
        <link rel="stylesheet" href="css/stylemade0.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <link rel="icon" href="pics/favicon.ico" type="image/x-icon">
    <body>
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <div style="overflow-y: hidden; width: 100%; position: relative;">
            <!--</header>-->
            <div style="position: fixed; z-index: 9999; top: 0; left: 0; background-color: rgba(0, 0, 0, 0.1); width: 100%; padding: 0; margin: 0; right: 0">
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
                                    <li class="active"><a href="TemplateAboutUs.jsp">About us</a></li>
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
            <div id="khoibaogomanh">
                <img class="imghiddeny" style="box-shadow: 0 10px 10px rgba(0, 0, 0, 0.2); width: 100%; height: 100%" src="pics/aboutUs.jpg" alt="alt"/>    
            </div>
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
