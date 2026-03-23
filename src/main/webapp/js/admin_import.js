function openTab(evt, tabName) {
    const tabContents = document.getElementsByClassName("tab-content");
    for (let i = 0; i < tabContents.length; i++) tabContents[i].classList.remove("active");

    const tabBtns = document.getElementsByClassName("tab-btn");
    for (let i = 0; i < tabBtns.length; i++) tabBtns[i].classList.remove("active");

    document.getElementById(tabName).classList.add("active");
    evt.currentTarget.classList.add("active");
}

function addRow(tableId) {
    const tableBody = document.querySelector(`#${tableId} tbody`);
    const firstRow = tableBody.querySelector('tr');
    const newRow = firstRow.cloneNode(true);

    newRow.querySelectorAll('input').forEach(input => {
        input.value = (input.name === 'qty[]') ? 1 : (input.name === 'prc[]' ? 0 : '');
    });
    const totalCell = newRow.querySelector('.row-total');
    if(totalCell) totalCell.innerText = "0 đ";

    tableBody.appendChild(newRow);
}

function removeRow(btn, type) {
    const tbody = btn.closest('tbody');
    if (tbody.rows.length > 1) {
        btn.closest('tr').remove();
        if(type === 'import') calculateGrandTotal();
    }
}
