<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - HẠNG NGƯỜI DÙNG</title>
    <link rel="icon" type="image/png" href="img/logo.png" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hang_nguoi_dung.css">

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="membership-detail-container">
    <h2 class="page-title">Quyền Lợi Thành Viên</h2>
    <div class="rank-progress-section">
        <div class="progress-track">
            <div class="progress-bar-bg"></div>
            <div class="progress-bar-fill" style="width: ${progress}%;"></div>
            <div class="rank-step silver active">
                <div class="rank-icon"><i class="fas fa-medal"></i></div>
                <span class="rank-name">Bạc</span>
            </div>
            <div class="rank-step gold">
                <div class="rank-icon"><i class="fas fa-crown"></i></div>
                <span class="rank-name">Vàng</span>
            </div>
            <div class="rank-step diamond">
                <div class="rank-icon"><i class="fas fa-gem"></i></div>
                <span class="rank-name">Kim cương</span>
            </div>
            <div class="user-avatar-progress" style="left: ${progress}%;">
                <img src="https://brocanvas.vn/wp-content/uploads/2024/05/hinh-anh-hoa-hong-dep-nhat-hien-nay.jpg" alt="Me">
                <div class="pointer"></div>
            </div>
        </div>
        <p class="progress-note">
                <c:choose>

                    <c:when test="${currentRank == null}">
                        Bạn cần chi thêm
                        <b>
                            <fmt:formatNumber value="${remainSpending}" type="number"/>₫
                        </b>
                        và mua thêm
                        <b>${remainOrders} đơn</b>
                        để lên hạng <b>${nextRank.rankName}</b>
                    </c:when>

                    <c:when test="${nextRank != null}">
                        Bạn cần chi thêm
                        <b>
                            <fmt:formatNumber value="${remainSpending}" type="number"/>₫
                        </b>
                        và mua thêm
                        <b>${remainOrders} đơn</b>
                        để lên hạng <b>${nextRank.rankName}</b>
                    </c:when>

                    <c:otherwise>
                        Bạn đã đạt hạng cao nhất
                    </c:otherwise>

                </c:choose>
        </p>
    </div>
    <div class="stats-summary-grid">
        <div class="stat-box">
            <i class="fas fa-shopping-bag"></i>
            <div class="stat-info">
                <span>Số đơn hàng (6 tháng)</span>
                <strong>${orders} đơn</strong>
            </div>
        </div>
        <div class="stat-box">
            <i class="fas fa-wallet"></i>
            <div class="stat-info">
                <span>Tổng chi tiêu (6 tháng)</span>
                <strong>
                    <fmt:formatNumber value="${spending}" type="number"/>₫
                </strong>
            </div>
        </div>
    </div>
    <div class="benefit-section">
        <h3>Đặc quyền hạng Bạc</h3>
        <ul class="benefit-list">
            <li><i class="fas fa-check-circle"></i> Nhiều ưu đãi hấp dẫn dành cho hội viên.</li>
            <li><i class="fas fa-check-circle"></i> Quà tặng sinh nhật trị giá 100k.</li>
            <li><i class="fas fa-check-circle"></i> Tích lũy điểm x1.2 so với hạng thường.</li>
        </ul>
        <div class="how-to-up-rank">
            <h4>Làm sao để lên hạng?</h4>
            <p>Hệ thống tự động chốt hạng dựa trên tổng chi tiêu và số đơn hàng thành công trong vòng <b>6 tháng</b> gần nhất. Nếu bạn đạt mốc 5.000.000₫, bạn sẽ được nâng cấp lên hạng Vàng ngay lập tức.</p>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
