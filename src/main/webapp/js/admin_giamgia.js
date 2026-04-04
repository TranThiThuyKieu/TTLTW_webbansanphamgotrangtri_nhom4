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
function toggleFlashSaleStatus(id, checkbox) {
    const status = checkbox.checked ? 1 : 0;

    fetch('FlashSaleController', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'action=toggleStatus&id=' + id + '&status=' + status
    })
        .then(res => res.text())
        .then(data => {
            console.log("FlashSale updated:", data);
        })
        .catch(err => {
            console.error(err);
            alert("Lỗi cập nhật trạng thái FlashSale!");
        });
}
function deleteVoucher(id) {
    if(confirm("Bạn có chắc muốn xóa voucher này?")) {
        fetch(`VoucherController?action=delete&id=${id}`, {
            method: 'POST'
        })
            .then(res => res.text())
            .then(data => {
                if(data === 'OK'){
                    alert('Xóa voucher thành công!');
                    location.reload();
                } else {
                    alert('Xóa voucher thất bại!');
                }
            });
    }
}
function deleteFlashSale(id) {
    if(confirm("Bạn có chắc muốn xóa chương trình Flash Sale này?")) {
        fetch(`FlashSaleController?action=delete&id=${id}`, {
            method: 'POST'
        })
            .then(res => res.text())
            .then(data => {
                if(data === 'OK'){
                    alert('Xóa Flash Sale thành công!');
                    location.reload();
                } else {
                    alert('Xóa Flash Sale thất bại!');
                }
            });
    }
}
function showVoucherDetail(id) {
    let dataContainer = document.getElementById("data-voucher-" + id);
    if (dataContainer) {
        let data = dataContainer.innerHTML;
        document.getElementById("voucherModalContainer").innerHTML = data;
        document.getElementById("voucherModal").style.display = "block";
    }
}
function closeVoucherModal() {
    document.getElementById("voucherModal").style.display = "none";
}
function showPromotionDetail(id) {
    let dataContainer = document.getElementById("data-flashsale-" + id);
    if (dataContainer) {
        let data = dataContainer.innerHTML;
        document.getElementById("promotionModalContainer").innerHTML = data;
        document.getElementById("promotionModal").style.display = "block";
    }
}
function closePromotionModal() {
    document.getElementById("promotionModal").style.display = "none";
}
window.onclick = function(event) {
    let modal = document.getElementById("voucherModal");
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
function toggleFlashSaleStatus(id, checkbox) {
    let status = checkbox.checked ? 1 : 0;

    fetch("FlashSaleController", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: `action=toggleStatus&id=${id}&status=${status}`
    })
        .then(res => res.json())
        .then(data => {
            if (data.error) {
                alert("Không thể bật do trùng thời gian!");

                checkbox.checked = !checkbox.checked;
            }
        })
        .catch(err => {
            console.error(err);

            checkbox.checked = !checkbox.checked;
        });
}