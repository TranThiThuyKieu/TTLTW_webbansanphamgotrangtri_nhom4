<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - Voucher ALL</title>
    <link rel="icon" type="image/png" href="img/logo.png" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voucher_all_user.css">
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<main class="v-container">
    <div class="v-section">
        <h2 class="v-title">ƯU ĐÃI HÔM NAY</h2>
        <div class="v-filter-btn">
            <button onclick="filterVoucher('ALL')" class="active">Tất cả</button>
            <button onclick="filterVoucher('NORMAL')">Voucher thường</button>
            <button onclick="filterVoucher('SPECIAL')">Hội viên</button>
        </div>

        <div class="v-grid" id="voucherGrid">
            <c:forEach var="v" items="${voucherList}">

                <div class="v-card" data-type="${v.rewardStyle}">
                    <div class="v-left">
                        <p class="v-label dacquyen">
                            <c:choose>
                                <c:when test="${v.rewardStyle == 'SPECIAL'}">
                                    Ưu đãi hội viên
                                </c:when>
                                <c:otherwise>
                                    Ưu đãi thành viên
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>

                    <div class="v-right">
                        <p class="v-label">
                            <c:choose>
                                <c:when test="${v.promoType == 'PERCENT'}">
                                    Giảm %
                                </c:when>
                                <c:otherwise>
                                    Giảm trực tiếp
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <h3>
                            <c:choose>
                                <c:when test="${v.promoType == 'PERCENT'}">
                                    ${v.promoValue} %
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${v.promoValue}" type="number"/> VNĐ
                                </c:otherwise>
                            </c:choose>
                        </h3>
                        <p class="v-min">
                            Đơn từ <fmt:formatNumber value="${v.minOrderValue}" type="number"/> VNĐ
                        </p>
                        <p class="v-time">
                            HSD: ${v.endDateTimeFormat}
                        </p>
                        <p class="v-quantity">
                            Còn lại: ${v.totalRelease}
                        </p>
                        <div class="v-footer">
                            <span class="v-code">${v.voucherCode}</span>
                            <a href="VoucherDetailServlet?id=${v.id}">Xem chi tiết</a>
                        </div>
                    </div>
                </div>

            </c:forEach>
        </div>
    </div>
</main>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="${pageContext.request.contextPath}/js/voucher_all_user.js"></script>

</html>
