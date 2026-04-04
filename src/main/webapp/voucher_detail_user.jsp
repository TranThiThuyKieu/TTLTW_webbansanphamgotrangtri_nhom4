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
                <span><c:choose>
                    <c:when test="${voucher.rewardStyle == 'MEMBER'}">
                        HỘI VIÊN
                    </c:when>
                    <c:otherwise>
                        THÀNH VIÊN
                    </c:otherwise>
                </c:choose></span>
            </div>
            <div class="v-preview-right">
                <p class="v-type-label">
                    <c:choose>
                        <c:when test="${voucher.promoType == 'PERCENT'}">
                            Chiết khấu
                        </c:when>
                        <c:otherwise>
                            Giảm trực tiếp
                        </c:otherwise>
                    </c:choose>
                </p>
                <h2 class="v-value"><c:choose>
                    <c:when test="${voucher.promoType == 'PERCENT'}">
                        ${voucher.promoValue}%
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${voucher.promoValue}" type="number"/> VNĐ
                    </c:otherwise>
                </c:choose></h2>
                <p class="v-code-text">Mã: <strong id="voucherCode">${voucher.voucherCode}</strong></p>
            </div>
        </div>

        <div class="v-info-section">
            <h1 class="v-name">${voucher.voucherName}</h1>
            <p class="v-desc">${voucher.description}</p>

            <hr class="v-divider">
            <div class="v-specs">
                <p><strong>Điều kiện:</strong> <fmt:formatNumber value="${voucher.minOrderValue}" type="number"/> VNĐ</p>
                <p><strong>Thời gian áp dụng:</strong> <fmt:formatDate value="${startDate}" pattern="dd/MM/yyyy HH:mm"/>
                    -
                    <fmt:formatDate value="${endDate}" pattern="dd/MM/yyyy HH:mm"/></p>
                <p><strong>Số lượng mã còn lại:</strong>${voucher.totalRelease}</p>
                <p><strong>Lượt dùng tối đa/người:</strong> ${voucher.maxPerUser}</p>
            </div>
            <div class="v-note-box">
                <p class="v-note-title"><i class="fas fa-edit"></i> Ghi chú:</p>
                <ul class="v-note-list">
                    <li>Không áp dụng đồng thời với các chương trình giảm giá khác tại cửa hàng.</li>
                    <li>Mã giảm giá không có giá trị quy đổi thành tiền mặt.</li>
                </ul>
            </div>

            <div class="v-rank-box">
                <p class="v-rank-title"><c:choose>
                    <c:when test="${voucher.rewardStyle == 'MEMBER'}">
                        Chỉ áp dụng cho hạng thẻ:
                    </c:when>
                    <c:otherwise>
                        Áp dụng cho:
                    </c:otherwise>
                </c:choose></p>
                <div class="v-rank-tags">
                    <c:choose>
                        <c:when test="${voucher.rewardStyle == 'MEMBER'}">
                            <c:forEach var="r" items="${voucher.applicableRanks}">
                                <span class="v-tag-item">${r}</span>
                            </c:forEach>
                        </c:when>

                        <c:otherwise>
                          Tất cả khách hàng
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="v-action">
                <button class="v-btn-copy" onclick="alert('Đã sao chép mã!')">SAO CHÉP MÃ</button>
                <button class="v-btn-use" onclick="history.back()" >QUAY LAI</button>
            </div>
        </div>
    </div>
</main>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
