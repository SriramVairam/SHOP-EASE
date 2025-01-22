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
 * Servlet implementation class DeleteShopServlet
 */
public class DeleteShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));

	        Connection conn = null;
	        PreparedStatement pstmt = null;

	        try {
	            conn = data_connectivity.getConnection();

	            String sql = "DELETE FROM shop WHERE id = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, id);

	            int rows = pstmt.executeUpdate();

	            if (rows > 0) {
	                response.sendRedirect("ViewAllShops.jsp");
	            } else {
	                request.setAttribute("errorMessage", "Failed to delete shop. Please try again.");
	                request.getRequestDispatcher("ViewAllShops.jsp").forward(request, response);
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
