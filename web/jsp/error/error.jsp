<%--
  Created by IntelliJ IDEA.
  User: sirko
  Date: 10.10.18
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="container">
    <div class="jumbotron">
        <h1>Data is incorrect! Try again.</h1>
        <br>
        <h3>a must be lower then b</h3>
    </div>
    <div class="footer">
        <div class="btn-group btn-group-justified">
            <div class="btn-group">
                <input type="button" value="Try Again" class="btn btn-success" onclick="location.href='/midPoint'">
            </div>
            <div class="btn-group">
                <input type="button" value="Back to Main Menu" class="btn btn-primary" onclick="location.href='/'">
            </div>
        </div>
    </div>
</body>
</html>
