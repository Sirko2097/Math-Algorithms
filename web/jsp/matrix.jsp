<%--
  Created by IntelliJ IDEA.
  User: sirko
  Date: 01.10.18
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Matrix</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="container">
    <div class="jumbotron">
        <h2>Your Variant for Seidel's Method</h2>
        <div align="center">
            <form method="post">
                <div class="form-group">
                <%
                    if (request.getSession().getAttribute("amountOfRows") != null) {
                        out.println("<label align =\"left\" >Input Matrix A</label><br>");
                        int length = Integer.parseInt(String.valueOf(request.getSession().getAttribute("amountOfRows")));
                        for (int i = 0; i < length; i++) {
                            for (int j = 0; j < length; j++) {
                                out.print("<input type=\"text\" name = "+ i + j + " pattern=\"[-+]?[0-9]*\\.?[0-9]+\" title = \"Input number(1 or 1.1)\" required>");
                            }
                            out.println("<br>");
                        }
                        out.println("<br>");
                        out.println("<br>");
                        out.println("<label align =\"left\" >Input Array b</label><br>");
                        for (int i = 0; i < length; i++) {
                            out.println("<input type=\"text\" name = b" + i + " pattern=\"[-+]?[0-9]*\\.?[0-9]+\" title = \"Input number(1 or 1.1)\" required><br>");
                        }
                    }
                %>
                </div>
                <input type="submit" class="btn btn-success btn-block" value="Submit" formmethod="post">
            </form>
        </div>
    </div>
    <div class="footer">
        <div class="btn-group btn-group-justified">
            <div class="btn-group">
                <input type="button" value="Back to Main Menu" class="btn btn-primary" onclick="location.href='/'">
            </div>
        </div>
    </div>
</body>
</html>
