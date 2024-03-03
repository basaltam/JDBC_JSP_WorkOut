<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="user.UserVO" %><%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 3/2/24
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="user.UserVO" scope="page"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userPassword1"/>
<%

  String userEmail = request.getParameter("userEmail");
  String userPassword1 = request.getParameter("userPassword1");
  PrintWriter script = response.getWriter();

  UserDAO userDAO = new UserDAO();
  if(userEmail==null||userEmail.isBlank()||userPassword1==null||userPassword1.isBlank()){
    script.println("<script>");
    script.println("alert('모든 항목을 채워 주십쇼.')");
    script.println("history.back()");
    script.println("</script>");
    return;
  }
  try {
    Long uId = (long) userDAO.getUIdByEmailAndPassword(userEmail, userPassword1);


    if(uId == -1) {
      script.println("<script>");
      script.println("alert('존재하지 않는 이메일입니다.')");
      script.println("history.back()");
      script.println("</script>");
    }else if(uId==-2){
      script.println("<script>");
      script.println("alert('비밀 번호가 맞지 않습니다.')");
      script.println("history.back()");
      script.println("</script>");
    } else{
        session.setAttribute("uId", uId);
        session.setAttribute("userEmail", user.getUserEmail());
        response.sendRedirect("/report/index.jsp");
    }
  } catch (SQLException e) {
    e.printStackTrace();
  }
%>