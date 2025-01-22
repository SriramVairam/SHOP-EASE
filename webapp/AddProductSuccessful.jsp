<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Added</title>
    <link rel="stylesheet" href="css/add_shop_success.css">
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
            <h1>Shop Added</h1>
        </div>
    </header>
    <main>
        <section class="shop">
            <p>Product has been successfully added!</p>
            <a href="AdminDashboard.jsp">Go to Dashboard</a>
        </section>
    </main>
</body>
</html>
