<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - Voucher ALL</title>
    <link rel="icon" type="image/png" href="img/logo.png" >
    <link rel="stylesheet" href="css/voucher_all_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer_user.css">

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<main class="v-container">
    <div class="v-section">
        <h2 class="v-title">ƯU ĐÃI ĐẶC BIỆT</h2>

        <div class="v-filter">
            <button class="v-f-btn active" onclick="filterVouchers('all', this)">Tất cả</button>
            <button class="v-f-btn" onclick="filterVouchers('thuong', this)">Voucher thường</button>
            <button class="v-f-btn" onclick="filterVouchers('uudai', this)">Voucher ưu đãi</button>
        </div>

        <div class="v-grid" id="voucherGrid">
            <div class="v-card" data-type="uudai">
                <div class="v-left"><i class="fas fa-crown"></i>
                    <p class="v-label dacquyen">uu dai hội viên</p>
                </div>
                <div class="v-right">
                    <p class="v-label">Giảm trực tiếp</p>
                    <span class="v-tag hang">Vàng , bacj</span>
                    <h3>100.000 VNĐ</h3>
                    <p class="v-min">Đơn từ 1.000.000 VNĐ</p>
                    <p class="v-time">HSD: 2026</p>
                    <p class="v-quantity">Còn lại: 05</p>

                    <div class="v-footer">
                        <span class="v-code">GOLDDECOR</span>
                        <button class="v-btn">LƯU</button>
                    </div>
                </div>
            </div>
            <div class="v-card" data-type="thuong">
                <div class="v-left">
                    <p class="v-label dacquyen">uu dai thanh vien</p>
                </div>
                <div class="v-right">
                    <p class="v-label">Giảm trực tiếp</p>
                    <h3>50.000 VNĐ</h3>
                    <p class="v-min"> Đơn từ 500.000 VNĐ</p>
                    <p class="v-time">
                        HSD: 2009
                    </p>
                    <p class="v-quantity">
                        Còn lại: 09
                    </p>

                    <div class="v-footer">
                        <span class="v-code">WOOD50</span>
                        <button class="v-btn">LƯU</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
