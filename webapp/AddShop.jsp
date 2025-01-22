<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Shop</title>
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
            <h1>Add Shop</h1>
        </div>
    </header>
    <main>
        <section class="shop">
            <form action="AddShopServlet" method="post">
                <!-- Add your form fields here -->
                 <div>
                    <label for="ownername">Shop Owner Name:</label>
                    <input type="text" id="ownername" name="ownername" required>
                </div>
                <div>
                    <label for="shopname">Shop Name:</label>
                    <input type="text" id="shopname" name="shopname" required>
                </div>
                <div>
                    <label for="email">User Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div>
                    <label for="district">District:</label>
                    <input type="text" id="district" name="district" required>
                </div>
                <div>
                    <label for="town">Town:</label>
                    <input type="text" id="town" name="town" required>
                </div>
                <div>
                    <label for="pincode">Pincode:</label>
                    <input type="number" id="pincode" name="pincode" required>
                </div>
                <div>
                    <label for="phonenumber">Phone Number:</label>
                    <input type="number" id="phonenumber" name="phonenumber" required>
                </div>
                <div>
                    <button type="submit">Add Shop</button>
                </div>
            </form>
            
        </section>
    </main>
</body>
</html>