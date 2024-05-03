<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        
        .message-container {
            margin-top: 50px;
        }
        
        .message {
            font-size: 20px;
            margin-bottom: 20px;
        }
        
        .redirect-button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
        }
        
        .redirect-button:hover {
            background-color: #2980b9;
        }
        .img{
        height:200px;
        width:200px;
        }
    </style>
</head>
<body>
    <div class="message-container">
        
        <img src="https://cdn.pixabay.com/photo/2021/08/30/22/33/warning-6587278_1280.png" class="img" alt="Cancellation GIF">
        <br>
        <p class="message">Seems like you have updated your flight once so we won't be able to process the cancellation request.</p>
        
        <p class="message">Sorry for the inconvenience.</p>
        <br><br>
        <a href="Dashboard.jsp" class="redirect-button">Go to Dashboard</a>
    </div>
</body>
</html>
