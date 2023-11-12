<%-- 
    Document   : updateItem
    Created on : Jun 18, 2023, 9:37:47 PM
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
        <a style="color: darkcyan; text-decoration: none" href="GoToAdminPage">⇦ Back to Admin's Page</a>
        <br>
        <br>
        Enter the value you want to update, if the fill is blank, it will remain the information
        <br>
        <br>
        <form action="UpdateItemInWarehouse" method="post">
            New Name: <input type="text" name="newItemName" value="<%= request.getAttribute("nameToUpdate") %>" required>
            <br>
            New Price: <input type="number" name="newItemPrice" value="<%= request.getAttribute("priceToUpdate") %>" required>
            <br>
            New Quantity: <input type="number" name="newItemQuantity" value="<%= request.getAttribute("quantityToUpdate") %>" required>
            <br>
            <input type="submit" name="btUpdate" value="Update">
        </form>
    </body>
</html>
