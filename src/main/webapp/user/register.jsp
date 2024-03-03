<%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 2/27/24
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/style2.css">
</head>
<body>
<div class="content" id="/user/register">
    <div class="in">
        <form method="post" action="/user/action/registerAction.jsp">
            <label for="userEmail">이메일 입력</label>
            <input type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요">
            <label for="userPassword1">비밀 번호</label>
            <input type="password" id="userPassword1" name="userPassword1" placeholder="비밀 번호를 입력해주세요">
            <label for="userPassword2">비밀 번호</label>
            <input type="password" id="userPassword2" name="userPassword2" placeholder="비밀 번호를 다시 입력해주세요">
            <label for="userName">별명</label>
            <input type="text" id="userName" name="userName" placeholder="별명을 입력해주세요">
            <label for="userAge">나이</label>
            <input type="number" id="userAge" name="userAge" placeholder="나이를 입력해주세요">
            <br>
            <button type="submit">DONE</button>
        </form>
    </div>
</div>
</body>
</html>
