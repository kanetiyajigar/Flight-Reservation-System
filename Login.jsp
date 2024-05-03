<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>

<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = login.jsp");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link href="https://w7.pngwing.com/pngs/974/566/png-transparent-google-flights-airline-ticket-hotel-travel-blue-angle-flight.png" rel="icon">
<title>Flight Fusion</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: url('https://media.istockphoto.com/id/1150010954/photo/787-dreamliner-commercial-airplane-cabin-interior-with-blue-leather-seats.jpg?s=612x612&w=0&k=20&c=qfRvBRinH1nHjeokpp4hs0hhUd4s7aE4KId_AJp-Lz0=')
        no-repeat center center fixed;
    background-size: cover;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    position: relative;
}

.login-container {
    width: 400px;
    padding: 40px;
    background-color: rgba(255, 255, 255, 0.8); /* Adjust opacity here */
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #333;
}

label {
    font-weight: bold;
    color: #555;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 16px;
}

input[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.login-link {
    margin-top: 10px;
    color: #333;
    text-decoration: none;
    display: inline-block;
}

.login-link:hover {
    text-decoration: underline;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.error-message {
            color: red;
            margin-top: 10px;
            align : center;
        }
</style>
</head>
<body>

    <div class="login-container">
        <h2>User Login</h2>
        <div id="errorMessage" class="error-message">
            <% if (session.getAttribute("errorMessage") != null && request.getAttribute("loginFailed") != null) { %>
                <%= session.getAttribute("errorMessage") %>
            <% } %>
        </div>
        <form action="loginServlet" method="get" id="loginForm">
            <label for="email">Email:</label><br>
            <input type="text" id="email" name="email" required><br>
            
            <div id="emailError" style="color: red;"></div>
            
            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br>
            
            <div id="passwordError" style="color: red;"></div>
            
            <input type="submit" value="Login"> <a href="Register.jsp" class="login-link">Don't have an account? Register here</a> <br>
            <a href="AdminLogin.jsp" class="login-link">Admin Login</a>
        </form>
    </div>

    


    <!-- <script>
        document.getElementById("loginForm").addEventListener("submit", function(event) {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var passwordError = document.getElementById("passwordError");
            var emailError = document.getElementById("emailError");
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailPattern.test(email)) {
                emailError.textContent = "Please enter a valid email address.";
                document.getElementById("email").value = "";
                document.getElementById("email").focus();
                event.preventDefault();
            } if (password.length < 8) {
                passwordError.textContent = "Password must be at least 8 characters long.";
                document.getElementById("password").value = "";
                document.getElementById("password").focus();
                event.preventDefault();
            } 
        });
    </script> -->
</body>
</html>