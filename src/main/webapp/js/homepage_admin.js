
function toggleUserMenu() {
    document.getElementById("userMenuContent").classList.toggle("show");
}

window.onclick = function(event) {
    if (!event.target.matches('.user-logo')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (let i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}


function openProductModal(isEdit = false) {
    const modal = document.getElementById('product-modal');
    const modalTitleSpan = document.getElementById('modal-title-product');
    const editButtons = document.querySelectorAll('.product-table .edit-btn');
    editButtons.forEach(button => {
        button.addEventListener('click', () => openProductModal(true));
    });

    if (isEdit) {
        modalTitleSpan.textContent = 'Sửa';

    } else {
        modalTitleSpan.textContent = 'Thêm';
        modal.querySelector('.product-form').reset();
    }
    modal.style.display = 'flex';
}
function openOrderPopup() {
    document.getElementById("orderModal").style.display = "block";
    loadOrderStats('week');
}
function closeOrderPopup() {
    document.getElementById("orderModal").style.display = "none";
}
function loadOrderStats(type) {
    fetch(contextPath + "/OrderStatsServlet?type=" + type)
        .then(res => res.json())
        .then(data => {
            document.getElementById("orderResult").innerHTML =
                "<p>Tổng đơn: " + data.count + "</p>";
        });
}
