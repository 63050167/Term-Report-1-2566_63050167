<%-- 
    Document   : AddToShoppingCart
    Created on : Oct 25, 2023, 2:34:45 AM
    Author     : pisut
--%>
<%--<%@page import="model.Item"%>--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>
<%@page import="model.ProductsTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
            }

            #shoppingCartTitle {
                text-align: center;
                font-size: 24px;
                margin: 20px 0;
            }

            #tableContainer {
                text-align: center;
                margin: 20px auto;
            }

            table {
                border-collapse: collapse;
                width: 80%;
                margin: 0 auto;
                background-color: #ffffff;
                border: 1px solid #ddd;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                margin: 10px;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <jsp:useBean id="emp" class="model.Products" scope="request"/>
    <%
        Integer allPriceObj = (Integer) request.getAttribute("allPrice");
        int allPrice = 0;
        int total = 0;

        try {
            allPrice = allPriceObj;
        } catch (Exception e) {
        }
        List<Integer> quantities = (List<Integer>) request.getAttribute("quantities");
        List<Products> productlist = (List<Products>) request.getAttribute("productlist");
        Products product = null;
    %>

    <body>
        <form name="ShowConfirmation" action="ShowConfirmationController" method="POST">
            <div id="shoppingCartTitle">Shopping Cart</div>
            <div id="tableContainer">
                <table>
                    <thead>
                        <tr>
                            <th>DVD Name</th>
                            <th>Rating</th>
                            <th>Year</th>
                            <th>Price/Unit</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < quantities.size(); i++) {
                                int quantity = quantities.get(i);
                                if (quantity > 0) {
                                    int movieId = i + 1;
                                    product = ProductsTable.findProductById(movieId);
                                    int pricePerUnit = product.getPrice();
                                    int totalPrice = pricePerUnit * quantity;
                                    total += totalPrice;
                        %>
                        <tr>
                            <td><%= product.getMovie()%></td>
                            <td><%= product.getRating()%></td>
                            <td><%= product.getYearcreate()%></td>
                            <td><%= pricePerUnit%></td>
                            <td><%= quantity%></td>
                            <td><%= totalPrice%></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        <tr style="background-color: #f2f2f2">
                            <td style="text-align: center;" colspan="5">Total</td>
                            <td style="text-align: center;"><%= total%></td>
                            <%
                                session.setAttribute("totalPrice", total);
                                session.setAttribute("productlist", productlist);
                                session.setAttribute("quantities", quantities);
                            %>
                        </tr>
                    </tbody>
                </table>
            </div>
            <center>
                <button type="submit">Add To Cart</button>
            </center>
        </form>
    </body>