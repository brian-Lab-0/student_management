package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve form data
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        try {
            // Prepare the API URL
            URL url = new URL("http://localhost:8087/create_user");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            // Create the JSON request body
            String jsonInputString = "{ \"email\": \"" + email + "\", \"password\": \"" + password + "\", " +
                                     "\"gender\": \"" + gender + "\", \"age\": \"" + age + "\", " +
                                     "\"fullname\": \"" + fullname + "\", \"username\": \"" + username + "\", " +
                                     "\"address\": \"" + address + "\", \"phone\": \"" + phone + "\", \"status\": \"active\" }";

            // Send request to the API
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Read the response from the API
            int status = connection.getResponseCode();
            BufferedReader br;
            if (status >= 200 && status < 300) {
                br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(connection.getErrorStream(), "utf-8"));
            }

            StringBuilder responseOutput = new StringBuilder();
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                responseOutput.append(responseLine.trim());
            }
            br.close();

            // Handle successful registration
            if (status == 200 && responseOutput.toString().contains("User created successfully")) {
                response.sendRedirect("login.jsp");
            } else {
                // Display error message on registration page
                request.setAttribute("error", "Error creating user. Email might already be in use.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            throw new ServletException("Error during registration process", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to registration page
        response.sendRedirect("register.jsp");
    }
}
