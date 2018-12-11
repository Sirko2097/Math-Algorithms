<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: sirko
  Date: 30.09.18
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="container">
    <div class="jumbotron">
        <h2>Your Variant for Seidel's Method</h2>

        <form method="post">
            <%
                if (request.getSession().getAttribute("amountOfRows") == null) {
            %>
            <div class="form-group">
                <label>Input amount of rows and columns:
                    <input type="text" title="It must be 2->5" class="form-control" name="amountOfRows"
                           placeholder="Amount of rows and columns" pattern="^[2-5]$" required>
                </label>
                <br>
                <label>Input epsilon:
                    <input type="text" title="Default value = 0.001" class="form-control" name="eps"
                           placeholder="Е" pattern="[+]?[0-9]*\.?[0-9]+">
                </label>
            </div>
            <%
                }
            %>
            <div align="center" class="form-group" >
                <%
                    if (request.getSession().getAttribute("amountOfRows") != null) {
                        out.println("<label align =\"left\" >Input Matrix</label><br>");
                        int length = Integer.parseInt(String.valueOf(request.getSession().getAttribute("amountOfRows")));
                        for (int i = 0; i < length; i++) {
                            for (int j = 0; j < length; j++) {
                                out.print("<input type=\"text\" name = "+ i + j + ">");
                            }
                            out.println("<br>");
                        }
                    }
                %>
            </div>
            <%--<button type="submit" class="btn btn-success btn-block">Submit</button>--%>
            <input type="submit" class="btn btn-success btn-block" value="Submit" formmethod="post">
        </form>
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
