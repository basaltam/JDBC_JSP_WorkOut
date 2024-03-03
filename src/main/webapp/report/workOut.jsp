<%@ page import="report.ReportDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="report.ReportVO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserVO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: patricksmacbookair
  Date: 3/1/24
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/inc/top.jsp"/>
<jsp:useBean id="dao" class="report.ReportDAO" scope="session"/>
<%
  ReportDAO reportDAO = new ReportDAO();
  Long uId = (Long) session.getAttribute("uId");
  Long wId = (Long) request.getAttribute("wId");

//  String wId2 = (String) request.getAttribute("wId2");
//  String[] wSub = (String[]) request.getAttribute("wSub");
//  String wSet = (String) request.getAttribute("wSet");
//  String wRm = (String) request.getAttribute("wRm");
//  String wWeights = (String) request.getAttribute("wWeights");
//  String[] wUnit = (String[]) request.getAttribute("wUnit");
%>
<div id="body" class="move" style="display: flex; justify-content: space-around">
  <div id="workOut">
    <form action="/report/action/insertAction.jsp" method="post" name="sf">
      <label for="wSub">Exercise:</label>
      <select id="wSub" name="wSub">
        <option value="SQUAT">SQUAT</option>
        <option value="DEAD LIFT">DEAD LIFT</option>
        <option value="BENCH PRESS">Bench Press</option>
        <option value="OHP">OHP</option>
        <option value="BARBELL LOW">Barbell Low</option>
        <!-- Add more exercise options as needed -->
      </select>

      <label for="wSet">Sets:</label>
      <input type="number" id="wSet" name="wSet" required>

      <label for="wRm">RM:</label>
      <input type="number" id="wRm" name="wRm" required>

      <label for="wWeights">Weight:</label>
      <input type="number" id="wWeights" name="wWeights" required>

      <label for="wUnit">Unit:</label>
      <select id="wUnit" name="wUnit">
        <option value="kg">kg</option>
        <option value="lb">lb</option>
      </select>

      <button onclick="saveExercise()" >Save</button>
    </form>
  </div>

  <div id="exercise-log">
      <h2>Exercise Log</h2>
      <div class="table-container" style="overflow: auto; max-height: 300px; width: 180%; left: 100%">
      <table>
        <thead>
        <tr>
          <th>Date</th>
          <th>Exercise</th>
          <th>Sets</th>
          <th>RM</th>
          <th>Weight</th>
          <th>Unit</th>
          <th>Action</th>
        </tr>
        </thead>

        <%
          if(uId == null){
            response.sendRedirect("/user/login.jsp");
          } else{
          ArrayList<ReportVO> arr = reportDAO.findList(uId, wId);
          if(arr==null|| arr.size() ==0){
        %>
        <tr>
          <td colspan="6">EMPTY DATA</td>
        </tr>
        <%
          }else{

        %>
        <tbody id="log-body" style="overflow: auto; width: 100px;">
        <% for(ReportVO vo : arr){
          %>
        <tr>
          <td style="display: none" class="wId"><%=vo.getWId()%></td>
          <td class="wDate"><%=vo.getwDate()%></td>
          <td class="wSub"><%=vo.getWSub()%></td>
          <td class="wSet"><%=vo.getWSet()%></td>
          <td class="wRm"><%=vo.getWRm()%></td>
          <td class="wWeights"><%=vo.getwWeights()%></td>
          <td class="wUnit"><%=vo.getWUnit()%></td>
          <td class="edit-delete-buttons">
            <button onclick="deleteExercise('<%=vo.getWId()%>')">Delete</button>
          </td>

        </tr>
          <% }
          }
          }
          %>
        </tbody>

      </table>
        <form id="updateForm" action="/report/action/updateAction.jsp" method="post" style="display: none;">
          <input type="hidden" id="wId2" name="wId2">
          <input type="hidden" id="updateWSub" name="wSub">
          <input type="hidden" id="updateWSet" name="wSet">
          <input type="hidden" id="updateWRm" name="wRm">
          <input type="hidden" id="updateWWeights" name="wWeights">
          <input type="hidden" id="updateWUnit" name="wUnit">
        </form>
        </form>
        <form action="/report/action/deleteAction.jsp" method="post" name="df">
          <input type="hidden" name="wId" id="wId">
        </form>
      </div>
  </div>
