<%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 3/1/24
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/user/action/loginCheck.jsp"/>
<jsp:include page="/inc/top.jsp"/>
<%
    Long uId = (Long) session.getAttribute("uId");
    if(uId == null){
        response.sendRedirect("/user/login.jsp");
    }
%>

<div class="move" id="body2" style="display: flex; justify-content: space-around; background-color: black">
    <div class="calculator" id="cal">
        <h1>1RM Calculator</h1>
        <label for="weight">리프팅 무게</label>
        <input type="number" id="weight" placeholder="Enter weight lifted" required>

        <label for="reps">반복수</label>
        <input type="number" id="reps" placeholder="Enter number of repetitions" required>

        <button onclick="calculate1RM()">당신의 1RM</button>

        <div id="result">
            <h2>1RM Result:</h2>
            <p id="1rmValue"></p>
        </div>
    </div>
</div>
<jsp:include page="/inc/foot.jsp"/>
<script src="/js/main.js"></script>
<script>
    function calculate1RM() {
        var weight = parseFloat(document.getElementById('weight').value);
        var reps = parseFloat(document.getElementById('reps').value);

        if (isNaN(weight) || isNaN(reps) || weight <= 0 || reps <= 0) {
            alert("Please enter valid values for weight and reps.");
            return;
        }
        var oneRepMax = weight * (1 + 0.0333 * reps);

        document.getElementById('1rmValue').innerHTML = "Your estimated 1RM is: " + oneRepMax.toFixed(2) + " kg";
    }
</script>
