<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!-- Favicon -->
    <link href="img/favicon.png" rel="icon">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgb(6, 46, 51);
            max-width: 400px;
            width: 100%;
        }
        .form_main {
            width: 280px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: rgb(255, 255, 255);
            padding: 30px 30px 30px 30px;
            border-radius: 30px;
            box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.062);
        }

        .heading {
            font-size: 2.5em;
            color: #2e2e2e;
            font-weight: 700;
            margin: 15px 0 30px 0;
        }

        .inputContainer {
            width: 100%;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .inputIcon {
            position: absolute;
            left: 10px;
        }

        .inputField {
            width: 100%;
            height: 40px;
            background-color: transparent;
            border: none;
            border-bottom: 2px solid rgb(173, 173, 173);
            border-radius: 30px;
            margin: 10px 0;
            color: black;
            font-size: .8em;
            font-weight: 500;
            box-sizing: border-box;
            padding-left: 30px;
        }

        .inputField:focus {
            outline: none;
            border-bottom: 2px solid rgb(6, 239, 255);
        }

        .inputField::placeholder {
            color: rgb(80, 80, 80);
            font-size: 1em;
            font-weight: 500;
        }

        #button {
            position: relative;
            width: 100%;
            border: 2px solid #068e9e;
            background-color: #06baca;
            height: 40px;
            color: white;
            font-size: .8em;
            font-weight: 500;
            letter-spacing: 1px;
            border-radius: 30px;
            margin: 10px;
            cursor: pointer;
            overflow: hidden;
        }

        #button::after {
            content: "";
            position: absolute;
            background-color: rgba(255, 255, 255, 0.253);
            height: 100%;
            width: 150px;
            top: 0;
            left: -200px;
            border-bottom-right-radius: 100px;
            border-top-left-radius: 100px;
            filter: blur(10px);
            transition-duration: .5s;
        }

        #button:hover::after {
            transform: translateX(600px);
            transition-duration: .5s;
        }

        .signupContainer {
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 20px;
        }

        .signupContainer p {
            font-size: .9em;
            font-weight: 500;
            color: black;
        }

        .signupContainer a {
            font-size: .7em;
            font-weight: 500;
            background-color: #2e2e2e;
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 20px;
        }

        /*bottom new*/
        /* <reset-style> ============================ */
        a {
            text-decoration: #0b0e1b;
        }
        /* <main-style> ============================ */
        .menu__link {
            color: #07070e;
            line-height: 2;
            position: relative;
        }

        .menu__link::before {
            content: '';
            width: 0;
            height: 2px;
            border-radius: 2px;
            background-color: #07070e;
            position: absolute;
            bottom: -.25rem;
            right: 0;
            transition: right .4s, width .4s, left .4s;
        }

        .menu__link:hover::before {
            width: 100%;
            left: 0;
        }

        /*follow me*/
        .follow{
            justify-content: center;
            align-items: baseline;
            margin: 20px;


        }
        .gbutton {
            position: relative;
            width: 130px;
            height: 35px;
            border-radius: 30px;
            background-color: white;
            border: 1px #000000 solid;
            overflow: hidden;
        }

        .text1 {
            font-size: 17px;
            font-weight: 700;
            margin-left: 22%;
        }

        .text2 {
            position: absolute;
            top: 25%;
            left: -50px;
            font-weight: 700;
            font-size: 14px;
            color: white;
        }

        .icon {
            position: absolute;
            top: 0;
            left: 0;
            transition: transform 0.5s;
        }

        .icon::before {
            position: absolute;
            left: -100px;
            top: 0;
            z-index: -1;
            content: '';
            width: 130px;
            height: 33px;
            border-radius: 30px;
            background-color: #000000;
        }

        .icon::after {
            position: absolute;
            left: 0.5px;
            top: 0.5px;
            z-index: -1;
            content: '';
            width: 32px;
            height: 32px;
            border-radius: 100%;
            background-color: white;
        }

        button:hover .icon {
            transform: translateX(97.5px);
            transition: transform 0.5s;
        }

        button:hover .text2 {
            transform: translateX(100px);
            transition: transform 0.6s;
        }

        button:active {
            transform: scale(1.03);
        }

    </style>
</head>
<body>

<div <%--class="container"--%>>
    <%--<h2>Sign In</h2>--%>



    <form class="form_main" action="login" method="post">
        <%--<label for="email">Email</label>--%>
            <p class="heading">Login</p>
            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div style="color:#b90000;">${error}</div>
            </c:if>
            <div class="inputContainer">
                <svg viewBox="0 0 16 16" fill="#2e2e2e" height="16" width="16" xmlns="http://www.w3.org/2000/svg" class="inputIcon">
                    <path d="M13.106 7.222c0-2.967-2.249-5.032-5.482-5.032-3.35 0-5.646 2.318-5.646 5.702 0 3.493 2.235 5.708 5.762 5.708.862 0 1.689-.123 2.304-.335v-.862c-.43.199-1.354.328-2.29.328-2.926 0-4.813-1.88-4.813-4.798 0-2.844 1.921-4.881 4.594-4.881 2.735 0 4.608 1.688 4.608 4.156 0 1.682-.554 2.769-1.416 2.769-.492 0-.772-.28-.772-.76V5.206H8.923v.834h-.11c-.266-.595-.881-.964-1.6-.964-1.4 0-2.378 1.162-2.378 2.823 0 1.737.957 2.906 2.379 2.906.8 0 1.415-.39 1.709-1.087h.11c.081.67.703 1.148 1.503 1.148 1.572 0 2.57-1.415 2.57-3.643zm-7.177.704c0-1.197.54-1.907 1.456-1.907.93 0 1.524.738 1.524 1.907S8.308 9.84 7.371 9.84c-.895 0-1.442-.725-1.442-1.914z"></path>
                </svg>
      <%--  <input type="text" id="email" name="email" placeholder="Enter your email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>

        <input type="submit" value="Sign In">
        <label for="remember" id="remember">Remember me</label>


        <div class="forgot-password">
            <a href="register.jsp">Don't have an account? Register</a>
        </div>--%>
                <input type="text" id="email" name="email" placeholder="Enter your email" required class="inputField" >
            </div>

            <div class="inputContainer">
                <svg viewBox="0 0 16 16" fill="#2e2e2e" height="16" width="16" xmlns="http://www.w3.org/2000/svg" class="inputIcon">
                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"></path>
                </svg>
                <input  type="password" id="password" name="password" placeholder="Enter your password" required  class="inputField">
            </div>


            <button id="button">Submit</button>
            <%--<button type="submit" value="Sign In">--%>
            <div class="signupContainer">
                <p>Don't have any account?</p>
            </div>
            <a  href="register.jsp" class="menu__link"> register 👉</a>
            <div class="follow">
                <button  class="gbutton" >
                    <a href="https://github.com/brian-Lab-0" class="icon"><svg viewBox="0 0 24 24" height="33" width="33" xmlns="http://www.w3.org/2000/svg"><path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"></path></svg></a>
                    <span  class="text1">Follow me</span>
                    <span class="text2">Brian</span>
                </button>
            </div>
    </form>
</div>
</body>
</html>
