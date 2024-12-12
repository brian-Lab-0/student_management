package controller;

import com.google.gson.Gson;
import model.StudentGrade;
import service.StudentGradeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/student-scores")
public class StudentGradeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String searchQuery = request.getParameter("searchQuery");
        String category = request.getParameter("category");
        int page = Integer.parseInt(request.getParameter("page"));

        List<StudentGrade> grades = StudentGradeService.getStudentScores(studentId, searchQuery, category, page);

        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(grades));
    }
}
