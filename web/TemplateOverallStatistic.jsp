<%-- 
    Document   : TemplateAdminPage
    Created on : Jun 23, 2023, 11:05:45 PM
    Author     : pc
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
        <link rel="stylesheet" href="css/stylemade8.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <style>
            .nutdieuphoi:hover {
                background: #8BC6BB;
                color: white;
            }

            .chartt {
                display: flex;
                align-items: end;
                margin: 36px auto 0 auto;
                padding: 32px 0;
                height: 500px;
                background-color: white;
                margin-top: 0
            }

            .chart-layout_item {
                width: 100px;
                margin-right: 10px;
                display: flex;
                color: #fff;
                text-align: center;
                align-items: end;
                align-content:  center;
                height: var(--percent);
                background-color: #8BC6BB;
                position: relative;
            }

            .chart-layout {
                /*width: 300px;*/
                /*                display: flex;*/
                position: relative;
                align-items: end;
                margin: 36px auto 0 auto;
                padding: 0;
                height: 570px;
                background-color: #fff;
            }
        </style>
    </head>
    <link rel="icon" href="pics/favicon.ico" type="image/x-icon">
    <body>
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
        <h6 style="margin-left: 140px; margin-top: 150px; color: #236D5E"><a href="TemplateAdminMainControllerPage.jsp" class="text-body"><i class="fa-solid fa-chevron-left"></i>Back to Main Controller Page</a></h6>
        <div style="margin-top: 25px; display: flex; justify-content: space-around">
            <div style="width: 200px; height: 70px; background-color: white; border: 1px solid #000; border-radius: 10px; display: flex; justify-content: center; align-items: center;">In Stock: <p style="margin: 0; margin-left: 5px; font-weight: bold; color: ${allProductsInStock > 10 ? '#236D5E' : 'red'}"> ${allProductsInStock}</p></div>
            <div style="width: 200px; height: 70px; background-color: white; border: 1px solid #000; border-radius: 10px; display: flex; justify-content: center; align-items: center;">Sold: <p style="margin: 0; margin-left: 5px; font-weight: bold; color: #236D5E"> ${allSoldProducts}</p></div>
            <div style="width: 300px; height: 70px; background-color: white; border: 1px solid #000; border-radius: 10px; display: flex; justify-content: center; align-items: center;">Revenue: <p style="margin: 0; margin-left: 5px; font-weight: bold; color: #236D5E"> ${revenue} VND</p></div>
        </div>

        <div style="border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); width: 350px; background-color: white; margin-top: 30px; margin-left: 137px; background-color: white; border: 1px solid black;">
            <div style="margin-bottom: 10px; font-weight: bold; color: #236D5E; padding: 15px 15px 0 15px">
                TOP3 Best Sellers:
            </div>
            <div style="padding: 0 15px 15px 15px">
                <c:forEach items="${requestScope.listTop}" var="s">
                    <div style="display: flex">
                        <div>${s.getName()}:</div>
                        <div style="margin-left: 10px; color: #236D5E; font-weight: bold">${s.getQuantity()} sản phẩm</div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <form action="ShowOrdersServlet" method="get">
            <button type="submit" value="" style="border-radius: 5px; display: flex; align-content: center; align-items: center; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); width: 150px; height: 50px; background-color: white; margin-top: 30px; margin-left: 137px; background-color: white; border: 1px solid black;" ><i style="margin-right: 10px" class="fa-solid fa-box-open"></i>Show Orders</button>
        </form>


        <div style="display: flex; margin: 0">
            <c:forEach items="${listStatistic}" var="s" >
                <div class="chart-layout">
                    <div class="chartt">
                        <div class="chart-layout_item" style="--percent: ${((s.getSold()) / (s.getfQuantity())) * 100}%; color: black">
                            <div style="position: absolute; bottom: 0; margin-left: 28px"><fmt:formatNumber value="${((s.getSold()) / (s.getfQuantity())) * 100}" pattern="#0.00" var="formattedResult" />${formattedResult} %</div>
                        </div>
                    </div>
                    <div style="width: 100px; height: 20px; text-align: center; position: absolute; bottom: 0; margin-bottom: 45px">${s.getName()}</div>
                </div>
            </c:forEach>
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
