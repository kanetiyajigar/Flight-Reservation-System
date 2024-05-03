<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Fusion</title>
    <link href="https://w7.pngwing.com/pngs/974/566/png-transparent-google-flights-airline-ticket-hotel-travel-blue-angle-flight.png" rel="icon">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .pagination {
            margin-top: 20px;
        }
        .pagination a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
            margin: 0 4px;
        }
        .pagination a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }
        .pagination a:hover:not(.active) {
            background-color: #ddd;
        }
    </style>
</head>
<body>

<h2>Cancellation Details Admin</h2>

<table>
    <thead>
        <tr>
            <th>Cancelation ID</th>
            <th>Passenger ID</th>
            <th>Flight ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Cancellation Date</th>
            <th>Refunded Money</th>
        </tr>
    </thead>
    <tbody>
        <%@ page import="com.project.model.CancelationDetails" %>
        <%@ page import="java.util.List" %>
        <% List<CancelationDetails> cancellationDetailsList = (List<CancelationDetails>) request.getAttribute("cancellationDetailsList"); %>
        <% int pageSize = 10;
           int numPages = (int) Math.ceil((double) cancellationDetailsList.size() / pageSize);
           int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
           int startIndex = (currentPage - 1) * pageSize;
           int endIndex = Math.min(startIndex + pageSize, cancellationDetailsList.size());
           
           for (int i = startIndex; i < endIndex; i++) {
               CancelationDetails cancellationDetails = cancellationDetailsList.get(i);
        %>
            <tr>
                <td><%= cancellationDetails.getCancellationId() %></td>
                <td><%= cancellationDetails.getPassengerId() %></td>
                <td><%= cancellationDetails.getFlightId() %></td>
                <td><%= cancellationDetails.getFname() %></td>
                <td><%= cancellationDetails.getLname() %></td>
                <td><%= cancellationDetails.getEmail() %></td>
                <td><%= cancellationDetails.getCancellationDate() %></td>
                <td><%= cancellationDetails.getRefundedMoney() %></td>
            </tr>
        <% } %>
    </tbody>
</table>

<div class="pagination">
    <% for (int i = 1; i <= numPages; i++) { %>
        <a href="?page=<%= i %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
    <% } %>
</div>

</body>
</html>
