<%@page import="com.project.model.CancelationDetails"%>
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
List<CancelationDetails> cancelationDetails = (List<CancelationDetails>) request.getAttribute("cancelationDetails");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Fusion</title>
    <link href="https://w7.pngwing.com/pngs/974/566/png-transparent-google-flights-airline-ticket-hotel-travel-blue-angle-flight.png" rel="icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h2 {
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #3d5cb8;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
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

        .btn {
            background-color: transparent;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1.2rem;
        }

        .btn:hover {
            text-decoration: none;
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
<h2>Canceled Flights</h2>
<table>
    <thead>
    <tr>
        <th>Flight ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
    <%
    if (cancelationDetails != null) {
        for (CancelationDetails cancelationDetail : cancelationDetails) {
    %>
    <tr>
        <td><%=cancelationDetail.getFlightId()%></td>
        <td><%=cancelationDetail.getFname()%></td>
        <td><%=cancelationDetail.getLname()%></td>
        <td><%=cancelationDetail.getEmail()%></td>
    </tr>
    <%
        }
    }
    %>
    </tbody>
</table>
</body>
</html>
