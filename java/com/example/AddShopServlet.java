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
 * Servlet implementation class AddShopServlet
 */
public class AddShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        	System.out.println("No go inside loop");
            conn = data_connectivity.getConnection();

            String sql = "INSERT INTO shop (shopowner, shopname, email, district, town, pincode, phonenumber) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ownername);
            pstmt.setString(2, shopname);
            pstmt.setString(3, email);
            pstmt.setString(4, district);
            pstmt.setString(5, town);
            pstmt.setString(6, pincode);
            pstmt.setString(7, phonenumber);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("AddShopSuccess.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to add shop. Please try again.");
                request.getRequestDispatcher("AddShop.jsp").forward(request, response);
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
