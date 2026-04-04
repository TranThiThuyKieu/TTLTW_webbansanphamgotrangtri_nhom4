<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - SẢN PHẨM</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/catelogy_style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flashsale_all_user_style.css">
    <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="css/search_style.css">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section class="flash-sale-container">
    <div class="container">
        <div class="page-title">
            <h1>Chương Trình Ưu Đãi</h1>
            <p>Đừng bỏ lỡ những cơ hội mua sắm tốt nhất tại Home Decor</p>
        </div>

        <div class="sale-events-grid">

            <div class="sale-card active">
                <div class="sale-header">
                    <div class="sale-info">
                        <h2 class="sale-name">FLASH SALE 1/4</h2>
                        <a href="#" class="view-all">Xem tất cả <i class="ri-arrow-right-s-line"></i></a>
                    </div>
                    <div class="sale-timer">
                        <span class="status-label">Đang diễn ra:</span>
                        <div class="countdown-boxes">
                            <span class="box">02</span> : <span class="box">45</span> : <span class="box">10</span>
                        </div>
                    </div>
                </div>
                <p class="sale-note">Chương trình ưu đãi hấp dẫn.</p>
            </div>

            <div class="sale-card upcoming">
                <div class="sale-header">
                    <div class="sale-info">
                        <h2 class="sale-name">XẢ KHO CUỐI THÁNG</h2>
                        <span class="view-all disabled">Sắp diễn ra</span>
                    </div>
                    <div class="sale-timer">
                        <span class="status-label">Bắt đầu sau:</span>
                        <div class="countdown-boxes">
                            <span class="box gray">05</span> : <span class="box gray">12</span> : <span class="box gray">00</span>
                        </div>
                    </div>
                </div>
                <p class="sale-note">Bắt đầu lúc 00:00 - 30/04/2026</p>
            </div>

            <div class="sale-card future">
                <div class="sale-header">
                    <div class="sale-info">
                        <h2 class="sale-name">ĐẠI TIỆC GIÁNG SINH</h2>
                        <span class="view-all disabled">Chưa diễn ra</span>
                    </div>
                    <div class="sale-timer">
                        <span class="status-label">Bắt đàu vào:</span>
                        <div class="start-date">24/12/2026 - 08:00</div>
                    </div>
                </div>
                <p class="sale-note">Sự kiện lớn nhất năm với ưu đãi lên tới 70%.</p>
            </div>

        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>