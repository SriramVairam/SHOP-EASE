<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="css/add_shop.css">
</head>
<body>
<%
    HttpSession currentSession = request.getSession(true);
    if (currentSession == null || currentSession.getAttribute("username") == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
    String name = (String) currentSession.getAttribute("username");
    String mail = (String) currentSession.getAttribute("email");
%>
    <header>
        <div class="logo">
            <h1>Add Product</h1>
        </div>
    </header>
    <main>
        <section class="shop">
            <form action="AddProductServlet" method="post">
                <div>
                    <label for="itemID">Item ID:</label>
                    <input type="text" id="itemID" name="itemID" required>
                </div>
                <div>
                    <label for="itemName">Item Name:</label>
                    <input type="text" id="itemName" name="itemName" required>
                </div>
                <div>
                    <label for="mrp">MRP:</label>
                    <input type="number" step="0.01" id="mrp" name="mrp" required>
                </div>
                <div>
                    <button type="submit">Add Product</button>
                </div>
            </form>
        </section>
    </main>
</body>
</html>
