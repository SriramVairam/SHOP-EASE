<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="css/admin_login_form.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>Admin Login</h1>
        </div>
    </header>
    <main>
        <section class="login-form">
            <form action="AdminLoginServlet" method="post">
                <div>
                    <label for="username">User Name:</label>
                    <input type="text" id="username" name="nameofuser" required>
                </div>
                <div>
                    <label for="email">User Email:</label>
                    <input type="email" id="email" name="mailid" required>
                </div>
                <div>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="securitycode" required>
                </div>
                <div>
                    <button type="submit">Login</button>
                </div>
            </form>
            
        </section>
    </main>
</body>
</html>