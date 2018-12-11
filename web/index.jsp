<%--
  Created by IntelliJ IDEA.
  User: sirko
  Date: 25.11.18
  Time: 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Laboratory</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="container">
<div class="jumbotron">
  <div class="page-header">
    <h2 align="center">Greetings, traveler!</h2>
  </div>
  <div>
    <h3>This program was created to solve different mathematical tasks. There I am going to present my laboratories.</h3>
  </div>
  <%
    request.getSession().invalidate();
  %>
</div>
<br>
<h3>First Lab(Calculating the system of equations with using Seidel's method): </h3>
<div class="btn-group btn-group-justified">
  <div class="btn-group">
    <button type="button" class="btn btn-success" id = "seidelExample" onclick="location.href='/seidelExample'">Seidel Method Example</button>
  </div>
  <div class="btn-group">
    <button type="button" class="btn btn-primary" id = "variant" onclick="location.href='/solver'">Your Variant</button>
  </div>
  <div class="btn-group">
    <a href="https://en.wikipedia.org/wiki/Gauss–Seidel_method" target="_blank" class="btn btn-info">Information about method</a>
  </div>
</div>

<br>

<h3>Second Lab(Calculating the integral by using Midpoint Rule): </h3>
<div class="btn-group btn-group-justified">
  <div class="btn-group">
    <button type="button" class="btn btn-success" id = "midPoint" onclick="location.href='/midPoint'">Midpoint Rule</button>
    <%--<button type="button" class="btn btn-success" id = "midPoint" onclick="location.href='/midPoint'">Simpson's Method</button>--%>
  </div>
  <div class="btn-group">
    <a href="https://en.wikipedia.org/wiki/Riemann_sum" target="_blank" class="btn btn-info">Information about method</a>
  </div>
</div>

<br>

<h3>Third Lab(Euler Method): </h3>
<div class="btn-group btn-group-justified">
  <div class="btn-group">
    <button type="button" class="btn btn-success" id = "eulerMethod" onclick="location.href='/euler'">Euler Method</button>
  </div>
  <div class="btn-group">
    <a href="https://en.wikipedia.org/wiki/Euler_method" target="_blank" class="btn btn-info">Information about method</a>
  </div>
</div>

<br>

<h3>Fourth Lab(Nelder Mead Method): </h3>
<div class="btn-group btn-group-justified">
  <div class="btn-group">
    <button type="button" class="btn btn-success" id = "nedlerMeadMethod" onclick="location.href='/nelderMead'">Nelder Mead Method</button>
  </div>
  <div class="btn-group">
    <a href="https://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method" target="_blank" class="btn btn-info">Information about method</a>
  </div>
</div>

</body>
</html>

