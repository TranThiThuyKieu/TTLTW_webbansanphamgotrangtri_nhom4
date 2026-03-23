// 1. Chuyển Tab
function openTab(evt, tabName) {
    const tabContents = document.getElementsByClassName("tab-content");
    for (let i = 0; i < tabContents.length; i++) tabContents[i].classList.remove("active");

    const tabBtns = document.getElementsByClassName("tab-btn");
    for (let i = 0; i < tabBtns.length; i++) tabBtns[i].classList.remove("active");

    document.getElementById(tabName).classList.add("active");
    evt.currentTarget.classList.add("active");
}

// 2. Thêm dòng
function addRow(tableId) {
    const tableBody = document.querySelector(`#${tableId} tbody`);
    const firstRow = tableBody.querySelector('tr');
    const newRow = firstRow.cloneNode(true);

    // Reset inputs
    newRow.querySelectorAll('input').forEach(input => {
        input.value = (input.name === 'qty[]') ? 1 : (input.name === 'prc[]' ? 0 : '');
    });
    const totalCell = newRow.querySelector('.row-total');
    if(totalCell) totalCell.innerText = "0 đ";

    tableBody.appendChild(newRow);
}

// 3. Xóa dòng
function removeRow(btn, type) {
    const tbody = btn.closest('tbody');
    if (tbody.rows.length > 1) {
        btn.closest('tr').remove();
        if(type === 'import') calculateGrandTotal();
    }
}

// 4. Tính toán tiền (Nhập kho)
function updateRowTotal(input, type) {
    if(type !== 'import') return;
    const row = input.closest('tr');
    const qty = parseFloat(row.querySelector('input[name="qty[]"]').value) || 0;
    const price = parseFloat(row.querySelector('input[name="prc[]"]').value) || 0;
    const total = qty * price;

    row.querySelector('.row-total').innerText = total.toLocaleString('vi-VN') + " đ";
    calculateGrandTotal();
}

function calculateGrandTotal() {
    let grand = 0;
    document.querySelectorAll('#importTable .row-total').forEach(el => {
        grand += parseInt(el.innerText.replace(/[^0-9]/g, '')) || 0;
    });
    document.getElementById('grandTotalImport').innerText = grand.toLocaleString('vi-VN') + " đ";
}