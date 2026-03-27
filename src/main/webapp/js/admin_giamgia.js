document.addEventListener('DOMContentLoaded', function() {
    const voucherSearch = document.getElementById('voucherSearch');
    if(voucherSearch){
        voucherSearch.addEventListener('input', function() {
            const filter = this.value.toLowerCase();
            const rows = document.querySelectorAll('#voucher-tab tbody tr');
            rows.forEach(row => {
                const code = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
                const name = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                row.style.display = (code.includes(filter) || name.includes(filter)) ? '' : 'none';
            });
        });
    }

    const flashSaleSearch = document.getElementById('flashSaleSearch');
    if(flashSaleSearch){
        flashSaleSearch.addEventListener('input', function() {
            const filter = this.value.toLowerCase();
            const rows = document.querySelectorAll('#flashsale-tab tbody tr');
            rows.forEach(row => {
                const name = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                row.style.display = name.includes(filter) ? '' : 'none';
            });
        });
    }
});
function toggleStatus(id, checkbox) {
    const status = checkbox.checked ? 1 : 0;

    fetch('VoucherController', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'action=toggleStatus&id=' + id + '&status=' + status
    })
        .then(res => res.text())
        .then(data => {
            console.log("Updated:", data);
        })
        .catch(err => {
            console.error(err);
            alert("Lỗi cập nhật trạng thái!");
        });
}