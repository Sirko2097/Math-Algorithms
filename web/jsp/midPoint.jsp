<%--
  Created by IntelliJ IDEA.
  User: sirko
  Date: 08.10.18
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mid Point Rule</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="container">
    <div class="jumbotron">
        <h2>Mid Point method Answer</h2>
        <img src="http://latex.codecogs.com/svg.latex?\int_{a}^{b} (1 - xe^{-x})dx" border="0"/>
    </div>



    <%
        if (request.getSession().getAttribute("midPoint") == null) {
            out.println("<form method=\"post\">\n" +
                    "        <div class=\"form-group\">\n" +
                    "            <label>Input a:</label>\n" +
                    "            <input type=\"text\" title=\"Amount of numbers before and after dot(1-4)\" class=\"form-control\" name=\"a\"\n" +
                    "                   placeholder=\"a\" pattern=\"^[-+]?[0-9]*\\.?[0-9]+\" required>\n" +
                    "        </div>\n" +
                    "        <div class=\"form-group\">\n" +
                    "            <label>Input b:</label>\n" +
                    "            <input type=\"text\" title=\"Amount of numbers before and after dot(1-4)\" class=\"form-control\" name=\"b\"\n" +
                    "                   placeholder=\"b\" pattern=\"[-+]?[0-9]*\\.?[0-9]+\" required>\n" +
                    "        </div>\n" +
                    "        <div class=\"form-group\">\n" +
                    "            <label>Input amount of breakdowns:</label>\n" +
                    "            <input type=\"text\" title=\"It must be from 1 to 9 amount of numbers\" class=\"form-control\" name=\"n\"\n" +
                    "                   placeholder=\"Amount of breakdowns\" pattern=\"\\d{1,9}\" required>\n" +
                    "        </div>\n" +
                    "        <input type=\"submit\" class=\"btn btn-success btn-block\" value=\"Submit\" formmethod=\"post\">\n" +
                    "   </form>");
        } else {
    %>
    <p>Answer:</p>
    <%
        out.println("I = " + request.getSession().getAttribute("midPoint"));
        request.getSession().invalidate();
        }
    %>

    <div class="footer">
        <div class="btn-group btn-group-justified">
            <div class="btn-group">
                <input type="button" value="Solve Another Task" class="btn btn-success" onclick="location.href='/midPoint'">
            </div>
            <div class="btn-group">
                <input type="button" value="Back to Main Menu" class="btn btn-primary" onclick="location.href='/'">
            </div>
        </div>
    </div>
</body>
</html>
