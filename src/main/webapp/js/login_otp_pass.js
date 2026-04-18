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

function startResendTimer(duration) {
    const btn = document.getElementById('resend-btn');
    const timerDisplay = document.getElementById('resend-timer');

    let resendEndTime = sessionStorage.getItem('resendEndTime');
    let now = Date.now();

    if (!resendEndTime) {
        resendEndTime = now + duration * 1000;
        sessionStorage.setItem('resendEndTime', resendEndTime);
    }

    let y = setInterval(function () {
        let currentNow = Date.now();
        let distance = resendEndTime - currentNow;
        let seconds = Math.ceil(distance / 1000);

        if (seconds > 0) {
            btn.disabled = true;
            btn.classList.add('disabled-style');
            timerDisplay.textContent = "(" + seconds + "s)";
        } else {
            clearInterval(y);
            btn.disabled = false;
            btn.classList.remove('disabled-style');
            timerDisplay.textContent = "";
            sessionStorage.removeItem('resendEndTime');
        }
    }, 1000);
}

window.onload = function () {
    startMainTimer(60 * 5, document.querySelector('#timer'));
    startResendTimer(30);
};

document.getElementById('resend-btn').onclick = function() {
    sessionStorage.removeItem('otpEndTime');
    sessionStorage.removeItem('resendEndTime');
};

document.getElementById('back-link').onclick = function() {
    sessionStorage.removeItem('otpEndTime');
    sessionStorage.removeItem('resendEndTime');
};