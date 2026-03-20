function openTab(evt, tabName) {
    var i, tabContent, tabBtns;
    tabContent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabContent.length; i++) {
        tabContent[i].classList.remove("active");
    }

    tabBtns = document.getElementsByClassName("tab-btn");
    for (i = 0; i < tabBtns.length; i++) {
        tabBtns[i].classList.remove("active");
    }

    document.getElementById(tabName).classList.add("active");
    evt.currentTarget.classList.add("active");
}
function openColor() {
    document.getElementById('colorId').value = "0";
    document.getElementById('colorName').value = "";
    document.getElementById('colorCode').value = "#000000";
    document.getElementById('colorModal').style.display = 'flex';
}

function editColor(id, name, code) {
    document.getElementById('colorId').value = id;
    document.getElementById('colorName').value = name;
    document.getElementById('colorCode').value = code;
    document.getElementById('colorModal').style.display = 'flex';
}

function deleteColor(id) {
    if (confirm('Bạn có chắc chắn muốn xóa màu này?')) {
        window.location.href = 'admin-attribute?delete=color&id=' + id;
    }
}

function openSize() {
    document.getElementById('sizeId').value = "0";
    document.getElementById('sizeName').value = "";
    document.getElementById('sizeModal').style.display = 'flex';
}

function editSize(id, name) {
    document.getElementById('sizeId').value = id;
    document.getElementById('sizeName').value = name;
    document.getElementById('sizeModal').style.display = 'flex';
}

function deleteSize(id) {
    if (confirm('Bạn có chắc chắn muốn xóa kích thước này?')) {
        window.location.href = 'admin-attribute?delete=size&id=' + id;
    }
}

window.onclick = function(event) {
    let colorModal = document.getElementById('colorModal');
    let sizeModal = document.getElementById('sizeModal');
    if (event.target == colorModal) colorModal.style.display = "none";
    if (event.target == sizeModal) sizeModal.style.display = "none";
}
document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    const tabName = urlParams.get('tab');

    if (tabName === 'size') {
        const sizeBtn = document.querySelector(".tab-btn[onclick*='sizeTab']");
        if (sizeBtn) {
            openTab({ currentTarget: sizeBtn }, 'sizeTab');
        }
    } else {
        const colorBtn = document.querySelector(".tab-btn[onclick*='colorTab']");
        if (colorBtn) {
            openTab({ currentTarget: colorBtn }, 'colorTab');
        }
    }
});