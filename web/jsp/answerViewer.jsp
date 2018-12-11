<%--
  Created by IntelliJ IDEA.
  User: sirko
  Date: 30.09.18
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Example</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="container">
    <div class="jumbotron">
        <p>Task(eps = <%
            if (request.getSession().getAttribute("eps") != null) {
                out.println(request.getSession().getAttribute("eps"));
            } else {
                out.println(0.001);
            };
        %>): </p>
        <%
            if (request.getSession().getAttribute("matrix") != null && request.getSession().getAttribute("b") != null) {
                double[][] matrix = (double[][]) request.getSession().getAttribute("matrix");
                double[] b = (double[]) request.getSession().getAttribute("b");
                for (int i = 0; i < matrix.length; i++) {
                    for (int j = 0; j < matrix.length; j++) {
                        if (j != matrix.length - 1) {
                            out.println(matrix[i][j] + " * X" + j + " + ");
                        } else {
                            out.println(matrix[i][j] + " * X" + j + " = " + b[i]);
                        }
                    }
                    out.println("<br>");
                }
            }
        %>
    </div>
    <p>Answer:</p>
        <%
            Object[] list = (Object[]) request.getSession().getAttribute("answer");
            for (int i = 0; i < list.length; i++) {
                if (i != list.length - 1)
                    out.println("X" + i + " = " + list[i] + "<br>");
            }
            out.println("\n Amount of iterations: " + list[list.length - 1]);
        %>
    <div class="footer">
        <div class="btn-group btn-group-justified">
            <div class="btn-group">
                <input type="button" value="Solve Another System" class="btn btn-success" onclick="location.href='/solver'">
            </div>
            <div class="btn-group">
                <input type="button" value="Back to Main Menu" class="btn btn-primary" onclick="location.href='/'">
            </div>
        </div>
    </div>
</body>
</html>
