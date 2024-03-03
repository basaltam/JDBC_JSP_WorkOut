<%@ page import="user.UserVO" %><%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 3/1/24
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  //컨텍스트명 구하기
  String ctx=request.getContextPath();
//"/MyWeb"

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>MyWeb</title>
  <link rel="stylesheet" type="text/css"
        href="<%=ctx%>/css/style.css">
</head>
<body>
<div class="wrap">
  <header style="background-color: black">
    <%
      UserVO vo = new UserVO();
    %>
    <div class="navbar_links">
      <a href="<%=ctx%>/report/index.jsp"><span>WELCOME</span></a>
      <a href="<%=ctx%>/report/workOut.jsp"><span>WORK OUT REPORT</span></a>
      <a href="<%=ctx%>/report/1rm.jsp"><span>1RM CALCULATOR</span></a>
      <a href="<%=ctx%>/user/edit.jsp"><span>EDIT ME</span></a>
      <a href="/user/action/logOutAction.jsp"><span>LogOut</span></a>
    </div>
  </header>
