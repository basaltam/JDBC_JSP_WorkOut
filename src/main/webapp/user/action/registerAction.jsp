<%@ page import="user.UserDAO" %>
<%@ page import="user.UserVO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 3/2/24
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="user.UserVO" scope="page"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userPassword1"/>
<jsp:setProperty name="user" property="userPassword2"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userAge"/>
<%
    UserDAO userDAO = new UserDAO();
    UserVO userVO = new UserVO();
    PrintWriter script = response.getWriter();

    String userEmail = request.getParameter("userEmail");
    String userPassword1 = request.getParameter("userPassword1");
    String userPassword2 = request.getParameter("userPassword2");
    String userName = request.getParameter("userName");
    String userAge = request.getParameter("userAge");
    int age = 0;

    if (userEmail == null || userPassword1 == null || userPassword2==null|| userName == null ||userAge == null || userAge.trim().isEmpty()
            || userPassword1.trim().isEmpty() ||userEmail.trim().isEmpty() || userPassword2.trim().isEmpty() ||
            userName.trim().isEmpty()) {
        System.out.println("Debug: Entered validation block");
        System.out.println("Debug: userEmail = " + userEmail);
        System.out.println("Debug: userPassword1 = " + userPassword1);
        System.out.println("Debug: userPassword2 = " + userPassword2);
        System.out.println("Debug: userName = " + userName);
        script.println("<script>");
        script.println("alert('모든 항목을 채워 주십쇼.')");
        script.println("history.back()");
        script.println("</script>");
        return;
    }
    try {
        age = Integer.parseInt(userAge);
        if (age > 100 || 0 >=age) {
            script.println("<script>");
            script.println("alert('나이를 정확히 입력하세요.')");
            script.println("history.back()");
            script.println("</script>");
            return;
        }
    }catch (NumberFormatException e){
        e.printStackTrace();
    }
    if(!userPassword1.equals(userPassword2)){
        script.println("<script>");
        script.println("alert('비밀번호가 일치 하지 않습니다.')");
        script.println("history.back()");
        script.println("</script>");
        return;
    }
    if(userDAO.emailCheck(userEmail)){
        script.println("<script>");
        script.println("alert('존재하는 이메일 입니다.')");
        script.println("history.back()");
        script.println("</script>");
        return;
    }

    userVO = new UserVO(0L, userEmail, userPassword1, userPassword2, userName, age, null);

    String msg = null;
    String loc = null;
    try {
        int result = userDAO.insertUser(user);
        if (result > 0) {
            msg = "회원 가입에 성공했습니다.";
            loc = "/user/login.jsp";
        }else if(result==-1 ) {
            msg = "이미 존재하는 아이디 입니다.";
        }else {
            msg = "회원 가입에 실패했습니다.";
            loc = "/user/register.jsp";
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    script.println("<script>");
    script.println("alert('" + msg + "')");
    script.println("location.href='"+loc+"'");
    script.println("</script>");
%>
