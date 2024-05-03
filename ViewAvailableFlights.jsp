<%@ page import="java.util.List"%>
<%@ page import="com.project.model.AddFlights"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.ParseException"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ page session="true"%>

<%
List<AddFlights> flights = (List<AddFlights>) request.getAttribute("flights");
%>
<%
response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
%>
<%
	if(session.getAttribute("email")==null)
			response.sendRedirect("Login.jsp");
    String email = (String) session.getAttribute("email");

String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Fusion</title>
    <link href="https://w7.pngwing.com/pngs/974/566/png-transparent-google-flights-airline-ticket-hotel-travel-blue-angle-flight.png" rel="icon">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }

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

        .flight-record {
            background-color: #fff;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .flight-record:hover {
            transform: translateY(-5px);
        }

        .flight-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
        }

        .flight-details > div {
            margin-bottom: 10px;
        }

        .book-form {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
        }

        .book-form select, .book-form input[type="submit"] {
            margin-right: 10px;
            margin-bottom: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        .book-form select:focus, .book-form input[type="submit"]:hover {
            border-color: #0071e4;
        }

        .book-button {
            background-color: #0071e4;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 1rem;
            text-transform: uppercase;
        }

        .book-button:hover {
            background-color: #005499;
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
<div style="padding: 20px;">
    <h2>Available Flights</h2>

    <% if (flights != null) {
        for (AddFlights flight : flights) { %>
            <div class="flight-record">
                <div class="flight-details">
                    <div>
                        <p><strong>Flight ID:</strong> <%=flight.getFlightId()%></p>
                        <p><strong>From:</strong> <%=flight.getFromLocation()%></p>
                        <p><strong>To:</strong> <%=flight.getToLocation()%></p>
                        <p><strong>Departure:</strong> <%=formatDate(flight.getDepartureDate())%>, <%=flight.getDepartureTime()%></p>
                        <p><strong>Arrival:</strong> <%=formatDate(flight.getArrivalDate())%>, <%=flight.getArrivalTime()%></p>
                        <p><strong>Prices:</strong> Economy: <%=flight.getEconomyPrice()%>, Premium Economy: <%=flight.getPremiumEconomyPrice()%>, Business: <%=flight.getBusinessPrice()%></p>
                    </div>
                    <form class="book-form" action="passenger_details.jsp" method="post">
                        <input type="hidden" name="email" value="<%= email %>">
                        <input type="hidden" name="flightId" value="<%=flight.getFlightId()%>">
                        <input type="hidden" name="departureDate" value="<%=flight.getDepartureDate()%>">
                        <input type="hidden" name="departureTime" value="<%=flight.getDepartureTime()%>">
                        <input type="hidden" name="economyPrice" value="<%=flight.getEconomyPrice()%>">
                        <input type="hidden" name="premiumEconomyPrice" value="<%=flight.getPremiumEconomyPrice()%>">
                        <input type="hidden" name="businessPrice" value="<%=flight.getBusinessPrice()%>">
                        <select name="flightClass">
                            <option value="economy">Economy</option>
                            <option value="premiumEconomy">Premium Economy</option>
                            <option value="business">Business</option>
                        </select>
                        <select name="passengers">
                            <% for (int i = 1; i <= 10; i++) { %>
                                <option value="<%=i%>"><%=i%></option>
                            <% } %>
                        </select>
                        <input type="submit" value="Book" class="book-button">
                    </form>
                </div>
            </div>
    <% }
    } %>
</div>
<%-- JavaScript alert box --%>
    <% if (request.getAttribute("alertMessage") != null) { %>
        <script type="text/javascript">
            alert("<%= request.getAttribute("alertMessage") %>");
        </script>
    <% } %>
</body>
</html>

<%!private String formatDate(Date date) {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    return sdf.format(date);
}%>