</div>
<script>
  // function goDel(wId) {
  //
  // }

  // function prepareUpdate(wId, wSub, wSet, wRm, wWeights, wUnit) {
  //   // Set values in the hidden form
  //   document.getElementById('wId2').value = wId;
  //   document.getElementById('updateWSub').value = wSub;
  //   document.getElementById('updateWSet').value = wSet;
  //   document.getElementById('updateWRm').value = wRm;
  //   document.getElementById('updateWWeights').value = wWeights;
  //   document.getElementById('updateWUnit').value = wUnit;
  //
  //   // Submit the hidden form to go to the update page
  //   document.getElementById('updateForm').submit();

  function saveExercise(wId, uId, wSub, wSet, wRm, wWeights, wUnit, wDate) {
    sf.uId.value = '<%= uId %>';
    sf.wDate.value = '';
    sf.wSub.value = document.getElementById('wSub').value;
    sf.wSet.value = document.getElementById('wSet').value;
    sf.wRm.value = document.getElementById('wRm').value;
    sf.wWeights.value = document.getElementById('wWeights').value;
    sf.wUnit.value = document.getElementById('wUnit').value;
    sf.wId.value = '<%= wId %>';
    sf.submit();

    const table = document.getElementById('log-body');
    const newRow = table.insertRow(-1);
    const cells = [
      newRow.insertCell(0),
      newRow.insertCell(1),
      newRow.insertCell(2),
      newRow.insertCell(3),
      newRow.insertCell(4),
      newRow.insertCell(5),
      newRow.insertCell(6),
      newRow.insertCell(7),
    ];

    cells[0].innerHTML = '';
    cells[1].innerHTML = '';
    cells[2].innerHTML = wSub;
    cells[3].innerHTML = wSet;
    cells[4].innerHTML = wRm;
    cells[5].innerHTML = wWeights;
    cells[6].innerHTML = wUnit;
    cells[7].innerHTML = `
      <button onclick="editExercise('<%=wId%>')">Edit</button>
      <button onclick="deleteExercise('<%=wId%>')">Delete</button>`;

    document.getElementById('wSub').value = '';
    document.getElementById('wSet').value = '';
    document.getElementById('wRm').value = '';
    document.getElementById('wWeights').value = '';
    document.getElementById('wUnit').value = '';
  }

  function deleteExercise(wId) {
    df.wId.value = wId;
    let yn = confirm("정말 삭제하시겠습니까?");
    if (yn) {
      df.submit();
    }
    function submitForm() {
      df.submit();
    }
  }

  const row = document.querySelector('tr[data-wId="' + wId + '"]');

  // Get the values from the row
  const wSub = row.querySelector('.wSub').textContent;
  const wSet = row.querySelector('.wSet').textContent;
  const wRm = row.querySelector('.wRm').textContent;
  const wWeights = row.querySelector('.wWeights').textContent;
  const wUnit = row.querySelector('.wUnit').textContent;

  // Set values in the hidden form
  document.getElementById('wId2').value = wId;
  document.getElementById('updateWSub').value = wSub;
  document.getElementById('updateWSet').value = wSet;
  document.getElementById('updateWRm').value = wRm;
  document.getElementById('updateWWeights').value = wWeights;
  document.getElementById('updateWUnit').value = wUnit;

  // Show an alert to edit the values
  alert('Exercise details for ' + wSub + ':\nSets: ' + wSet + '\nRM: ' + wRm + '\nWeight: ' + wWeights);

  // Submit the hidden form to go to the update page
  document.getElementById('updateForm').submit();
</script>
<jsp:include page="/inc/foot.jsp"/>
