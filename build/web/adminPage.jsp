<%-- 
    Document   : adminPage
    Created on : Jun 18, 2023, 6:31:33 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="son.model.Plant" %>
<%@page import="java.util.ArrayList" %>
<%@page import="son.DAO.warehouseDAO" %>
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
        <br>
        Admin can Update item's information
        <br>
        <br>
        In-stock:
        <form style="display: inline" action="addProduct.jsp">
            <input type="submit" name="btAdd" value="Add Product">
        </form>
        <br>
        <br>
        <%
        ArrayList<Plant> listPlant = (ArrayList<Plant>) session.getAttribute("listPlant");
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th></th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (Plant plant : listPlant) {
                %>
                <tr>
                    <td><%= plant.getId() %></td>
                    <td><%= plant.getName() %></td>
                    <td><%= plant.getPrice() %></td>
                    <td style="text-align: center" ><%= plant.getQuantity() %></td>
                    <td>
                        <form action="DeleteItemInWarehouse" method="post">
                            <input type="submit" name="deleteItemInWareHouse" value="-">    
                            <input type="hidden" name="itemIdToDelete" value="<%= plant.getId() %>">
                        </form>
                    </td>
                    <td>
                        <form style="text-align: center" action="GoToAdminPage" method="post">
                            <input type="submit" name="updateItemInWareHouse" value="✎">
                            <input type="hidden" name="idToUpdate" value="<%= plant.getId() %>">
                            <input type="hidden" name="nameToUpdate" value="<%= plant.getName() %>">
                            <input type="hidden" name="priceToUpdate" value="<%= plant.getPrice() %>">
                            <input type="hidden" name="quantityToUpdate" value="<%= plant.getQuantity() %>">
                        </form>
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
            <%
            String msg1 = (String) session.getAttribute("msgErrorUpdate");
            if (msg1 != null) {
            %>
            <h3 style="color: darkcyan; font-family: monospace"><%= msg1 %></h3>
            <%
            }
            session.removeAttribute("msgErrorUpdate");
            %>
            <%
            String msg2 = (String) session.getAttribute("msgErrorAdd");
            if (msg2 != null) {
            %>
            <h3 style="color: darkcyan; font-family: monospace"><%= msg2 %></h3>
            <%
            }
            session.removeAttribute("msgErrorAdd");
            %>
    </body>
</html>
