<%--
  Created by IntelliJ IDEA.
  User: sirko
  Date: 08.10.18
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Euler</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="container">
<div class="jumbotron">
    <h2>Euler method Answer</h2>
    <img src="https://latex.codecogs.com/gif.latex?\frac{u}{x&space;*&space;ln(x)}&space;&plus;&space;\frac{1}{x}" border="0"/>
    <%
        if (request.getSession().getAttribute("eulerMethodX") == null) {
            out.println(" <form method=\"post\">\n" +
                    "        <div class=\"form-group\">\n" +
                    "            <label>Input step size(h):\n" +
                    "                <input type=\"text\" title=\"It must be greater then 0 and 5 numbers after dot\" class=\"form-control\" name=\"h\"\n" +
                    "                       placeholder=\"Size of steps\" pattern=\"^\\s*(?=.*[1-9])\\d*(?:\\.\\d{1,5})?\\s*$$\" required>\n" +
                    "            </label>\n" +
                    "        </div>\n" +
                    "        <input type=\"submit\" class=\"btn btn-success btn-block\" value=\"Submit\" formmethod=\"post\">\n" +
                    "    </form>");

        } else {
            out.println("<br><p>Answer:</p> X = " + request.getSession().getAttribute("eulerMethodX") +
            "<br>Y = " + request.getSession().getAttribute("eulerMethodY"));
            request.getSession().invalidate();
        }
    %>
</div>
<div class="footer">
    <div class="btn-group btn-group-justified">
        <div class="btn-group">
            <input type="button" value="Solve With Another Task" class="btn btn-success" onclick="location.href='/euler'">
        </div>
        <div class="btn-group">
            <input type="button" value="Back to Main Menu" class="btn btn-primary" onclick="location.href='/'">
        </div>
    </div>
</div>
</body>
</html>
