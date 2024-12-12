package model;

public class User {
    private int id;
    private String fullname;
    private String email;
    private String status;
    private String photo; // Profile photo URL or path

    // Default Constructor
    public User() {
    }

    // Constructor for initializing User objects
    public User(int id, String fullname, String email, String status, String photo) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.status = status;
        this.photo = photo;
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fullname='" + fullname + '\'' +
                ", email='" + email + '\'' +
                ", status='" + status + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }
}
