<%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 3/2/24
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
Long uId = (Long) session.getAttribute("uId");
  if(uId == null){
    response.sendRedirect("/user/login.jsp");
  }
%>
