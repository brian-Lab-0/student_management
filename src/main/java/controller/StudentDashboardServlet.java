package controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import model.StudentGrade;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/student_dashboard")
public class StudentDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = (int) request.getSession().getAttribute("student_id");

        try (Connection conn = DConnection.getConnection()) {
            // Fetch student grades
            String gradesQuery = "SELECT classid, classname, coursenanme, score, term FROM t_score WHERE studentid = ?";
            PreparedStatement gradesStmt = conn.prepareStatement(gradesQuery);
            gradesStmt.setInt(1, studentId);

            ResultSet gradesRs = gradesStmt.executeQuery();
            List<StudentGrade> grades = new ArrayList<>();
            while (gradesRs.next()) {
                StudentGrade grade = new StudentGrade(
                        gradesRs.getString("classid"),
                        gradesRs.getString("classname"),
                        gradesRs.getString("coursenanme"),
                        gradesRs.getDouble("score"),
                        gradesRs.getString("term")
                );
                grades.add(grade);
            }

            // Convert List<StudentGrade> to JSON format
            JSONArray jsonGrades = new JSONArray();
            for (StudentGrade grade : grades) {
                JSONObject gradeJson = new JSONObject();
                gradeJson.put("classid", grade.getClassId());
                gradeJson.put("classname", grade.getClassName());
                gradeJson.put("coursenanme", grade.getCourseName());
                gradeJson.put("score", grade.getScore());
                gradeJson.put("term", grade.getTerm());
                jsonGrades.add(gradeJson);
            }

            // Pass the JSON data to the request for use in JavaScript
            request.setAttribute("gradesJson", jsonGrades.toString());

            // Forward to the JSP
            request.getRequestDispatcher("score.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
