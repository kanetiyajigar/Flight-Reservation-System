<%@page import="com.project.model.PassengerDetails"%>
<%@ page import="java.util.List"%>
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
    PassengerDetails passengerDetails1 = null;
    
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
        form {
            margin: 20px auto;
            width: 50%;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form action="updateClassServlet" method="get">
        <h2>Update Passenger Class</h2>
        <%-- Retrieve passengerId directly from request parameter --%>
        <input type="hidden" name="passengerId" value="<%= request.getParameter("passengerId") %>">
        <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
        <label for="class">Select Class:</label>
        <select id="class" name="newClass">
            <option value="economy">Economy</option>
            <option value="premium economy">Premium Economy</option>
            <option value="business">Business</option>
        </select>
        <input type="submit" value="Update Class">
    </form>
</body>
</html>
