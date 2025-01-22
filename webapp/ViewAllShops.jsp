<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, utility.data_connectivity" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Shops</title>
    <link rel="stylesheet" href="css/view_all_shops.css">
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
            <h1>All Shops</h1>
        </div>
    </header>
    <main>
        <section class="shops">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Owner Name</th>
                        <th>Shop Name</th>
                        <th>Email</th>
                        <th>District</th>
                        <th>Town</th>
                        <th>Pincode</th>
                        <th>Phone Number</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        try {
                            conn = data_connectivity.getConnection();
                            String sql = "SELECT * FROM shop";
                            pstmt = conn.prepareStatement(sql);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String ownername = rs.getString("shopowner");
                                String shopname = rs.getString("shopname");
                                String email = rs.getString("email");
                                String district = rs.getString("district");
                                String town = rs.getString("town");
                                String pincode = rs.getString("pincode");
                                String phonenumber = rs.getString("phonenumber");
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= ownername %></td>
                        <td><%= shopname %></td>
                        <td><%= email %></td>
                        <td><%= district %></td>
                        <td><%= town %></td>
                        <td><%= pincode %></td>
                        <td><%= phonenumber %></td>
                        <td>
                            <a href="EditShop.jsp?id=<%= id %>">Edit</a> 
                            <a href="DeleteShopServlet?id=<%= id %>" onclick="return confirm('Are you sure you want to delete this shop?');">Delete</a>
                        </td>
                    </tr>
                    <%
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
                </tbody>
            </table>
        </section>
    </main>
</body>
</html>
    