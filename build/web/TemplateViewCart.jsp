<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@page import="son.model.Cart" %>
<%@page import="son.model.Account" %>
<%@page import="java.util.ArrayList" %>
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
        <link rel="stylesheet" href="css/stylemade4.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <link rel="icon" href="pics/favicon.ico" type="image/x-icon">
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
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
                                    <li><a class="fixhover active" href="ViewCartServlet"><i style="font-size: 30px; margin-right: 10px" class="fa-solid fa-cart-shopping"></i></a></li>
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
        <!-- Header Section End -->



        <div class="h-100 h-custom" style="margin-top: 120px; background-image: url(pics/backgroundviewcart.jpg); background-size: 500px">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card">
                            <div style="box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.3)" class="card-body p-4">

                                <div class="row">

                                    <div class="col-lg-7">
                                        <h5 class="mb-3"><a href="PageServlet" class="text-body"><i class="fa-solid fa-cart-arrow-down"></i>
                                                Continue shopping</a></h5>
                                        <hr>

                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <div>
                                                <p class="mb-1">Your Cart:</p>
                                                <p class="mb-0">${sessionScope.cartToShow.size()} products</p>
                                            </div>
                                        </div>
                                            <div><a href="ShowHistoryServlet" style="color: #236D5E; margin-left: 520px; margin-bottom: 5px">View history</a></div>
                                        <c:if test="${sessionScope.cartToShow.isEmpty()}">
                                            <p>Nothing in your Cart</p>
                                        </c:if>

                                        <c:forEach items="${sessionScope.cartToShow}" var="s">
                                            <div class="card mb-3">
                                                <div class="card-body">
                                                    <div style="display: flex">
                                                        <div class="d-flex flex-row align-items-center">
                                                            <div style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.6); border-radius: 50%; width: 75px; height: 75px; background-image: url('${s.getLink()}'); background-size: cover; background-position: center">
                                                            </div>
                                                            <div style="margin-left: 25px; width: 140px" class="ms-3">
                                                                <h6>${s.getName()}</h6>
                                                            </div>
                                                        </div>
                                                        <div style="margin-left: 25px; display: flex; align-items: center">
                                                            <a style="color: #236D5E" href="IncreaseItemInCartServlet?usernameToIncrease=${sessionScope.account.getUsername()}&idPlantToIncrease=${s.getId()}"><i class="fa-solid fa-plus"></i></a>
                                                        </div>
                                                        <div style="margin-left: 25px; width: 45px; margin-top: 24px">
                                                            <p style="margin: 0; text-align: center">${s.getQuantity()}</p>
                                                        </div>
                                                        <div style="margin-left: 25px; display: flex; align-items: center">
                                                            <a style="color: #236D5E" href="DeleteItemInCartServlet?usernameToDelete=${sessionScope.account.getUsername()}&idPlantToDelete=${s.getId()}"><i class="fa-solid fa-minus"></i></a>
                                                        </div>
                                                        <div style="margin-left: 25px; margin-top: 26px; width: 150px">
                                                            <h5 class="mb-0">${s.getAmount()} VND</h5>
                                                        </div>
                                                        <div style="margin-top: 25px; margin-right: 20px">
                                                            <a style="color: #236D5E" href="RemoveItemInCartServlet?usernameToDeleteInCart=${sessionScope.account.getUsername()}&idPlantToDeleteInCart=${s.getId()}"><i class="fas fa-trash-alt"></i></a>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </c:forEach>
                                        <%
                                        ArrayList<Cart> list = (ArrayList<Cart>) session.getAttribute("cartToShow");
                                        String msg = "";
                                        for (Cart cart : list) {
                                        msg = (String) request.getAttribute("msgErrorQuantityNotEnoughInCart" + cart.getName());
                                        if (msg != null) {
                                        %>
                                        <div style="color: red;"><%= msg %></div>
                                        <%
                                            }
                                        }
                                        %>

                                    </div>
                                    <div class="col-lg-5">

                                        <div class="card bg-primary text-white rounded-3">
                                            <div class="card-body" style="background-color: #8BC6BB">
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <h4 class="mb-0">Check-out</h4>
                                                </div>

                                                <p class="small mb-2">Card type</p>
                                                <a type="submit" class="text-white"><i
                                                        class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                                <a type="submit" class="text-white"><i
                                                        class="fab fa-cc-visa fa-2x me-2"></i></a>
                                                <a type="submit" class="text-white"><i
                                                        class="fab fa-cc-amex fa-2x me-2"></i></a>
                                                <a type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>

                                                <form  action="PurchaseServlet" method="post" class="mt-4">
                                                    <div class="form-outline form-white mb-4">
                                                        <input type="text" name="customerName" class="form-control form-control-lg"
                                                               placeholder="Your name" required/>
                                                    </div>

                                                    <div class="form-outline form-white mb-4">
                                                        <input type="text" name="customerPhone" class="form-control form-control-lg"
                                                               placeholder="Your phone" required pattern="[0-9]{10,12}" minlength="10" maxlength="12"/>
                                                    </div>

                                                    <div class="form-outline form-white mb-4">
                                                        <input type="text" name="customerAddress" class="form-control form-control-lg"
                                                               placeholder="Your address" required/>
                                                    </div>

                                                    <hr class="my-4">

                                                    <div class="d-flex justify-content-between">
                                                        <p class="mb-2">Subtotal</p>
                                                        <c:set var="sum" value="0"/>
                                                        <c:forEach items="${sessionScope.cartToShow}" var="s">
                                                            <c:set var="sum" value="${sum + s.getAmount()}"/>
                                                        </c:forEach>
                                                        <p class="mb-2">${sum} VND</p>
                                                    </div>

                                                    <div class="d-flex justify-content-between">
                                                        <p class="mb-2">Shipping</p>
                                                        <p class="mb-2">20000 VND</p>
                                                    </div>

                                                    <div class="d-flex justify-content-between mb-4">
                                                        <p class="mb-2">Total(Incl. taxes 0%)</p>
                                                        <p class="mb-2">${sum + 20000} VND</p>
                                                    </div>

                                                    <button type="submit" class="btn btn-info btn-block btn-lg">
                                                        <span>Purchase </span><i style="margin-left: 5px" class="fa-solid fa-cash-register"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer Section Begin -->
            <footer class="footer spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="footer__about">
                                <div class="footer__about__logo">
                                    <a href="./index.html"><img src="img/logo.png" alt=""></a>
                                </div>
                                <ul>
                                    <li>Address: sữa Tùng Dương, thôn 3, Thạch Hòa, Thạch Thất</li>
                                    <li>Phone: 0971208219</li>
                                    <li>Email: SonLAHE170211@fpt.edu.vn</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                            <div class="footer__widget">
                                <h6>Useful Links</h6>
                                <ul>
                                    <li><a href="TemplateIndex.jsp">Home</a></li>
                                    <li><a href="TemplateShop.jsp">Our Shop</a></li>
                                    <li><a href="TemplateSupport.jsp">Support</a></li>
                                    <li><a href="TemplateContact.jsp">Contact</a></li>
                                    <li><a href="TemplateAboutUs.jsp">About us</a></li>
                                </ul>
                                <ul>
                                    <li><a href="#">Assignment</a></li>
                                    <li><a href="#">PRJ301</a></li>
                                    <li><a href="#">Thầy ơi, cho em điểm cao đi</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="footer__widget">
                                <h6>Join Our Newsletter Now</h6>
                                <p>Get E-mail updates about our latest shop and special offers.</p>
                                <form>
                                    <input style="padding-right: 50px; color: grey" type="text" placeholder="Mail này không nhập được đâu">
                                    <button type="submit" class="site-btn">Subscribe</button>
                                </form>
                                <div class="footer__widget__social">
                                    <a href="https://www.facebook.com/traadaooo/"><i class="fa-brands fa-facebook"></i></a>
                                    <a href="https://www.instagram.com/tra_____dao/"><i class="fa-brands fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer__copyright">
                                <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Lson's Garden <i class="fa fa-heart" aria-hidden="true"></i> by Le Anh Son (HE170211)
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                                <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
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