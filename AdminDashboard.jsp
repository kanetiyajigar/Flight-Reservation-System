<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        .options {
            display: flex;
            flex-direction: column;
            margin-top: 20px;
        }
        .option {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
            margin-bottom: 10px;
            text-align: center;
        }
        .option:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome Admin!</h1>

        <div class="options">
            <a href="AddFlights.jsp" class="option">Add Flight</a>
            <a href="viewUsers" class="option">View Users</a>
            <a href="viewCancellations" class="option">View Cancellation Details</a>
            <!-- Add more options as needed -->
        </div>
    </div>
</body>
</html>
