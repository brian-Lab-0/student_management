<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>

    <!-- Favicon -->
    <link href="img/favicon.png" rel="icon">

<%--
    <link rel="stylesheet" type="text/css" href="styles.css">--%>
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 90%;
            max-width: 800px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow: hidden;
            text-align: center;
            padding: 20px;
        }

        /* Header */
        header {
            background-color: #0bbaca;
            color: #ffffff;
            padding: 20px 0;
            border-radius: 8px 8px 0 0;
        }

        header h1 {
            margin: 0;
            font-size: 1.8em;
        }

        /* User Information */
        .user-info {
            padding: 20px;
            background-color: #f1f5f9;
            border-radius: 8px;
            margin: 20px 0;
        }

        .user-info h2 {
            font-size: 1.5em;
            color: #14797a;
            margin-bottom: 10px;
        }

        .user-info p {
            margin: 8px 0;
            font-size: 1.1em;
        }

        /* Actions */
        .actions {
            margin: 20px 0;
        }

        .btn {
            display: inline-block;
            background-color: #14797a;
            color: #ffffff;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 1em;
            border-radius: 5px;
            margin: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #14797a;
        }

        .btn.logout {
            background-color: #f87171;
        }

        .btn.logout:hover {
            background-color: #dc2626;
        }

        /* Admin Panel */
        .admin-panel {
            padding: 20px;
            background-color: #e0f2fe;
            border-radius: 8px;
            margin-top: 20px;
        }

        .admin-panel h2 {
            font-size: 1.5em;
            color: #14797a;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 95%;
            }
            header h1, .user-info h2, .admin-panel h2 {
                font-size: 1.3em;
            }
            .btn {
                font-size: 0.9em;
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>Welcome to Your Dashboard</h1>
    </header>

    <section class="user-info">
        <h2>User Information</h2>
        <p><strong>Full Name:</strong> ${fullname}</p>
        <p><strong>Email:</strong> <span id="userEmail">${email}</span></p>
    </section>

    <section class="actions">
        <a href="student_dash.jsp" class="btn">student dash</a>
        <a href="logout.jsp" class="btn logout">Logout</a>
    </section>

</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const userEmail = document.getElementById("userEmail").textContent.trim();
        if (userEmail === "brian@qq.com") {
            document.getElementById("adminPanel").style.display = "block";
        }
    });
</script>
</body>
</html>
