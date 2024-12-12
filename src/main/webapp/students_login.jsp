<%--
  Created by IntelliJ IDEA.
  User: brian
  Date: 11/30/2024
  Time: 3:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
    <!-- Favicon -->
    <link href="img/favicon.png" rel="icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="css/student.css">

</head>
<body>
<div class="form">
    <p class="title">👨‍🎓 Student Login</p>
    <!-- Error Message -->
    <c:if test="${not empty error}">
        <div style="color:red;">${error}</div>
    </c:if>
    <form action="students_login" method="post">
        <p class="message">  Login to your Account to access the results </p>
        <%--<div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>--%>
        <div class="input-group">
            <input name="email" required="" placeholder="" type="email" class="input">
            <label class="user-label">📧 email</label>
        </div>
       <%-- <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>--%>

        <div class="input-group">
            <input name="password" required="" placeholder="" type="password" class="input">
            <label class="user-label">🔒 *******</label>
        </div>
       <%-- <button type="submit" class="login-button">Login</button>

        <p style="text-align: center; margin-top: 10px;">
            Don't have an account? <a href="student_register.jsp" style="color: #457b9d;">Register here</a>
        </p>--%>
        <div class="mt-5">
            <button
                    class="py-2 px-4 bg-blue-600 hover:bg-blue-700 focus:ring-blue-500 focus:ring-offset-blue-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg"
                    type="submit"
            >
                Login
            </button>
        </div>
        <div class="flex items-center justify-between mt-4">
            <span class="w-1/5 border-b dark:border-gray-600 md:w-1/4"></span>
            <a
                    class="text-xs text-gray-500  dark:text-gray-400 hover:underline"
                    href="student_register.jsp"
            >No account? Register 👉</a
            >
            <span class="w-1/5 border-b dark:border-gray-600 md:w-1/4"></span>
        </div>

    <%-- Optionally, display an error message if login fails --%>
        <% String error = (String) request.getAttribute("errorMessage");
            if (error != null) { %>
        <p class="error-message"><%= error %></p>
        <% } %>
    </form>
</div>
</body>
</html>
