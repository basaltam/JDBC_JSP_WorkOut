<%@ page import="user.UserDAO" %>
<%@ page import="user.UserVO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Profile Update</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      background-color: black;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .content {
      text-align: center;
      color: white;
    }

    .in {
      background-color: #333;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
    }

    form {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    label {
      margin-bottom: 10px;
      color: white;
      font-size: 18px;
    }

    input {
      padding: 15px;
      margin-bottom: 20px;
      box-sizing: border-box;
      width: 100%;
      font-size: 18px;
    }

    button {
      background-color: #4CAF50;
      color: white;
      padding: 15px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 100%;
      font-size: 18px;
    }
  </style>
</head>
<body>
<%
  Long uId = (Long) session.getAttribute("uId");
  if (uId == null) {
    response.sendRedirect("/user/login.jsp");
  }

  UserDAO userDAO = new UserDAO();
  UserVO vo = userDAO.findById(uId);
  if (vo == null) {
    response.sendRedirect("/user/login.jsp");
  }
%>
<div class="content">
  <div class="in">
    <form method="post" action="/user/action/editAction.jsp">
      <label for="userEmail">이메일</label>
      <input type="email" id="userEmail" name="userEmail" placeholder="이메일" value="<%=vo.getUserEmail()%>" readonly>

      <label for="currentPassword">현재 비밀번호</label>
      <input type="password" id="currentPassword" name="currentPassword" placeholder="현재 비밀번호" value="" required>

      <label for="newPassword1">새로운 비밀번호</label>
      <input type="password" id="newPassword1" name="newPassword1" placeholder="새로운 비밀번호" value="" required>

      <label for="newPassword2">비밀번호 재입력</label>
      <input type="password" id="newPassword2" name="newPassword2" placeholder="비밀번호 재입력" value="" required>

      <label for="newUserName">별명</label>
      <input type="text" id="newUserName" name="userName" placeholder="별명" value="<%=vo.getUserName()%>" required>

      <label for="newUserAge">나이</label>
      <input type="number" id="newUserAge" name="userAge" placeholder="나이" value="" required>

      <br>
      <button type="submit">수정 완료</button>
      <br>
      <button>나가기</button>
    </form>
  </div>
</div>
</body>
</html>
