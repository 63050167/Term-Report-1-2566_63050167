<%-- 
    Document   : ShowConfirm
    Created on : Oct 25, 2023, 11:00:00 AM
    Author     : pisut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Confirm Order</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f5f5f5;
                text-align: center;
            }

            h1 {
                font-family: 'cursive', cursive;
                color: #007bff;
                font-size: 36px;
            }

            h1:first-child {
                margin-top: 50px;
            }

            h1:last-child {
                margin-top: 20px;
            }
        </style>
    </head>
    <%
        Integer totalPrice = (Integer) request.getAttribute("totalPrice");
    %>
    <body>
        <h1>Your Order is confirmed!</h1>
        <br>

        <h1>The total amount is $<%= totalPrice%></h1>
    </body>
</html>
