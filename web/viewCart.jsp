<%-- 
    Document   : viewCart.jsp
    Created on : Jun 13, 2023, 9:25:53 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="son.model.Cart" %>
<%@page import="son.model.Account" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if (session.getAttribute("account") != null) {
        Account account = (Account) session.getAttribute("account");
        %>
        <%@include file="top.jsp" %>
        <%
        String url = "main.jsp";
        String role = (String) session.getAttribute("roleToRedirrect");
        if (role.equalsIgnoreCase("Admin")) {
            url = "mainForAdmin.jsp";
        }
        %>
        <a style="color: darkcyan; text-decoration: none" href=<%= url %>>⇦ Continue shopping</a>
        <br>
        <br>
        <%
        ArrayList<Cart> list = (ArrayList<Cart>) session.getAttribute("cartToShow");
            if (!list.isEmpty()) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Name of Products</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Amount</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                for (Cart cart : list) {
                %>
                <tr>
                    <td><%= cart.getName() %></td>
                    <td style="text-align: center"><%= cart.getQuantity() %></td>
                    <td><%= cart.getPrice() + " " + "VND"%></td>
                    <td><%= cart.getAmount() + " " + "VND"%></td>
                    <td>
                        <form action="IncreaseItemInCartServlet" method="post"> 
                            <input type="hidden" name="usernameToIncrease" value="<%= account.getUsername() %>">
                            <input type="hidden" name="idPlantToIncrease" value="<%= cart.getId() %>">
                            <input type="submit" name="btIncrease" value="+">
                        </form>
                    </td>
                    <td>
                        <form action="DeleteItemInCartServlet" method="post"> 
                            <input type="hidden" name="usernameToDelete" value="<%= account.getUsername() %>">
                            <input type="hidden" name="idPlantToDelete" value="<%= cart.getId() %>">
                            <input type="submit" name="btDelete" value="-">
                        </form>
                    </td>
                    <td> 
                        <form action="RemoveItemInCartServlet" method="post">
                            <input type="submit" name="deleteItemInCart" value="X">
                            <input type="hidden" name="usernameToDeleteInCart" value="<%= account.getUsername() %>">
                            <input type="hidden" name="idPlantToDeleteInCart" value="<%= cart.getId() %>">
                        </form>
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <br>
        <%
        String msg = "";
        for (Cart cart : list) {
            msg = (String) request.getAttribute("msgErrorQuantityNotEnoughInCart" + cart.getName());
            if (msg != null) {
        %>
            <div style="color: red; font-family: monospace"><%= msg %></div>
        <%
            }
        }
        %>
        <br>
        <form action="createAnOrder.jsp">
            <input type="submit" name="btPurchase" value="Purchase">
        </form>
        <%
        } else {
        %>
        <h3 style="color: cornflowerblue; font-family: monospace">Nothing in your Cart</h3>
        <%
            }
        }
        %>
    </body>
</html>
