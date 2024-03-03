function editExercise(wId) {
    if (wId !== null && wId !== undefined) {
        console.log("Trying to edit exercise with wId:", wId);
        const targetElement = document.querySelector(`.wId[value='${parseInt(wId)}']`) || document.querySelector(`.wId[value="${wId}"]`);
        console.log("Target Element:", targetElement);
        if (targetElement) {
            const form = document.getElementById('updateForm');
            const table = document.getElementById('log-body');

            const row = targetElement.parentNode;
            const cells = row.getElementsByTagName('td');
            form.elements['wId2'].value = wId;

            form.elements['updateWSub'].value = cells[2].innerHTML;
            form.elements['updateWSet'].value = cells[3].innerHTML;
            form.elements['updateWRm'].value = cells[4].innerHTML;
            form.elements['updateWWeights'].value = cells[5].innerHTML;
            form.elements['updateWUnit'].value = cells[6].innerHTML.split(' ')[0];
            table.deleteRow(row.rowIndex);

            form.submit();
            row.parentNode.removeChild(row);
        } else {
            console.error(`Element with wId '${wId}' not found.`);
        }
    }

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
    }

    function submitForm() {
        df.submit();
    }
}