<%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 3/2/24
  Time: 8:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("/user/login.jsp");
%>
