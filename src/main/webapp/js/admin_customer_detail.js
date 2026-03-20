function openEditForm() {
    document.getElementById('editProfileModal').style.display = 'flex';
}

function closeEditForm() {
    document.getElementById('editProfileModal').style.display = 'none';
}

function openPassForm() {
    document.getElementById('changePasswordModal').style.display = 'flex';
}

function closePassForm() {
    document.getElementById('changePasswordModal').style.display = 'none';
}

window.onclick = function(event) {
    let editModal = document.getElementById('editProfileModal');
    let passModal = document.getElementById('changePasswordModal');

    if (event.target == editModal) closeEditForm();
    if (event.target == passModal) closePassForm();
};

function selectAvatarWithCKFinder() {

    var finder = new CKFinder();
    finder.basePath = contextPath + '/ckfinder/';

    finder.selectActionFunction = function(fileUrl) {

        var relativeUrl = fileUrl;

        if (contextPath && relativeUrl.startsWith(contextPath)) {
            relativeUrl = relativeUrl.substring(contextPath.length);
        }

        if (relativeUrl && !relativeUrl.startsWith('/')) {
            relativeUrl = '/' + relativeUrl;
        }

        document.getElementById('user-avatar-url').value = relativeUrl;

        document.getElementById('user-avatar-display').src = contextPath + relativeUrl;
    };

    finder.popup();
}

document.addEventListener("DOMContentLoaded", function () {
    let form = document.querySelector('#changePasswordModal form');
    let passError = document.getElementById('passError');

    if (form) {
        form.onsubmit = function(e) {
            let pass = document.getElementById('newPassword').value;
            let confirmPass = document.getElementById('confirmPassword').value;

            let passRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d|.*[!@#$%^&*])(?=\S+$).{8,}$/;

            if (!passRegex.test(pass)) {
                passError.textContent = "Mật khẩu tối thiểu 8 ký tự, bao gồm chữ hoa, chữ thường, số/ký hiệu và không khoảng trắng.";
                passError.style.display = 'block';
                e.preventDefault();
                return false;
            }

            if (pass !== confirmPass) {
                passError.textContent = "Mật khẩu xác nhận không khớp!";
                passError.style.display = 'block';
                e.preventDefault();
                return false;
            }

            let isConfirmed = confirm("Bạn có chắc chắn muốn thay đổi mật khẩu cho người dùng này không?");
            if (!isConfirmed) {
                e.preventDefault();
                return false;
            }

            passError.style.display = 'none';
        };
    }
});