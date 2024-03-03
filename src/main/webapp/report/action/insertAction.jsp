<%@ page import="java.io.PrintWriter" %>
<%@ page import="report.ReportVO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="report.ReportDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 3/2/24
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/user/action/loginCheck.jsp"/>
<%
    ReportDAO reportDAO;
    PrintWriter script = response.getWriter();

    Long uId = (Long) session.getAttribute("uId");

    String[] wSub = request.getParameterValues("wSub");
    String wSet = request.getParameter("wSet");
    String wRm = request.getParameter("wRm");
    String wWeights = request.getParameter("wWeights");
    String[] wUnit = request.getParameterValues("wUnit");

    int wSetParam = 0;
    int wRmParam = 0;
    int wWeightsParam = 0;
    String wSubParam = null;
    String wUnitParam = null;

    for(String a : wSub){
        wSubParam = a;
    }
    for(String b : wUnit){
        wUnitParam = b;
    }

    if (wSet == null || wRm == null || wWeights == null || wSet.trim().isEmpty() ||
            wRm.trim().isEmpty() || wWeights.trim().isEmpty()){
        script.println("<script>");
        script.println("alert('모든 항목을 채워 주십쇼.')");
        script.println("history.back()");
        script.println("</script>");
        return;
    }

    try {
        wWeightsParam = Integer.parseInt(wWeights);
        wSetParam = Integer.parseInt(wSet);
        wRmParam = Integer.parseInt(wRm);

        if (wWeightsParam < 0 || wSetParam < 0 || wRmParam < 0) {
            script.println("<script>");
            script.println("alert('무게를 정확히 입력하세요.')");
            script.println("history.back()");
            script.println("</script>");
            return;
        }
    } catch (NumberFormatException e) {
        e.printStackTrace();
        script.println("<script>");
        script.println("alert('숫자 입력에 오류가 있습니다.')");
        script.println("history.back()");
        script.println("</script>");
        return;
    }

    ReportVO reportVO = new ReportVO(0L, uId, wSubParam, wSetParam, wRmParam, wWeightsParam, wUnitParam, null);

    try {
        reportDAO = new ReportDAO();
        int result = reportDAO.insertWorkOut(reportVO);

        if (result > 0) {
            script.println("<script>");
            script.println("alert('운동 저장 성공!')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            script.println("<script>");
            script.println("alert('저장 실패!')");
            script.println("</script>");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
