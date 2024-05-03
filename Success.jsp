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
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .gif {
            width: 200px;
            height: 200px;
            margin-bottom: 20px;
        }

        .button {
            padding: 12px 24px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="https://salesport.in/sakhi/static/img/png/success.gif"
         alt="Booking Confirmed" class="gif">
        <h2 style="color: #333;">Flight Added Successfully</h2>
        <h3>Kindly Login once and check the flight availability</h3>
        <br>
        <a href="AdminDashboard.jsp" class="button">Go to Home Page</a>
        
        <br>
        <h3>Thank You !!!</h3>
    </div>
</body>
</html>
