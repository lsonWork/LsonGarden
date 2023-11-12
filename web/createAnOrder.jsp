<%-- 
    Document   : createAnOrder
    Created on : Jun 20, 2023, 5:03:36 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="top.jsp" %>
        <a style="color: darkcyan; text-decoration: none" href="ViewCartServlet">⇦ Back to Your Cart</a>
        <h3 style="color: cornflowerblue; font-family: monospace">Create an Order</h3>
        <form action="PurchaseServlet" method="post">
            Customer's name: <input type="text" name="customerName">
            <br>
            Customer's phone: <input type="text" name="customerPhone" pattern="[0-9]{10,12}">
            <br>
            Customer's address: <input type="text" name="customerAddress">
            <br>
            <input type="submit" name="btBuy" value="Buy">
        </form>
    </body>
</html>
