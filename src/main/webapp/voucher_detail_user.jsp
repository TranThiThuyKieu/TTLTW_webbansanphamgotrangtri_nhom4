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
<main class="v-detail-container">
    <div class="v-detail-card">

        <div class="v-preview">
            <div class="v-preview-left">
                <span>HỘI VIÊN</span>
            </div>
            <div class="v-preview-right">
                <p class="v-type-label">Giảm trực tiếp</p>
                <h2 class="v-value">100.000 VNĐ</h2>
                <p class="v-code-text">Mã: <strong>GOLDDECOR2026</strong></p>
            </div>
        </div>

        <div class="v-info-section">
            <h1 class="v-name">Ưu đãi tri ân khách hàng thân thiết</h1>
            <p class="v-desc">Chương trình ưu đãi dành riêng cho các khách hàng đã đồng hành cùng Home Decor. Áp dụng cho toàn bộ danh mục sản phẩm nội thất gỗ trong tháng này.</p>

            <hr class="v-divider">
            <div class="v-specs">
                <p><strong>Điều kiện:</strong> Đơn hàng từ 1.000.000 VNĐ trở lên</p>
                <p><strong>Thời gian áp dụng:</strong> 01/04/2026 - 30/04/2026</p>
                <p><strong>Số lượng mã còn lại:</strong> 45 lượt sử dụng</p>
                <p><strong>Lượt dùng tối đa/người:</strong> 1 lần</p>
            </div>
            <div class="v-note-box">
                <p class="v-note-title"><i class="fas fa-edit"></i> Ghi chú:</p>
                <ul class="v-note-list">
                    <li>Voucher chỉ áp dụng cho các sản phẩm bàn ghế gỗ sồi và gỗ công nghiệp.</li>
                    <li>Không áp dụng đồng thời với các chương trình giảm giá khác tại cửa hàng.</li>
                    <li>Mã giảm giá không có giá trị quy đổi thành tiền mặt.</li>
                </ul>
            </div>

            <div class="v-rank-box">
                <p class="v-rank-title"><i class="fas fa-crown"></i> Chỉ áp dụng cho hạng thẻ:</p>
                <div class="v-rank-tags">
                    <span class="v-tag-item vang">Hạng Vàng</span>
                    <span class="v-tag-item bac">Hạng Bạc</span>
                </div>
            </div>

            <div class="v-action">
                <button class="v-btn-copy" onclick="alert('Đã sao chép mã!')">SAO CHÉP MÃ</button>
                <button class="v-btn-use">QUAY LAI</button>
            </div>
        </div>
    </div>
</main>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
