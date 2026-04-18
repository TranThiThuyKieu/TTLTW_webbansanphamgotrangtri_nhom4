document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('container');
    const overlayCon = document.getElementById('overlayCon');
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const overlayBtn = document.getElementById('overlayBtn');

    console.log("Sign In Button:", signInButton);
    console.log("Sign Up Button:", signUpButton);

    const activateRightPanel = () => {
        if (container && overlayCon) {
            container.classList.add('right-panel-active');
            overlayCon.style.transform = 'translateX(-150%)';
            console.log("Đã chuyển sang Tab Đăng Ký");
        }
    };

    const deactivateRightPanel = () => {
        if (container && overlayCon) {
            container.classList.remove('right-panel-active');
            overlayCon.style.transform = 'translateX(0)';
            console.log("Đã chuyển sang Tab Đăng Nhập");
        }
    };

    if (signUpButton) {
        signUpButton.onclick = activateRightPanel;
    }

    if (signInButton) {
        signInButton.onclick = deactivateRightPanel;
    }

    if (overlayBtn) {
        overlayBtn.onclick = () => {
            container.classList.contains('right-panel-active')
                ? deactivateRightPanel()
                : activateRightPanel();
        };
    }

    const errorMessages = document.querySelectorAll('.messages .error');
    let hasRegisterError = false;
    errorMessages.forEach(msg => {
        if (msg.innerText.trim() !== "") hasRegisterError = true;
    });

    const otpModal = document.getElementById("otpModal");
    if (hasRegisterError && container && (!otpModal || !otpModal.classList.contains("show"))) {
        activateRightPanel();
    }

    let timer = null;
    const resendBtn = document.getElementById("resendBtn");

    function startCountdown() {
        if (!resendBtn) return;
        let countdown = 30;
        resendBtn.disabled = true;
        if (timer) clearInterval(timer);

        timer = setInterval(() => {
            countdown--;
            resendBtn.innerText = `Gửi lại mã (${countdown}s)`;
            if (countdown <= 0) {
                clearInterval(timer);
                resendBtn.disabled = false;
                resendBtn.innerText = "Gửi lại mã";
            }
        }, 1000);
    }

    if (otpModal && otpModal.classList.contains("show")) {
        startCountdown();
    }

    if (resendBtn) {
        resendBtn.addEventListener("click", function() {
            const email = document.getElementById("otpEmail")?.value;
            if (!email) return alert("Không tìm thấy email!");

            this.disabled = true;
            this.innerText = "Đang gửi...";

            const contextPath = window.location.pathname.split("/")[1];
            const url = (contextPath ? "/" + contextPath : "") + "/RegisterServlet?action=sendOtp";

            fetch(url, {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: new URLSearchParams({ email: email })
            })
                .then(res => {
                    if(res.ok) {
                        document.getElementById("resendMsg").innerHTML = "<span style='color:green;'>Đã gửi lại!</span>";
                        startCountdown();
                    } else {
                        throw new Error();
                    }
                })
                .catch(() => {
                    this.disabled = false;
                    this.innerText = "Gửi lại mã";
                    alert("Gửi mã thất bại!");
                });
        });
    }
    const passwordInput = document.querySelector('input[name="password"]');
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

    document.querySelectorAll('.sign-up-form').forEach(f => {
        f.addEventListener("submit", function (e) {
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
    });
    function startMainTimer(duration, display) {
        let endTime = sessionStorage.getItem('otpEndTime');
        let now = Date.now();

        if (!endTime || now > endTime) {
            endTime = now + duration * 1000;
            sessionStorage.setItem('otpEndTime', endTime);
        }

        let x = setInterval(function () {
            now = Date.now();
            let distance = endTime - now;

            let minutes = Math.floor(distance / (1000 * 60));
            let seconds = Math.floor((distance % (1000 * 60)) / 1000);

            display.textContent = (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds);

            if (distance <= 0) {
                clearInterval(x);
                display.textContent = "00:00";
                document.getElementById('main-countdown').innerHTML = "Mã đã hết hạn!";
                sessionStorage.removeItem('otpEndTime');
            }
        }, 1000);
    }
    window.onload = function () {
        startMainTimer(60 * 5, document.querySelector('#timer'));
    };
});