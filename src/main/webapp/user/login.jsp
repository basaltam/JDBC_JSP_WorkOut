<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 2/25/24
  Time: 1:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="user.UserVO"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userPassword1"/>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="/css/style2.css">
</head>
<body>
<div class="content" id="Login">
  <div class="in">
    <form action="/user/action/loginAction.jsp" method="POST">

      <label for="userEmail">Email</label>
      <input type="email" id="userEmail" name="userEmail" placeholder="이메일">

      <label for="userPassword1">Password:</label>
      <input type="password" id="userPassword1" name="userPassword1" placeholder="비밀번호">
      <button type="submit">Login</button>
      <br>
      <button type="button" onclick="location.href='/user/register.jsp'">Register</button>
    </form>
  </div>
</div>

</body>
</html>
