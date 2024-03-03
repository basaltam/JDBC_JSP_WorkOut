<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="/user/action/loginCheck.jsp"/>
<jsp:include page="/inc/top.jsp" />
<%
    Long uId = (Long) session.getAttribute("uId");
    if(uId == null){
        response.sendRedirect("/user/login.jsp");
    }
%>

<!-- content -->
<div class="move" id="main">
    <div class="landing" id="welcome" >
        <h1></h1>
        <p>
            <span class="typed-text"></span>
            <span class="cursor">&nbsp;</span>
        </p>
    </div>
</div>
<jsp:include page="/inc/foot.jsp" />
<script src="/js/main.js"></script>
