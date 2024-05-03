<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Fusion</title>
    <link href="https://w7.pngwing.com/pngs/974/566/png-transparent-google-flights-airline-ticket-hotel-travel-blue-angle-flight.png" rel="icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://media.istockphoto.com/id/1150010954/photo/787-dreamliner-commercial-airplane-cabin-interior-with-blue-leather-seats.jpg?s=612x612&w=0&k=20&c=qfRvBRinH1nHjeokpp4hs0hhUd4s7aE4KId_AJp-Lz0=') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        .container {
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

        input[type="text"],
        input[type="email"],
        input[type="password"] {
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
    </style>
</head>
<body>
		
		<div class="container">
			<h2>User Registration</h2>
			<form action="add" method="post" id="registrationForm">
				    
				    <label for="username">User Name:</label> 
					<input type="text"id="username" name="username" required>
					<br> 
					
					<div id="usernameError" class="error-message" style="color: red;"></div>
					
					<labelfor="email">Email:</label> 
					<input type="email" id="email"name="email" required>
					<br> 
					
					<div id="emailError" class="error-message" style="color: red;"></div>
					
					<label for="password">Password:</label>
					<input type="password" id="password" name="password" required><br>
					<div id="passwordError" class="error-message" style="color: red;"></div>

				    <label for="phone">Phone:</label> 
				    <input type="text" id="phone"name="phone" required>
					<br> 
					<div id="phoneError" class="error-message" style="color: red;"></div>
					
					<input type="submit"value="Register">
					
			</form>
			<br> <a href="Login.jsp" class="login-link">Already have an
				account? Login here</a>
		</div>

	<script>
        
        document.getElementById("registrationForm").addEventListener("submit", function(event) {
            var valid = true;
            
            // Validate username
            var username = document.getElementById("username").value.trim();
            var usernameError = document.getElementById("usernameError");
            if (username === "") {
                usernameError.textContent = "Please enter a username.";
                valid = false;
            } else {
                usernameError.textContent = "";
            }
            
            // Validate email
            var email = document.getElementById("email").value.trim();
            var emailError = document.getElementById("emailError");
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                emailError.textContent = "Please enter a valid email address.";
                valid = false;
            } else {
                emailError.textContent = "";
            }
            
            // Validate password
            var password = document.getElementById("password").value;
            var passwordError = document.getElementById("passwordError");
            if (password.length < 8) {
                passwordError.textContent = "Password must be at least 8 characters long.";
                valid = false;
            } else {
                passwordError.textContent = "";
            }
            
            // Validate phone
            var phone = document.getElementById("phone").value.trim();
            var phoneError = document.getElementById("phoneError");
            if (phone.length < 10) {
                phoneError.textContent = "Phone must be at least 10 characters long.";
                valid = false;
            } else {
                phoneError.textContent = "";
            }
            
            // Prevent form submission if validation fails
            if (!valid) {
                event.preventDefault();
            } else {
                // Simulate successful registration
                alert("User registered successfully!");
                
                // You can redirect the user to another page after successful registration if needed
                //window.location.href = "Login.jsp";
            }
        });
    </script>
</body>
</html>
