<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.project.model.Payment"%>
<%@ page import="com.project.DAO.PaymentDAO"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.UUID"%>

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
	background-color: #f9f9f9;
	color: #333;
	line-height: 1.6;
	margin: 0;
	padding: 0;
}

/* Container styles */
.container {
	max-width: 500px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

/* Form styles */
h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-bottom: 10px;
	color: #333;
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	transition: border-color 0.3s;
}

input[type="text"]:focus {
	border-color: #3498db;
}

input[type="submit"] {
	width: 50%;
	padding: 12px;
	background-color: #3498db;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 20px;
	align-self: center;
}

input[type="submit"]:hover {
	background-color: #2980b9;
}

/* Responsive styles */
@media ( max-width : 768px) {
	.container {
		max-width: 90%;
	}
	input[type="submit"] {
		width: 100%;
	}
}
</style>
</head>
<body>
	<div class="container">
		<h2>Make Payment</h2>

		<p>
			Extra Fare to be Paid:
			<%=request.getParameter("newPrice")%></p>
		<p>
			Email:
			<%=request.getParameter("email")%></p>

		<br>
		<br>
		<form action="makeUpdatedPaymentServlet" method="get">
		Card Number: <input type="text" name="cardNumber" placeholder="Enter 16 digit card number" required><br>
        Expiry Date: <input type="text" name="expiryDate" placeholder="MM/YY" required><br>
        <input type="hidden" name="newPrice" value="<%= request.getParameter("newPrice") %>">
        <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
        Payment Type: <input type="text" name="paymentType" required><br>
        <input type="submit" value="Confirm Payment"> </form>
	</div>
</body>
</html>
