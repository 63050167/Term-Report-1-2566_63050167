<%-- 
    Document   : index
    Created on : Oct 25, 2023, 2:34:34 AM
    Author     : pisut
--%>

<%@page import="model.ShoppingcartTable"%>
<%@page import="model.Shoppingcart"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.ProductsTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Products"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DVD Catalog</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <jsp:useBean id="emp" class="model.Products" scope="request"/>
    <%
        List<Products> empList = ProductsTable.findAllProduct();
        Iterator<Products> itr = empList.iterator();
        List<Shoppingcart> shoppingcarts = ShoppingcartTable.findAllShoppingCart();
        int cartId = shoppingcarts.get(shoppingcarts.size() - 1).getShoppingcartPK().getCartId() + 1;
        session.setAttribute("cartId", cartId);
    %>
    <body>
        <h1 class="text-center mt-3">DVD Catalog</h1>
        <form name="addToShoppingCart" action="AddToShoppingCartController" method="POST">
            <div class="container">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 mt-3">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">DVD Names</th>
                                    <th scope="col">Rate</th>
                                    <th scope="col">Year</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    while (itr.hasNext()) {
                                        emp = itr.next();
                                %>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="<%= emp.getId()%>">
                                        <%= emp.getMovie()%>
                                    </td>
                                    <td><%= emp.getRating()%></td>
                                    <td><%= emp.getYearcreate()%></td>
                                    <td><%= emp.getPrice()%></td>
                                    <td><input type="number" name="quantity" class="form-control"></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Add To Cart</button>
            </div>
        </form>
    </body>
</html>
