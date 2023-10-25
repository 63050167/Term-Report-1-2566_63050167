<%-- 
    Document   : error
    Created on : Oct 25, 2023, 3:44:01 PM
    Author     : pisut
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Notification</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                text-align: center;
            }

            h1 {
                font-size: 24px;
                margin-top: 100px;
            }

            a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                margin-top: 20px;
            }

            a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <h1><%= request.getAttribute("errMsg")%></h1>
        <a href="index.jsp">Back to Menu</a>
    </body>
</html>
