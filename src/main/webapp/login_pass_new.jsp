<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME DECOR - NHẬP MẬT KHẨU MỚI</title>
    <link rel="icon" type="image/png"  href="img/logo.png" >

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pass_new.css">

</head>
<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/ResetPasswordServlet" method="post" class="reset-form">
        <h1>Nhập mật khẩu mới</h1>

        <c:if test="${not empty Error}">
            <div class="error-msg">
                    ${Error}
            </div>
        </c:if>

        <input type="password" name="password" placeholder="Mật khẩu mới" required>
        <div class="password-requirements">
            <ul>
                <li id="length">Ít nhất 8 ký tự</li>
                <li id="lowercase">Ít nhất một ký tự viết thường</li>
                <li id="uppercase">Ít nhất một ký tự viết hoa</li>
                <li id="number">Ít nhất một số</li>
            </ul>
        </div>
        <input type="password" name="re_password" placeholder="Nhập lại mật khẩu" required>

        <button type="submit">Đặt lại mật khẩu</button>
    </form>
</div>
<script src="js/login_pass_new.js"></script>

</body>
</html>