<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link rel="stylesheet" href="css/stylemade7.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <link rel="icon" href="pics/favicon.ico" type="image/x-icon">
    <body style="background-image: url(pics/64c85e7e-3ecf-4836-83c6-a7aa952f4e30.jpg);">
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <div style="overflow-y: hidden; width: 100%; position: relative; display: flex; justify-content: center; align-items: center;">
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

            <form action="AddToCartServlet" method="post">

                <div class="khung" style="position: relative; margin-top: 140px; background: white; height: 550px; width: 900px; box-shadow: 2px 2px 150px 10px pink inset; border-radius: 10px; display: flex; align-items: center;">
                    <div style=" margin-top: 0; margin-bottom: 455px; margin-left: 20px; padding: 0; position: absolute; z-index: 9998"><h5 style="margin: 0; padding: 0" class="mb-3"><a style="color: #236D5E" href="PageServlet" class="text-body"><i  style="color: #236D5E; " class="fa-solid fa-cart-arrow-down"></i> Continue shopping</a></h5></div>
                    <div style="margin-left: 65px; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.6); width: 350px; height: 380px; background-color: black; background-image: url('${requestScope.plantDetail.getLink()}'); background-size: cover; background-position: center center;"></div>
                    <div style="text-align: center; margin-left: 35px; margin-bottom: 100px; margin-top: 45px">
                        <h2 style="margin-bottom: 15px; margin-top: 20px">${requestScope.plantDetail.getName()}</h2>
                        <div style="width: 400px; height: 170px;">
                            Yongseoh? đoạn này là phần mô tả của ${requestScope.plantDetail.getName()} nhưng mà do em lười quá với cả nó không cần thiết nên em làm tất cả các cây chung 1 content ạ, kamsamita, xia xỉa grandpa Thế còn những gì em để quên nhà tôi Tôi để quên nhà em, ta để quên nhà nhau Sau bao lần ghé chơi Nếu mình không còn tiếc gì nữa thì thôi alo 1234 xia xỉa grandpa
                        </div>
                        <h6>Available: ${requestScope.plantDetail.getQuantity()}</h6>
                        <h3 style="margin-bottom: 10px">${requestScope.plantDetail.getPrice()} VND</h3>
                        <div style="margin-bottom: 15px">Quantity: <input type="number" name="quantity"></div>
                            <%
                                String msg = (String) request.getAttribute("msgErrorQuantity");
                                String msg1 = (String) request.getAttribute("msgErrorQuantityNotEnough");
                                if (msg != null) {
                            %>
                        <div style="color: red; font-family: monospace"><%= msg %></div>
                        <%
                        }
                        %>
                        <% 
                        if (msg1 != null) {
                        %>
                        <div style="color: red; font-family: monospace"><%= msg1 %></div>
                        <%
                        }
                        %>
                        <input type="hidden" name="tree" value="${requestScope.plantDetail.getId()}">
                        <div class="nutAdd" style="margin-top: 15px;"><input onmouseout="this.style.backgroundColor = '#236D5E'; this.style.color = 'whitesmoke';" onmouseover="this.style.backgroundColor = 'pink'; this.style.color = 'black';" style="width: 170px; height: 60px; font-size: 18px; background-color: #236D5E; border-radius: 5px; color: whitesmoke" type="submit" name="btAddToCart" value="Add to your cart"></div>
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
