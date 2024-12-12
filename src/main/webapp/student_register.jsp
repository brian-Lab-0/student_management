<%--
  Created by IntelliJ IDEA.
  User: brian
  Date: 11/30/2024
  Time: 3:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Favicon -->
    <link href="img/favicon.png" rel="icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="css/student.css">
    <title>Student Registration</title>

</head>
<body>
<div class="form">
    <p class="title">👨‍🎓 Student Registration</p>
    <!-- Error Message -->
    <c:if test="${not empty error}">
        <div style="color:#b90000;">${error}</div>
    </c:if>
    <form action="students_register" method="post">

        <p class="message">  Signup now if your new students to get privilege's. </p>


        <div class="input-group">
            <input name="student_id" required="" placeholder="" type="text" class="input">
            <label class="user-label">StudentID:</label>
        </div>


        <div class="input-group">
            <input name="first_name" required="" placeholder="" type="text" class="input">
            <label class="user-label">Firstname</label>
        </div>

        <div class="input-group">
            <input name="last_name" required="" placeholder="" type="text" class="input">
            <label class="user-label">Lastname</label>
        </div>


        <label class="identity" >🎂 Birthdate</label>
        <div class="input-group">
            <input  class="input" placeholder="Birthdate" type="date" name="dob"><br>
        </div>


        <label class="identity" >⚥ Select Gender</label>
        <div class="gender_layer">
            <div class="radio-input">
                <input value="Male" name="gender" id="Male" type="radio">
                <label for="Male">Male</label>
                <input value="Female" name="gender" id="Female" type="radio">
                <label for="Female">Female</label>

            </div>
        </div>

        <div class="input-group">
            <input name="email" required="" placeholder="" type="email" class="input">
            <label class="user-label">📧 email</label>
        </div>

        <div class="input-group">
            <input name="password" required="" placeholder="" type="password" class="input">
            <label class="user-label">🔒 *******</label>
        </div>



        <div class="input-group">
            <input name="phone" required="" placeholder="" type="text" class="input">
            <label class="user-label">☎️phone </label>
        </div>


        <div class="input-group">
            <input name="address" required="" placeholder="" type="text" class="input">
            <label class="user-label">📌 address</label>
        </div>



        <label class="identity" >🏛️ Department ID</label>
        <div class="input-group">
            <input name="department_id" required="" placeholder="" type="number" class="input"><br>
        </div>

        <label class="identity">🗓️ Enrollment date</label>
        <div class="input-group">
            <input name="enrollment_date" required="" placeholder="" type="date" class="input"><br>
        </div>


        <div class="mt-5">
            <button
                    class="py-2 px-4 bg-blue-600 hover:bg-blue-700 focus:ring-blue-500 focus:ring-offset-blue-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg"
                    type="submit"
            >
                Register
            </button>
        </div>
        <div class="flex items-center justify-between mt-4">
            <span class="w-1/5 border-b dark:border-gray-600 md:w-1/4"></span>
            <a
                    class="text-xs text-gray-500  dark:text-gray-400 hover:underline"
                    href="students_login.jsp"
            >have an account? Log in 👈</a
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
