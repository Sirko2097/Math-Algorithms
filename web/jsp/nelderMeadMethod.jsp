<%--
  Created by IntelliJ IDEA.
  User: sirko
  Date: 24.11.18
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NelderMead</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="container">
    <div class="jumbotron">
        <h2>Nelder Mead method Answer</h2>
        <img src="http://latex.codecogs.com/svg.latex?4 * (x - 5)^{2} + (y - 6)^{2}" border="0"/>
    </div>
    <p>Answer</p>
    <%
        out.println("X = " + request.getSession().getAttribute("nelderMeadX") + "<br>"
                + "Y = " + request.getSession().getAttribute("nelderMeadY") + "<br>"
                + "f = " + request.getSession().getAttribute("nelderMeadFunction") + "<br>"
                + "Iterations: " + request.getSession().getAttribute("nelderMeadAmountOfIterations") + "<br>");
        request.getSession().invalidate();
    %>
</body>
</html>
