<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<html>
<head>


<meta charset="UTF-8">
<title>Flight Fusion</title>
<link href="https://w7.pngwing.com/pngs/974/566/png-transparent-google-flights-airline-ticket-hotel-travel-blue-angle-flight.png" rel="icon">
</head>
<body>
    <h1>Flight Canceled Successfully</h1>
    <form action="Dashboard.jsp"> <!-- Replace 'Dashboard.jsp' with the actual URL of your dashboard page -->
        <button type="submit">Back to Dashboard</button>
    </form>
</body>
</html>
