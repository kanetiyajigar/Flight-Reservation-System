<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        h2 {
            text-align: center;
        }
        .pagination {
            margin-top: 20px;
            text-align: center;
        }
        .pagination a {
            display: inline-block;
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
    <h2>User List</h2>
    <table>
        <tr>
            <th>User ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Phone</th>
        </tr>
        <%
            List<User> userList = (List<User>) request.getAttribute("userList");
            int pageSize = 10; // Number of users per page
            int numPages = (int) Math.ceil((double) userList.size() / pageSize);
            int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
            int startIndex = (currentPage - 1) * pageSize;
            int endIndex = Math.min(startIndex + pageSize, userList.size());

            for (int i = startIndex; i < endIndex; i++) {
                User user = userList.get(i);
        %>
        <tr>
            <td><%= user.getUserId() %></td>
            <td><%= user.getUserName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPassword() %></td>
            <td><%= user.getPhone() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="pagination">
        <% for (int i = 1; i <= numPages; i++) { %>
            <a href="?page=<%= i %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
        <% } %>
    </div>
</body>
</html>
