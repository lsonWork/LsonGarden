<%-- 
    Document   : midHeader
    Created on : Jun 18, 2023, 5:19:15 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="son.model.Plant" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if (session.getAttribute("account") != null) {
        %>
        Choose your item that you want then press "Add to your cart"
        <br>
        <br>
        You can see your choices here:
        <form style="display: inline" action="ViewCartServlet" method="post">
            <input type="submit" name="btViewCart" value="View your cart">
        </form>
        <br>
        <br>
        <form action="AddToCartServlet" method="post">
            Available: 
            <select name="tree">
                <%
                ArrayList<Plant> listPlant = (ArrayList<Plant>) session.getAttribute("listPlant");
                for (Plant plant : listPlant) {
                %>
                <option value="<%= plant.getId() %>"><%= plant.getName() + " - " + plant.getPrice() + "VND"%></option>
                <%
                }
                %>
            </select>
            <br>
            <br>
            Quantity: 
            <input type="number" name="quantity">
            <br>
            <br>
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
            <br>
            <input type="submit" name="btAddToCart" value="Add to your cart">
        </form>
        <%
        }
        %>    
    </body>
</html>
