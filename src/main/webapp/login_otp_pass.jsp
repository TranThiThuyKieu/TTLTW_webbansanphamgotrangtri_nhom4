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

        <button type="submit">Tiếp tục</button>
        <div class="resend">
            <button type="submit"
                    formaction="${pageContext.request.contextPath}/ResendOtpServlet"
                    formnovalidate
                    class="resend-btn">
                Gửi lại mã
            </button>
        </div>


        <a href="login_forgot_password.jsp">Quay lại</a>
    </form>
</div>

</body>
</html>