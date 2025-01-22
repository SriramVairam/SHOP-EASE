<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/admin_dashboard.css">
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
            <h1>Admin Dashboard</h1>
        </div>
    </header>
    <main>
        <section class="dashboard">
            <div class="dashboard-buttons">
                <button onclick="location.href='AddShop.jsp'">Add Shop</button>
                <button onclick="location.href='ViewAllShops.jsp'">View Shops</button>
                <button onclick="location.href='AddItem.jsp'">Product</button>
                <button onclick="location.href='ViewAllItems.jsp'">View Product</button>
                <button onclick="location.href='Logout.jsp'">Log Out</button>
            </div>
        </section>
    </main>
</body>
</html>