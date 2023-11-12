<%-- 
    Document   : TemplateAdminPage
    Created on : Jun 23, 2023, 11:05:45 PM
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

        <div style="margin-top: 170px; text-align: center;">
            <p style="font-weight: bold; font-size: 25px">Accounts in your Database</p>
        </div>

        <h6 style="margin-left: 312px; margin-bottom: 20px; color: #236D5E"><a href="TemplateAdminMainControllerPage.jsp" class="text-body"><i class="fa-solid fa-chevron-left"></i>Back to Main Controller Page</a></h6>

        <div style="margin-left: 315px; margin-top: 20px; color: #236D5E">${msgSignupSuccessfully != null ? msgSignupSuccessfully : ""}</div>
        <c:if test="${not empty sessionScope.msgErrorUpdateAccount}">
            <div style="margin-left: 315px; margin-top: 20px; color: #236D5E">${sessionScope.msgErrorUpdateAccount}</div>
            <% session.removeAttribute("msgErrorUpdateAccount"); %>
        </c:if>
        <div style="margin-top: 20px; margin-left: 312px; width: 60%">
            <table class="table">
                <thead class="thead-dark">
                    <tr style="text-align: center">
                        <th scope="col">Username</th>
                        <th scope="col">Password</th>
                        <th scope="col">Fullname</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Role</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listAccount}" var="s">
                        <tr style="text-align: center">
                            <td>${s.getUsername()}</td>
                            <td>${s.getPassword()}</td>
                            <td>${s.getFullname()}</td>
                            <td>${s.isGender() == true ? "Male" : "Female"}</td>
                            <c:if test="${s.getRole() == 0}">
                                <td>Member</td>
                            </c:if> 
                            <c:if test="${s.getRole() == 1}">
                                <td>Admin</td>
                            </c:if> 
                            <c:if test="${s.getRole() == 2}">
                                <td>Seller</td>
                            </c:if> 
                            
                            <td> 
                                <form action="DeleteAccountInDatabase" method="post">
                                    <button type="submit" class="submit-button" style=" border-radius: 5px">
                                        <i class="fa-solid fa-trash submit-icon"></i>
                                    </button>
                                    <input type="hidden" name="usernameToDelete" value="${s.getUsername()}">
                                </form>
                            </td>
                            <td>
                                <form style="text-align: center" action="GoToAccountManagement2" method="post">
                                    <button type="submit" name="updateItemInWareHouse" class="submit-button" style=" border-radius: 5px">
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                    <input type="hidden" name="usernameToUpdate" value="${s.getUsername()}">
                                    <input type="hidden" name="passwordToUpdate" value="${s.getPassword()}">
                                    <input type="hidden" name="fullnameToUpdate" value="${s.getFullname()}"> 
                                    <input type="hidden" name="genderToUpdate" value="${s.isGender()}"> 
                                    <input type="hidden" name="roleToUpdate" value="${s.getRole()}">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>                   

                </tbody>
            </table>
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
