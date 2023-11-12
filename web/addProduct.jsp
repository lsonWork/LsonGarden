<%-- 
    Document   : addProduct
    Created on : Jun 19, 2023, 6:22:24 PM
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
        <a style="color: darkcyan; text-decoration: none" href="adminPage.jsp">⇦ Back to Admin's Page</a>  
        <br>
        <br>
        Add new Product into Database
        <br>
        <br>
        Please input the information correctly
        <br>
        <br>
        <form action="AddProductServlet" method="post">
            ID: <input type="number" name="idToAdd" required>
            <br>
            Name: <input type="text" name="nameToAdd" required>
            <br>
            Price: <input type="number" name="priceToAdd" required>
            <br>
            Quantity: <input type="number" name="quantityToAdd" required>
            <br>
            Link: <input type="text" name="linkPictureToAdd">
            <br>
            <input type="submit" name="btAdd" value="Add Product">
        </form>
    </body>
</html>
