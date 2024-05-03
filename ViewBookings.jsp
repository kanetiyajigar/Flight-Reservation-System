<%@page import="com.project.model.PassengerDetails"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

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
List<PassengerDetails> passengerDetails = (List<PassengerDetails>) request.getAttribute("passengerDetails");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Fusion</title>
    <link href="https://w7.pngwing.com/pngs/974/566/png-transparent-google-flights-airline-ticket-hotel-travel-blue-angle-flight.png" rel="icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .flight {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .flight-details {
            margin-bottom: 10px;
        }

        .flight-details span {
            font-weight: bold;
            margin-right: 10px;
        }

        .btn {
            padding: 10px 16px;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            background-color: #3498db;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn:hover {
            background-color: green;
        }

        .logout-btn {
            padding: 8px 12px;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            background-color: #3498db;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #2980b9;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar {
            background-color: #3d5cb8;
            color: #fff;
            padding: 10px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .navbar__logo {
            font-size: 1.5rem;
            font-weight: 600;
            margin-right: auto;
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
    <h2 style="text-align: center;">My Bookings</h2>
    <% if (passengerDetails != null) {
        for (PassengerDetails passengerDetails1 : passengerDetails) { %>
            <div class="flight">
                <div class="flight-details">
                    <span>Flight ID:</span>
                    <span><%=passengerDetails1.getFlightID()%></span>
                </div>
                <div class="flight-details">
                    <span>Name:</span>
                    <span><%=passengerDetails1.getFname()%> <%=passengerDetails1.getLname()%></span>
                </div>
                <div class="flight-details">
                    <span>Email:</span>
                    <span><%=passengerDetails1.getEmail()%></span>
                </div>
                <div class="flight-details">
                    <span>Phone:</span>
                    <span><%=passengerDetails1.getPhone()%></span>
                </div>
                <div class="flight-details">
                    <span>Departure Date:</span>
                    <span><%=formatDate(passengerDetails1.getDepartureDate())%></span>
                </div>
                <div class="flight-details">
                    <span>Departure Time:</span>
                    <span><%=passengerDetails1.getDepartureTime()%></span>
                </div>
                <div class="flight-details">
                    <span>Class:</span>
                    <span><%=passengerDetails1.getFlightClass()%></span>
                </div>
                <div class="actions">
                    <form action="UpdateClass.jsp" method="get">
                        <input type="hidden" name="passengerId" value="<%=passengerDetails1.getPassengerId()%>">
                        <input type="hidden" name="flightID" value="<%=passengerDetails1.getFlightID()%>">
                        <input type="hidden" name="fname" value="<%=passengerDetails1.getFname()%>">
                        <input type="hidden" name="lname" value="<%=passengerDetails1.getLname()%>">
                        <input type="hidden" name="email" value="<%=passengerDetails1.getEmail()%>">
                        <input type="hidden" name="phone" value="<%=passengerDetails1.getPhone()%>">
                        <input type="hidden" name="departureDate" value="<%=passengerDetails1.getDepartureDate()%>">
                        <input type="hidden" name="departureTime" value="<%=passengerDetails1.getDepartureTime()%>">
                        <input type="hidden" name="class" value="<%=passengerDetails1.getClass()%>">
                        <button type="submit" class="btn">Update Flight</button>
                    </form>
                    <form action="cancelFlight" method="post" onsubmit="return confirm('Are you sure?')">
                        <input type="hidden" name="passengerId" value="<%=passengerDetails1.getPassengerId()%>">
                        <input type="hidden" name="flightId" value="<%=passengerDetails1.getFlightID()%>">
                        <input type="hidden" name="fname" value="<%=passengerDetails1.getFname()%>">
                        <input type="hidden" name="lname" value="<%=passengerDetails1.getLname()%>">
                        <input type="hidden" name="email" value="<%=passengerDetails1.getEmail()%>">
                        <input type="hidden" name="phone" value="<%=passengerDetails1.getPhone()%>">
                        <input type="hidden" name="departureDate" value="<%=passengerDetails1.getDepartureDate()%>">
                        <input type="hidden" name="departureTime" value="<%=passengerDetails1.getDepartureTime()%>">
                        <input type="hidden" name="class" value="<%=passengerDetails1.getClass()%>">
                        <button type="submit" class="btn">Cancel Flight</button>
                    </form>
                    <button class="btn" onclick="printTicket(
                        '<%=passengerDetails1.getPassengerId()%>', 
                        '<%=passengerDetails1.getFlightID()%>', 
                        '<%=passengerDetails1.getFname()%>', 
                        '<%=passengerDetails1.getLname()%>', 
                        '<%=passengerDetails1.getEmail()%>', 
                        '<%=passengerDetails1.getPhone()%>', 
                        '<%=formatDate(passengerDetails1.getDepartureDate())%>', 
                        '<%=passengerDetails1.getDepartureTime()%>', 
                        '<%=passengerDetails1.getFlightClass()%>')">Print Ticket</button>
                </div>
            </div>
    <% }
    } %>
</div>

<script>
    function printTicket(passengerId, flightId, fname, lname, email, phone,
                        departureDate, departureTime, flightClass) {
        var ticketDetails = "";
        ticketDetails += "<h3>Ticket Details for Passenger ID: " + passengerId + "</h3>";
        ticketDetails += "<p>Flight ID: " + flightId + "</p>";
        ticketDetails += "<p>Passenger Name: " + fname + " " + lname + "</p>";
        ticketDetails += "<p>Email: " + email + "</p>";
        ticketDetails += "<p>Phone: " + phone + "</p>";
        ticketDetails += "<p>Departure Date: " + departureDate + "</p>";
        ticketDetails += "<p>Departure Time: " + departureTime + "</p>";
        ticketDetails += "<p>Class: " + flightClass + "</p>";

        var iframe = document.createElement('iframe');
        iframe.style.display = 'none';
        document.body.appendChild(iframe);
        var iframeDoc = iframe.contentDocument || iframe.contentWindow.document;

        iframeDoc.write('<html><head><title>Ticket Details</title><style>@media print { body { font-family: Arial, sans-serif; } h3 { color: #333; } p { color: #555; } }</style></head><body><div>' + ticketDetails + '</div></body></html>');
        iframeDoc.close();

        iframe.contentWindow.print();

        setTimeout(function() {
            document.body.removeChild(iframe);
        }, 100);
    }
</script>
</body>
</html>

<%!private String formatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }%>
