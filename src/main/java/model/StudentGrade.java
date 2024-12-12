package model;

public class StudentGrade {
    private String classId;
    private String className;
    private String courseName;
    private double score;
    private String term;

    public StudentGrade(String classId, String className, String courseName, double score, String term) {
        this.classId = classId;
        this.className = className;
        this.courseName = courseName;
        this.score = score;
        this.term = term;
    }

    public String getClassId() {
        return classId;
    }

    public String getClassName() {
        return className;
    }

    public String getCourseName() {
        return courseName;
    }

    public double getScore() {
        return score;
    }

    public String getTerm() {
        return term;
    }
}
