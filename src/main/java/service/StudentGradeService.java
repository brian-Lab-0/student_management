package service;

import model.StudentGrade;
import sdb.DConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentGradeService {

    /**
     * Fetch filtered and paginated student scores.
     *
     * @param studentId   The student ID for filtering grades.
     * @param searchQuery The search term (optional).
     * @param category    The category to search in (optional).
     * @param page        The page number for pagination.
     * @return A list of StudentGrade objects.
     */
    public static List<StudentGrade> getStudentScores(String studentId, String searchQuery, String category, int page) {
        List<StudentGrade> grades = new ArrayList<>();
        int pageSize = 10; // Number of records per page
        int offset = (page - 1) * pageSize;

        String baseQuery = "SELECT classid, classname, coursename, score, term FROM t_score WHERE studentid = ?";
        String whereClause = "";
        String orderClause = " ORDER BY classname LIMIT ? OFFSET ?";

        // Add dynamic filter if searchQuery and category are provided
        if (searchQuery != null && !searchQuery.isEmpty() && category != null && !category.isEmpty()) {
            whereClause = " AND " + category + " LIKE ?";
        }

        String query = baseQuery + whereClause + orderClause;

        try (Connection connection = DConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            int paramIndex = 1;

            // Set parameters for studentId
            preparedStatement.setString(paramIndex++, studentId);

            // Add dynamic parameters for filtering
            if (!whereClause.isEmpty()) {
                preparedStatement.setString(paramIndex++, "%" + searchQuery + "%");
            }

            // Set pagination parameters
            preparedStatement.setInt(paramIndex++, pageSize);
            preparedStatement.setInt(paramIndex, offset);

            ResultSet resultSet = preparedStatement.executeQuery();

            // Process the result set
            while (resultSet.next()) {
                grades.add(new StudentGrade(
                        resultSet.getString("classid"),
                        resultSet.getString("classname"),
                        resultSet.getString("coursename"),
                        resultSet.getDouble("score"),
                        resultSet.getString("term")
                ));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return grades;
    }
}
