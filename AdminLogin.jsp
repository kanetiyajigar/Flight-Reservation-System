<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
            display: block;
            margin-bottom: 5px;
        }

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
            padding: 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 18px;
            display: block; 
            margin: 0 auto; 
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

<div class="login-container">
    <h2>Admin Login</h2>
    <form action="adminServlet" method="post">
        <div class="input-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <input type="submit" value="Login"> <br>
    </form>
    
    <a href="Login.jsp" class="login-link">User Login</a>
</div>

</body>
</html>