<%@ page import="report.ReportDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 3/3/24
  Time: 2:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PrintWriter script = response.getWriter();
    String wId = request.getParameter("wId");

    Long wIdParam = null;
    if (wId != null && !wId.trim().isEmpty()) {
        try {
            wIdParam = Long.parseLong(wId);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    if (wIdParam != null) {
        try {
            ReportDAO reportDAO = new ReportDAO();
            int n = reportDAO.deleteR(wIdParam);
            if (n > 0) {
                script.println("<script>");
                script.println("alert('삭제 완료!')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                script.println("<script>");
                script.println("alert('에러!!! 관리자에게 문의!!')");
                script.println("history.back()");
                script.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } else {
        script.println("<script>");
        script.println("alert('wId가 올바르지 않습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }

%>
