<%@ page import="user.UserDAO" %>
<%@ page import="user.UserVO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%
    Long uId = (Long) session.getAttribute("uId");
    PrintWriter script = response.getWriter();
    if (uId == null) {
        response.sendRedirect("/user/login.jsp");
    }

    String userEmail = request.getParameter("userEmail");
    String currentPassword = request.getParameter("currentPassword");
    String newPassword1 = request.getParameter("newPassword1");
    String newPassword2 = request.getParameter("newPassword2");
    String newUserName = request.getParameter("userName");
    String newUserAgeStr = request.getParameter("userAge");

    if (currentPassword == null || newPassword1 == null || newPassword2 == null || newUserName == null || newUserAgeStr == null
            || currentPassword.trim().isEmpty() || newPassword1.trim().isEmpty() || newPassword2.trim().isEmpty() || newUserName.trim().isEmpty() || newUserAgeStr.trim().isEmpty()) {
        script.println("<script>");
        script.println("alert('모든 항목을 다 채워주세요'");
        script.println("<script>");
        return;
    }

    int newUserAge;
    try {
        newUserAge = Integer.parseInt(newUserAgeStr);
        if (newUserAge > 100 || newUserAge <= 0) {
            System.out.println("Debug: Invalid age.");
            return;
        }
    } catch (NumberFormatException e) {
        e.printStackTrace();
        return;
    }

    if (!newPassword1.equals(newPassword2)) {
        script.println("<script>");
        script.println("alert('비밀번호가 일치 하지 않습니다.'");
        script.println("<script>");
        return;
    }

    UserDAO userDAO = new UserDAO();
    UserVO existingUser = userDAO.findById(uId);

    if (!existingUser.getUserPassword1().equals(currentPassword)) {
        script.println("<script>");
        script.println("alert('현재 비밀번호가 일치 하지 않습니다.'");
        script.println("<script>");
        return;
    }

    UserVO updatedUser = new UserVO(uId, userEmail, newPassword1, newPassword2, newUserName, newUserAge, null);

    int result;
    try {
        result = userDAO.updateMember(updatedUser);
    } catch (SQLException e) {
        e.printStackTrace();
        return;
    }


    if (result > 0) {
        script.println("<script>");
        script.println("alert('정보 수정 완료')");
        response.sendRedirect("/user/login.jsp");
        script.println("<script>");
    } else {

        script.println("<script>");
        script.println("alert('정보 수정 실패! 관리자에게 문의 하세요!')");
        script.println("history.back()");
        script.println("<script>");

    }
%>
