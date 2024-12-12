package model;

public class TScore {
    private Integer scoreid;

    private String term;

    private String studentid;

    private String studentname;

    private String classid;

    private String classname;

    private String courseid;

    private String coursenanme;

    private Double score;

    public Integer getScoreid() {
        return scoreid;
    }

    public void setScoreid(Integer scoreid) {
        this.scoreid = scoreid;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term == null ? null : term.trim();
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid == null ? null : studentid.trim();
    }

    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname == null ? null : studentname.trim();
    }

    public String getClassid() {
        return classid;
    }

    public void setClassid(String classid) {
        this.classid = classid == null ? null : classid.trim();
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public String getCourseid() {
        return courseid;
    }

    public void setCourseid(String courseid) {
        this.courseid = courseid == null ? null : courseid.trim();
    }

    public String getCoursenanme() {
        return coursenanme;
    }

    public void setCoursenanme(String coursenanme) {
        this.coursenanme = coursenanme == null ? null : coursenanme.trim();
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "TScore{" +
                "scoreid=" + scoreid +
                ", term='" + term + '\'' +
                ", studentid='" + studentid + '\'' +
                ", studentname='" + studentname + '\'' +
                ", classid='" + classid + '\'' +
                ", classname='" + classname + '\'' +
                ", courseid='" + courseid + '\'' +
                ", coursenanme='" + coursenanme + '\'' +
                ", score=" + score +
                '}';
    }
}