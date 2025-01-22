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
 * Servlet implementation class AddProductServlet
 */

public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemID = request.getParameter("itemID");
        String itemName = request.getParameter("itemName");
        String mrp = request.getParameter("mrp");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = data_connectivity.getConnection();

            String sql = "INSERT INTO product (itemID, itemName, mrp) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, itemID);
            pstmt.setString(2, itemName);
            pstmt.setString(3, mrp);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("AddProductSuccessful.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to add product. Please try again.");
                request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
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
