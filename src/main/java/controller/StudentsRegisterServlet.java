package controller;

import sdb.DConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

@WebServlet("/students_register")
public class StudentsRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("student_id");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String departmentId = request.getParameter("department_id");
        String enrollmentDate = request.getParameter("enrollment_date");

        try (Connection conn = DConnection.getConnection()) {
            String query = "INSERT INTO students (student_id, first_name, last_name, dob, gender, email, password, phone, address, department_id, enrollment_date) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(studentId));
            stmt.setString(2, firstName);
            stmt.setString(3, lastName);
            stmt.setDate(4, dob != null ? Date.valueOf(dob) : null);
            stmt.setString(5, gender);
            stmt.setString(6, email);
            stmt.setString(7, password);
            stmt.setString(8, phone);
            stmt.setString(9, address);
            stmt.setInt(10, departmentId != null ? Integer.parseInt(departmentId) : null);
            stmt.setDate(11, Date.valueOf(enrollmentDate));

            stmt.executeUpdate();
            response.sendRedirect("students_login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            //response.getWriter().write("Error: " + e.getMessage());
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("student_register.jsp").forward(request, response);
        }
    }
}
