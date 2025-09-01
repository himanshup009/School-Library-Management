<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Borrow Book</title>
    <style>
        body {
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 650px;
        }

        h1 {
            text-align: center;
            color: #34495e;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background: #f9fbfd;
        }

        label {
            font-weight: bold;
            color: #2c3e50;
        }

        input[type="number"] {
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 0.95em;
            width: 80px;
        }

        .btn {
            display: inline-block;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            font-size: 0.95em;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            margin-top: 15px;
        }

        .btn-borrow {
            background: #27ae60;
            color: white;
        }

        .btn-borrow:hover {
            background: #1e8449;
        }

        .btn-back {
            background: #7f8c8d;
            color: white;
            margin-left: 10px;
        }

        .btn-back:hover {
            background: #626e70;
        }

        .actions {
            text-align: center;
        }

        .due-date {
            margin-top: 10px;
            font-size: 1em;
            color: #e67e22;
            font-weight: bold;
        }
    </style>
    <script>
        function calculateDueDate() {
            const daysInput = document.getElementById("days");
            const dueDateSpan = document.getElementById("dueDateDisplay");

            if (daysInput.value && daysInput.value > 0) {
                let today = new Date();
                today.setDate(today.getDate() + parseInt(daysInput.value));
                
                let dd = String(today.getDate()).padStart(2, '0');
                let mm = String(today.getMonth() + 1).padStart(2, '0'); // Months are 0-based
                let yyyy = today.getFullYear();
                
                let formattedDate = yyyy + "-" + mm + "-" + dd;
                dueDateSpan.innerText = "📅 Due Date: " + formattedDate;
            } else {
                dueDateSpan.innerText = "";
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>📖 Borrow Book</h1>

        <form:form method="post" action="/library/borrow">
            <table>
                <tr>
                    <th>Id</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Status</th>
                </tr>
                <tr>
                    <td>${book.id}</td>
                    <td>${book.name}</td>
                    <td>${book.author}</td>
                    <td>${book.price}</td>
                    <td>${book.status}</td>
                </tr>
            </table>

            <div class="actions">
                <label for="days">Borrow for how many days?</label>
                <input type="number" name="days" id="days" min="1" max="30" required oninput="calculateDueDate()" />
                <div id="dueDateDisplay" class="due-date"></div>
                <br>
                <input type="submit" value="Borrow" class="btn btn-borrow" />
                <a href="/library/display" class="btn btn-back">⬅ Back to Library</a>
            </div>

            <input type="hidden" name="id" value="${book.id}" />
        </form:form>
    </div>
</body>
</html>
