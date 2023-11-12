<%-- 
    Document   : orderSuccessfully
    Created on : Jun 20, 2023, 5:24:49 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="son.model.Cart" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
        <h2 style="color: cornflowerblue; font-family: monospace">Your order is received!</h2>
        <h3 style="color: cornflowerblue; font-family: monospace">Here is your bill:</h3>
        <br>
        <%
        String customerName = (String) request.getAttribute("customerName");
        String customerAddress = (String) request.getAttribute("customerAddress");
        String customerPhone = (String) request.getAttribute("customerPhone");
        %>
        Customer: <%= customerName %>
        <br>
        <br>
        Phone: <%= customerPhone %>
        <br>
        <br>
        Address: <%= customerAddress %>
        <br>
        <br>
        <%
        ArrayList<Cart> list = (ArrayList<Cart>) session.getAttribute("cartToShow");
            if (!list.isEmpty()) {
        %>
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
                <%
                for (Cart cart : list) {
                %>
                <tr>
                    <td><%= cart.getName() %></td>
                    <td><%= cart.getPrice() + " " + "VND"%></td>
                    <td style="text-align: center"><%= cart.getQuantity() %></td>
                    <td><%= cart.getAmount() + " " + "VND"%></td>
                </tr>
                <%
                }
            }
                %>
            </tbody>
        </table>
        <%
        int sum = 0;
        for (Cart cart : list) {
            sum = sum + cart.getAmount();
        }
        %>
        <h2 style="color: red; font-family: monospace">Total: <%= sum + ".VND" %></h2>
        
    </body>
</html>
