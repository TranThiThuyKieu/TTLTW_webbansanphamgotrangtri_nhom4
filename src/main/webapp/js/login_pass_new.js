const passwordInput = document.querySelector('input[name="password"]');
const form = document.querySelector('.reset-form');
const rePasswordInput = document.querySelector('input[name="re_password"]');

const rules = {
    length: document.getElementById("length"),
    lowercase: document.getElementById("lowercase"),
    uppercase: document.getElementById("uppercase"),
    number: document.getElementById("number")
};

if (passwordInput) {
    passwordInput.addEventListener("input", function () {
        const value = this.value;

        const checks = {
            length: value.length >= 8,
            lowercase: /[a-z]/.test(value),
            uppercase: /[A-Z]/.test(value),
            number: /[0-9]/.test(value)
        };

        Object.keys(checks).forEach(key => {
            if (checks[key]) {
                rules[key].classList.add("valid");
            } else {
                rules[key].classList.remove("valid");
            }
        });
    });
}
function isValidPassword(value) {
    return value.length >= 8 &&
        /[a-z]/.test(value) &&
        /[A-Z]/.test(value) &&
        /[0-9]/.test(value);
}

if (form) {
    form.addEventListener("submit", function (e) {
        const password = passwordInput.value;
        const rePassword = rePasswordInput.value;

        if (!isValidPassword(password)) {
            e.preventDefault();
            alert("Mật khẩu chưa đủ điều kiện!");
            return;
        }

        if (password !== rePassword) {
            e.preventDefault();
            alert("Mật khẩu nhập lại không khớp!");
            return;
        }
    });
}