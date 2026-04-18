<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME DECOR - NHẬP MÃ XÁC NHẬP</title>
    <link rel="icon" type="image/png"  href="img/logo.png" >

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/otp_pass.css">

</head>
<body>

<div class="container">
    <form action="${pageContext.request.contextPath}/VerifyOtpResetServlet" method="post" class="otp-form">
        <h1>Nhập mã xác nhận</h1>

        <c:if test="${not empty Error}">
            <div class="error-msg">
                    ${Error}
            </div>
        </c:if>

        <input type="text" name="otp" placeholder="Nhập mã OTP" required>
        <p id="countdown-text">
            Mã hết hạn sau: <span id="timer" >05:00</span>
        </p>

        <button type="submit">Tiếp tục</button>
        <div class="resend">
            <button type="submit"
                    id="resend-btn"
                    formaction="${pageContext.request.contextPath}/ResendOtpServlet"
                    formnovalidate
                    class="resend-btn">
                Gửi lại mã<span id="resend-timer"></span>
            </button>
        </div>


        <a href="login_forgot_password.jsp">Quay lại</a>
    </form>
</div>
<script>
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
        startResendTimer(60);
    };

    document.getElementById('resend-btn').onclick = function() {
        sessionStorage.removeItem('otpEndTime');
        sessionStorage.removeItem('resendEndTime');
    };

    document.getElementById('back-link').onclick = function() {
        sessionStorage.removeItem('otpEndTime');
        sessionStorage.removeItem('resendEndTime');
    };
</script>

</body>
</html>