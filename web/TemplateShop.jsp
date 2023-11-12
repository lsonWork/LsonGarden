<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="son.model.Plant" %>
<%@page import="java.util.ArrayList" %>
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
        <link rel="stylesheet" href="css/stylemade3.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <script>
            function change() {
                document.getElementById("fr").submit();
            }
        </script>
        <style>
            .buttonn {
                display: inline-block;
                width: 30px;
                height: 40px;
                /*padding: 10px 20px;*/
                background-color: #236D5E;
                color: white;
                text-decoration: none;
                border-radius: 4px;
            }
            .nist a:hover {
                background-color: whitesmoke;
                color: #236D5E;
            }
            .nist.active a, .nist.active a.page-link {
                background: whitesmoke;
                color: #236D5E;
            }
        </style>
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
                                        <li class="active"><a href="PageServlet">Shop</a></li>
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

        <%
        ArrayList<Plant> listPlant = (ArrayList<Plant>) session.getAttribute("listPlant");
        ArrayList<Plant> list = (ArrayList<Plant>) session.getAttribute("listToShow");
        %>

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <div style="position: relative;" class="col-lg-3">
                        <div style="width: 100%; height: 100%; margin-top: 34px" class="hero__item set-bg">
                            <img src="pics/forShop2.jpg" style="border-radius: 5px; background-size: cover; height: 432px; width: 236px; margin-top: 79px; box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.5);" alt="alt"/>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="PageServlet">
                                    <input style="border-radius: 50px;" type="text" value="${searchValueByName != null ? searchValueByName : ""}" name="searchValueByName" placeholder="Yongseoh! What are you looking for?">
                                    <button style="border-radius: 50px" type="submit" class="site-btn">SEARCH</button>
                                </form>
                            </div>
                            <div class="hero__search__phone">
                                <div style="margin-top: 20px" class="hero__search__phone__text">
                                    <h5>Welcome, <%= (String) session.getAttribute("genderToDisplay") + ((String) session.getAttribute("fullnameToDisplay")).toUpperCase() + "!" %></h5>
                                    <div style="text-align: end"><span><%= (String) session.getAttribute("roleToRedirrect") %></span></div>
                                </div>
                            </div>
                        </div>
                        <div style="position: relative" class="hero__item set-bg">
                            <img style="border-radius: 5px; height: 100%; box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.5);" src="pics/forShop1.jpg" alt="alt"/>
                            <img style="border-radius: 5px; height: 100%; position: absolute; margin-left: 540px; box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.5);" src="pics/forShop3.jpg" alt=""/>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="categories">
            <div class="container">
                <div class="row">

                </div>
            </div>
        </section>
        <!-- Categories Section End -->

        <c:set var="a" value="${requestScope.categorisePicked}"/>
        <c:set var="b" value="${requestScope.pricePicked}"/>
        <c:set var="c" value="${requestScope.sortPicked}"/>
        <!-- Featured Section Begin -->
        <section class="featured spad">
            <div class="container">

                <div class="row">
                    <div style="margin-bottom: 25px" class="col-lg-12">
                        <div class="section-title">
                            <h2>Available</h2>
                        </div>
                        <%--
                        String categorise = (String) request.getAttribute("categorisePicked");
                        String price = (String) request.getAttribute("pricePicked");
                        --%>
                        <form id="fr" action="PageServlet" method="get">
                            <div style="display: flex; align-items: center">

                                <div style="font-weight: bold; margin-right: 15px">Categorise:</div>
                                <select name="categorise" onchange="change()">
                                    <option ${a == 'All' ? 'selected' : ''} value="All">All</option>
                                    <option ${a == '1' ? 'selected' : ''} value="1">Cây</option>
                                    <option ${a == '0' ? 'selected' : ''} value="0">Hoa</option>
                                </select>
                                <div style="margin-right: 75px"></div>

                                <div style="font-weight: bold; margin-right: 15px">Price:</div>
                                <select name="price" onchange="change()">
                                    <option ${b == 'All' ? 'selected' : ''} value="All">All</option>
                                    <option ${b == '0' ? 'selected' : ''} value="0">0 ~ 100.000 VND</option>
                                    <option ${b == '1' ? 'selected' : ''} value="1">100.000 VND ~ 1.000.000.000 VND</option>
                                </select>
                                <div style="margin-right: 75px"></div>

                                <div style="font-weight: bold; margin-right: 15px">Sort by Price</div>
                                <select name="sort" onchange="change()">
                                    <option ${c == 'None' ? 'selected' : ''} value="None">None</option>
                                    <option ${c == '0' ? 'selected' : ''} value="0">Low to High</option>
                                    <option ${c == '1' ? 'selected' : ''} value="1">High to Low</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>

                <hr> 
                <div class="row featured__filter">
                    <c:forEach items="${listP}" var="p">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                            <div class="featured__item">
                                <div style="border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);" class="featured__item__pic set-bg" data-setbg=${p.getLink()}>
                                    <ul class="featured__item__pic__hover">
                                        <li><a href="AddToCartServlet?tree=${p.getId()}&quantity=1"><i class="fa-solid fa-plus"></i></a></li>
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <form action="ShowDetailServlet" method="post">
                                        <input style="border: none; background: none;" type="submit" name="name" value="${p.getName()}">
                                        <input type="hidden" name="idOfProductDetail" value="${p.getId()}">
                                    </form>
                                    <h5>${p.getPrice()} VND</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div style="display: flex; align-items: center">
                    <div style="margin-right: 10px">Page: </div>
                    <div><a class="nist" style="margin-right: 10px; margin-left: 10px; color: #236D5E" href="PageServlet?index=${index - 1}&categorise=${requestScope.categorisePicked}&price=${requestScope.pricePicked}&sort=${requestScope.sortPicked}&searchValueByName=${requestScope.searchValueByName != null ? requestScope.searchValueByName : ""}">Previous</a></div>
                    <c:forEach begin="1" end="${endP}" var="i">
                        <li class="nist ${index == i ? "active" : ""}" style="display: flex; justify-content: center; list-style: none; margin-right: 5px"><a style="display: flex; align-items: center" class="buttonn" href="PageServlet?index=${i}&categorise=${requestScope.categorisePicked}&price=${requestScope.pricePicked}&sort=${requestScope.sortPicked}&searchValueByName=${requestScope.searchValueByName != null ? requestScope.searchValueByName : ""}"><div style="margin-left: 10px">${i}</div></a></li>
                            </c:forEach>
                    <div><a class="nist" style="margin-left: 5px; color: #236D5E"href="PageServlet?index=${index + 1}&categorise=${requestScope.categorisePicked}&price=${requestScope.pricePicked}&sort=${requestScope.sortPicked}&searchValueByName=${requestScope.searchValueByName != null ? requestScope.searchValueByName : ""}">Next</a></div>
                </div>

                <hr>
            </div>
        </section>
        <!-- Featured Section End -->

        <!-- Banner Begin -->
        <div class="banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="banner__pic">
                            <img style="box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.5)" src="pics/banner1.png" alt="">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="banner__pic">
                            <img style="box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.5)" src="pics/banner2.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner End -->

        <!-- Latest Product Section Begin -->

        <!-- Latest Product Section End -->

        <!-- Blog Section Begin -->
        <section class="from-blog spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title from-blog__title">
                            <h2>From The Blog</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img style="height: 210px; width: 420px; box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.5)" class="blog" src="pics/greenplants.png" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> January 15, 2023</li>
                                    <li><i class="fa fa-comment-o"></i> 15</li>
                                </ul>
                                <h5><a href="https://www.bachhoaxanh.com/kinh-nghiem-hay/nhung-cau-noi-hay-ve-cuoc-song-binh-yen-giup-an-yen-yeu-doi-1456985">Một buổi sáng bình yên cùng những người bạn "xanh"</a></h5>
                                <p>Nhiều vấn đề trong công việc và cuộc sống khiến mọi người căng thẳng, mệt mỏi? Có một loại cây giúp cải thiện tâm trạng rất tốt là lan ý đấy </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img style="height: 210px; width: 420px; box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.5)" class="blog" src="pics/solid.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> May 20, 2023</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                                <h5><a href="https://sfarm.vn/9-cach-cai-tao-dat-bac-mau-don-gian-hieu-qua/">5 cách giúp giữ đất luôn lý tưởng</a></h5>
                                <p>Mức giữ nước: Đất cần có có khả năng giữ và nhả ra lượng nước đủ để vùng rễ của cây giữ được độ ẩm giữa các lần tới cây trong ngày.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img style="height: 210px; width: 420px; box-shadow: 0px 3px 10px 3px rgba(0, 0, 0, 0.5)" class="blog" src="pics/muaHe.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> May 27, 2023</li>
                                    <li><i class="fa fa-comment-o"></i> 27</li>
                                </ul>
                                <h5><a href="https://homedecorplus.vn/nhung-cay-canh-trong-mua-he-607375.html">10 loại cây dễ trồng, thích hợp nhất cho mùa hè</a></h5>
                                <p>Thời tiết mùa hè nắng nóng gay gắt, nhiệt độ tăng cao như hút đi sức lực của con người cũng như cây cối làm cho nhiều loài hoa quá tải và kém sắc.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Section End -->

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