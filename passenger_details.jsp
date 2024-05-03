<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.UUID"%>
<%@ page session="true"%>


<%
response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
%>
<%
	if(session.getAttribute("email")==null)
			response.sendRedirect("Login.jsp");
    String email = (String) session.getAttribute("email");

String username = (String) session.getAttribute("username");
%>

<%
String flightId = (String) request.getParameter("flightId");
String departureDate = (String) request.getParameter("departureDate");
String departureTime = (String) request.getParameter("departureTime");
String flightClass = (String) request.getParameter("flightClass");
String passengersParam = request.getParameter("passengers");
String economyPrice = request.getParameter("economyPrice");
String premiumEconomyPrice = request.getParameter("premiumEconomyPrice");
String businessPrice = request.getParameter("businessPrice");

int passengers = 1;
if (passengersParam != null) {
	passengers = Integer.parseInt(passengersParam);
}

session.setAttribute("flightId", flightId);
session.setAttribute("departureDate", departureDate);
session.setAttribute("flightClass", flightClass);
session.setAttribute("departureTime", departureTime);
session.setAttribute("economyPrice", economyPrice);
session.setAttribute("premiumEconomyPrice", premiumEconomyPrice);
session.setAttribute("businessPrice", businessPrice);


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Fusion</title>
    <link href="https://w7.pngwing.com/pngs/974/566/png-transparent-google-flights-airline-ticket-hotel-travel-blue-angle-flight.png" rel="icon">
    <style>
        /* Reset styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f1f5f9;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        /* Navigation styles */
        .navbar {
            background-color: #3d5cb8;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar__logo {
            font-size: 1.5rem;
            font-weight: 600;
        }

        .navbar__links {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .navbar__links li {
            display: inline-block;
            margin-right: 20px;
        }

        .navbar__links li a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s;
        }

        .navbar__links li a:hover {
            color: #f0f0f0;
        }
        .btn {
            background-color: transparent;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 1.2rem;
            transition: color 0.3s;
        }

        .btn:hover {
            color: #f1f1f1;
        }

        /* Form container styles */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 2rem;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus {
            border-color: #3498db;
        }

        input[type="submit"] {
            width: 50%;
            padding: 14px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        /* Passenger info styles */
        .passenger-info {
            width: 100%;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 20px;
            background-color: #f9f9f9;
        }

        .passenger-info h3 {
            color: #3498db;
            margin-bottom: 10px;
        }

        .passenger-info input {
            margin-bottom: 10px;
        }

        .passenger-info input:last-child {
            margin-bottom: 0;
        }
        .error-message {
            color: red;
            margin-top: 5px;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
    <div class="navbar">
    <div class="navbar__logo">FlightFusion</div>
    <ul class="navbar__links">
        <li class="link"><a href="Dashboard.jsp">Home</a></li>
        <li class="link"><a href="Dashboard.jsp">Search Flights</a></li>
        <li><a href="myBookings?email=<%=email%>">My Bookings</a></li>
        <li><a href="viewCanceledFlights?email=<%=email%>">Canceled Flights</a></li>
    </ul>
</div>

    <div class="container">
        <h2 class="form-title">Passenger Details</h2>

        <p>
            Flight ID: <%=flightId%><br>
            Departure Date: <%=departureDate%><br>
            Flight Class: <%=flightClass%><br>
            Departure Time: <%=departureTime%><br>
            Email: <%=email %><br>
        </p>

        <form action="passengerDetails" method="post">
            <input type="hidden" name="flightId" value="<%=flightId%>">
            <input type="hidden" name="departureDate" value="<%=departureDate%>">
            <input type="hidden" name="departureTime" value="<%=departureTime%>">
            <input type="hidden" name="flightClass" value="<%=flightClass%>">
            <input type="hidden" name="economyPrice" value="<%=economyPrice%>">
            <input type="hidden" name="premiumEconomyPrice" value="<%=premiumEconomyPrice%>">
            <input type="hidden" name="businessPrice" value="<%=businessPrice%>">

            <% for (int i = 1; i <= passengers; i++) { %>
            <div class="passenger-info">
                <h3>Passenger <%=i%></h3>
                <input type="text" name="fname_<%=i%>" placeholder="First Name" required>
                <input type="text" name="lname_<%=i%>" placeholder="Last Name" required>
                <input type="text" name="phone_<%=i%>" placeholder="Phone" required>
                <div id="phoneError_<%=i%>" class="error-message"></div>
                <input type="email" name="email_<%=i%>" value="<%=email%>" readonly placeholder="Email">
            </div>
            <% } %>

            <input type="hidden" name="passengers" value="<%=passengers%>">
            <input type="submit" value="Make Payment">
        </form>
    </div>
    <script>
        document.getElementById("passengerForm").addEventListener("submit", function(event) {
            var passengers = <%=passengers%>;

            for (var i = 1; i <= passengers; i++) {
                var phone = document.getElementById("phone_" + i).value;
                var phoneError = document.getElementById("phoneError_" + i);
                var phonePattern = /^\d{10}$/;

                if (!phonePattern.test(phone)) {
                    phoneError.textContent = "Please enter a 10-digit phone number.";
                    event.preventDefault();
                } else {
                    phoneError.textContent = "";
                }
            }
        });
    </script>
</body>
</html>