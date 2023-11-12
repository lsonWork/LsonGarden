<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <!-- Header Section End -->



        <div class="h-100 h-custom" style="margin-top: 110px; background-image: url(pics/backgroundviewcart.jpg); background-size: 500px">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card">
                            <div style="box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.3); width: 100%; border-radius: 5px">
                                <div style="text-align: center; margin-top: 20px; font-weight: bold"><h3 style="color: #236D5E">Your order has been successfully created!</h3></div>
                                <div style="text-align: center; color: #236D5E; margin-top: 10px">Thankyou for choosing us <i style="color: red" class="fa-solid fa-heart"></i>
                                    <br>
                                    <br>
                                    <div style="height: 1.5px; background-color: #236D5E; width: 350px; margin-left: 400px"></div>
                                </div>
                                <div style="margin-left: 25px; margin-top: 10px">Here's your order </div>
                                <div style="margin-left: 25px; margin-top: 10px">Customer's name: ${requestScope.customerName}</div>
                                <div style="margin-left: 25px; margin-top: 10px">Phone number: ${requestScope.customerPhone}</div>
                                <div style="margin-left: 25px; margin-top: 10px">Address: ${requestScope.customerAddress}</div>
                                <div style="margin-left: 25px; margin-top: 10px;">
                                    <table border="1">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.cartToShow}" var="s">
                                                <tr>
                                                    <td style="width: 150px">${s.getName()}</td>
                                                    <td style="width: 150px">${s.getPrice()}</td>
                                                    <td style="width: 150px">${s.getQuantity()}</td>
                                                    <td style="width: 150px">${s.getAmount()}</td>
                                                </tr>
                                            </c:forEach>  
                                        </tbody>
                                    </table>
                                </div>
                                <div style="margin-left: 25px; margin-top: 10px;">+ 20000 VND (Shipping)</div>
                                <c:set var="sumOfBill" value="0"/>
                                <c:forEach items="${sessionScope.cartToShow}" var="s">
                                    <c:set var="sumOfBill" value="${sumOfBill + s.getAmount()}"/>
                                </c:forEach>
                                <div style="margin-left: 25px; margin-top: 10px; margin-bottom: 25px; font-size: 20px; font-weight: bold">Total: ${sumOfBill + 20000} VND</div>
                                <br>
                                <div style="height: 1.5px; background-color: #236D5E; width: 350px; margin-left: 400px"></div>
                                <br>
                                <div style="text-align: center; color: #236D5E;">Kamsamita, xia xỉa grandpa <i style="color: red" class="fa-solid fa-heart"></i>
                                    <br>
                                    <br>
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