<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, utility.data_connectivity" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Shop</title>
    <link rel="stylesheet" href="css/edit_shop.css">
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
            <h1>Edit Shop</h1>
        </div>
    </header>
    <main>
        <section class="shop">
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String ownername = "", shopname = "", email = "", district = "", town = "", pincode = "", phonenumber = "";

                try {
                    conn = data_connectivity.getConnection();
                    String sql = "SELECT * FROM shop WHERE id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, id);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        ownername = rs.getString("shopowner");
                        shopname = rs.getString("shopname");
                        email = rs.getString("email");
                        district = rs.getString("district");
                        town = rs.getString("town");
                        pincode = rs.getString("pincode");
                        phonenumber = rs.getString("phonenumber");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
            <form action="EditShopServlet" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                <div>
                    <label for="ownername">Shop Owner Name:</label>
                    <input type="text" id="ownername" name="ownername" value="<%= ownername %>" required>
                </div>
                <div>
                    <label for="shopname">Shop Name:</label>
                    <input type="text" id="shopname" name="shopname" value="<%= shopname %>" required>
                </div>
                <div>
                    <label for="email">User Email:</label>
                    <input type="email" id="email" name="email" value="<%= email %>" required>
                </div>
                <div>
                    <label for="district">District:</label>
                    <input type="text" id="district" name="district" value="<%= district %>" required>
                </div>
                <div>
                    <label for="town">Town:</label>
                    <input type="text" id="town" name="town" value="<%= town %>" required>
                </div>
                <div>
                    <label for="pincode">Pincode:</label>
                    <input type="number" id="pincode" name="pincode" value="<%= pincode %>" required>
                </div>
                <div>
                    <label for="phonenumber">Phone Number:</label>
                    <input type="number" id="phonenumber" name="phonenumber" value="<%= phonenumber %>" required>
                </div>
                <div>
                    <button type="submit">Update Shop</button>
                </div>
            </form>
        </section>
    </main>
</body>
</html>