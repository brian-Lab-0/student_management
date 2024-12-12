package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class Servlet extends HttpServlet {

    private static final int COOKIE_EXPIRATION_TIME = 7 * 24 * 60 * 60;
    private static final List<String> ADMINS = Arrays.asList("brian@qq.com", "tom@qq.com");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            URL url = new URL("http://localhost:8087/login");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            String jsonInputString = "{ \"email\": \"" + email + "\", \"password\": \"" + password + "\" }";

            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int status = connection.getResponseCode();
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    (status >= 200 && status < 300) ? connection.getInputStream() : connection.getErrorStream(), "utf-8"));
            StringBuilder responseOutput = new StringBuilder();
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                responseOutput.append(responseLine.trim());
            }
            br.close();

            if (status == 200 && responseOutput.toString().contains("Login successful")) {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setMaxInactiveInterval(30 * 60); // Session expires in 30 minutes

                Cookie emailCookie = new Cookie("userEmail", email);
                emailCookie.setMaxAge(COOKIE_EXPIRATION_TIME);
                response.addCookie(emailCookie);

                if (ADMINS.contains(email)) {
                    response.sendRedirect("admin.html");
                } else {
                    response.sendRedirect("dash.jsp");
                }
            }
            else {
                request.setAttribute("error", "Invalid credentials, please try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error during login process", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
