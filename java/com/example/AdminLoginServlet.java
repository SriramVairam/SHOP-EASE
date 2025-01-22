package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utility.data_connectivity;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String username = request.getParameter("nameofuser");
	        String email = request.getParameter("mailid");
	        String password = request.getParameter("securitycode");
	        
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	        	 
	            conn = data_connectivity.getConnection();

	            String sql = "SELECT * FROM admin WHERE username = ? AND email = ? AND password = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, username);
	            pstmt.setString(2, email);
	            pstmt.setString(3, password);

	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	            	// Create a session and set attributes
	                HttpSession session = request.getSession(true);
	                session.setAttribute("username", username);
	                session.setAttribute("email", email);
	                response.sendRedirect("AdminDashboard.jsp");
	            } else {
	                request.setAttribute("errorMessage", "Invalid login credentials. Please try again.");
	                request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
	            }
	        } catch (Exception e) {
	            throw new ServletException("Database error", e);
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	}

}
