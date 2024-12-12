package controller;

import sdb.DConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/students_login")
public class StudentsLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //send error to jsp



        try (Connection conn = DConnection.getConnection()) {
            String query = "SELECT student_id, first_name, last_name FROM students WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password);




            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Set session attributes for logged-in student
                int studentId = rs.getInt("student_id");
                String studentName = rs.getString("first_name") + " " + rs.getString("last_name");

                request.getSession().setAttribute("student_id", studentId);
                request.getSession().setAttribute("student_name", studentName);

                // Redirect to the dashboard servlet
                //response.sendRedirect("student_dashboard");
                // Redirect to the dashboard servlet
                response.sendRedirect("student_dashboard");
            } else {
                //response.getWriter().write("Invalid email or password");
                request.setAttribute("error", "Invalid credentials, please try again.");
                request.getRequestDispatcher("students_login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
