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