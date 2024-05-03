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
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group input[type="time"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .form-group input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Flight</h1>
        <form action="addFlightServlet" method="post">
            <div class="form-group">
                <label for="flightId">Flight ID:</label>
                <input type="text" id="flightId" name="flightId" required>
            </div>
            <div class="form-group">
                <label for="fromLocation">From Location:</label>
                <input type="text" id="fromLocation" name="fromLocation" required>
            </div>
            <div class="form-group">
                <label for="toLocation">To Location:</label>
                <input type="text" id="toLocation" name="toLocation" required>
            </div>
            <div class="form-group">
                <label for="departureDate">Departure Date:</label>
                <input type="text" id="departureDate" name="departureDate" required>
            </div>
            <div class="form-group">
                <label for="arrivalDate">Arrival Date:</label>
                <input type="text" id="arrivalDate" name="arrivalDate" required>
            </div>
            <div class="form-group">
                <label for="departureTime">Departure Time:</label>
                <input type="text" id="departureTime" name="departureTime" required>
            </div>
            <div class="form-group">
                <label for="arrivalTime">Arrival Time:</label>
                <input type="text" id="arrivalTime" name="arrivalTime" required>
            </div>
            <div class="form-group">
                <label for="economySeats">Economy Seats:</label>
                <input type="text" id="economySeats" name="economySeats" required>
            </div>
            <div class="form-group">
                <label for="premiumEconomySeats">Premium Economy Seats:</label>
                <input type="text" id="premiumEconomySeats" name="premiumEconomySeats" required>
            </div>
            <div class="form-group">
                <label for="businessSeats">Business Seats:</label>
                <input type="text" id="businessSeats" name="businessSeats" required>
            </div>
            <div class="form-group">
                <label for="economyPrice">Economy Price:</label>
                <input type="text" id="economyPrice" name="economyPrice" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="premiumEconomyPrice">Premium Economy Price:</label>
                <input type="text" id="premiumEconomyPrice" name="premiumEconomyPrice" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="businessPrice">Business Price:</label>
                <input type="text" id="businessPrice" name="businessPrice" step="0.01" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Add Flight">
            </div>
        </form>
    </div>
    
    <script>
    document.getElementById('departureDate').addEventListener('input', function () {
        let inputValue = this.value;
        let dateRegex = /^\d{4}-\d{2}-\d{2}$/;
        if (!dateRegex.test(inputValue)) {
            this.setCustomValidity('Invalid date format. Please use YYYY-MM-DD.');
        } else {
            this.setCustomValidity('');
        }
    });
</script>

    
    
</body>
</html>
