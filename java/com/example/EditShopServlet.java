package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utility.data_connectivity;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class EditShopServlet
 */
public class EditShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
        String ownername = request.getParameter("ownername");
        String shopname = request.getParameter("shopname");
        String email = request.getParameter("email");
        String district = request.getParameter("district");
        String town = request.getParameter("town");
        String pincode = request.getParameter("pincode");
        String phonenumber = request.getParameter("phonenumber");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = data_connectivity.getConnection();

            String sql = "UPDATE shop SET shopowner = ?, shopname = ?, email = ?, district = ?, town = ?, pincode = ?, phonenumber = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ownername);
            pstmt.setString(2, shopname);
            pstmt.setString(3, email);
            pstmt.setString(4, district);
            pstmt.setString(5, town);
            pstmt.setString(6, pincode);
            pstmt.setString(7, phonenumber);
            pstmt.setInt(8, id);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("ViewAllShops.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to update shop. Please try again.");
                request.getRequestDispatcher("EditShop.jsp?id=" + id).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}

}
