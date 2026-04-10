const container = document.getElementById('container');
const overlayBtn = document.getElementById('overlayBtn');
const overlayCon = document.getElementById('overlayCon');

overlayBtn.addEventListener('click', () => {
    container.classList.toggle('right-panel-active');
    if (container.classList.contains('right-panel-active')) {
        overlayCon.style.transform = 'translateX(-150%)';
    } else {
        overlayCon.style.transform = 'translateX(0)';
    }
});
document.querySelector('.overlay-right button').addEventListener('click', () => {
    container.classList.add('right-panel-active');
    overlayCon.style.transform = 'translateX(-150%)';
});

document.querySelector('.overlay-left button').addEventListener('click', () => {
    container.classList.remove('right-panel-active');
    overlayCon.style.transform = 'translateX(0)';
});
let timer = null;
let countdown = 30;
function startCountdown() {
    const resendBtn = document.getElementById("resendBtn");
    if (!resendBtn) return;
    countdown = 30;
    resendBtn.disabled = true;
    resendBtn.innerText = `Gửi lại mã (${countdown}s)`;
    if (timer) clearInterval(timer);
    timer = setInterval(() => {
        countdown--;
        resendBtn.innerText = `Gửi lại mã (${countdown}s)`;
        if (countdown <= 0) {
            clearInterval(timer);
            timer = null;
            resendBtn.disabled = false;
            resendBtn.innerText = "Gửi lại mã";
        }
    }, 1000);
}
document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('container');
    const overlayBtn = document.getElementById('overlayBtn');
    const overlayCon = document.getElementById('overlayCon');
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const activateRightPanel = () => {
        if (container && overlayCon) {
            container.classList.add('right-panel-active');
            overlayCon.style.transform = 'translateX(-150%)';
        }
    };
    const deactivateRightPanel = () => {
        if (container && overlayCon) {
            container.classList.remove('right-panel-active');
            overlayCon.style.transform = 'translateX(0)';
        }
    };
    if (overlayBtn) {
        overlayBtn.addEventListener('click', () => {
            if (container.classList.contains('right-panel-active')) deactivateRightPanel();
            else activateRightPanel();
        });
    }
    if (signUpButton) signUpButton.addEventListener('click', activateRightPanel);
    if (signInButton) signInButton.addEventListener('click', deactivateRightPanel);
    const errorMessages = document.querySelectorAll('.messages .error');
    let hasRegisterError = false;
    errorMessages.forEach(msg => {
        if (msg.innerText.trim() !== "") {
            hasRegisterError = true;
        }
    });
    const otpModal = document.getElementById("otpModal");
    if (hasRegisterError && container && (!otpModal || !otpModal.classList.contains("show"))) {
        activateRightPanel();
    }
    const resendBtn = document.getElementById("resendBtn");
    if (otpModal && otpModal.classList.contains("show")) {
        startCountdown();
    }
    if (resendBtn) {
        resendBtn.addEventListener("click", function () {
            if (this.disabled) return;
            const email = document.getElementById("otpEmail")?.value;
            const resendMsg = document.getElementById("resendMsg");
            if (!email) {
                alert("Không tìm thấy email!");
                return;
            }
            this.disabled = true;
            this.innerText = "Đang gửi...";
            fetch(`${window.location.pathname.split("/")[1] ? "/" + window.location.pathname.split("/")[1] : ""}/RegisterServlet?action=sendOtp`, {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: new URLSearchParams({ email: email })
            })
                .then(res => res.ok ? res.text() : Promise.reject())
                .then(() => {
                    if (resendMsg) resendMsg.innerHTML = "<span style='color:green; font-weight:bold;'> Đã gửi lại mã!</span>";
                    startCountdown();
                })
                .catch(() => {
                    if (resendMsg) resendMsg.innerHTML = "<span style='color:red; font-weight:bold;'> Gửi thất bại!</span>";
                    this.disabled = false;
                    this.innerText = "Gửi lại mã";
                });
        });
    }
});