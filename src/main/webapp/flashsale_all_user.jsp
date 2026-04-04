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
            <c:forEach items="${saleList}" var="fs">
                <jsp:useBean id="now" class="java.util.Date" />
                <fmt:parseDate value="${fs.startDate}" pattern="yyyy-MM-dd'T'HH:mm" var="startDt" type="both" />
                <fmt:parseDate value="${fs.endDate}" pattern="yyyy-MM-dd'T'HH:mm" var="endDt" type="both" />

                <c:set var="diffMs" value="${startDt.time - now.time}" />
                <c:set var="diffDays" value="${diffMs / (1000 * 60 * 60 * 24)}" />

                <c:choose>
                    <c:when test="${now.after(startDt) && now.before(endDt)}">
                        <div class="sale-card active" data-countdown="${fs.endDate}">
                            <div class="sale-header">
                                <div class="sale-info">
                                    <h2 class="sale-name">${fs.campaignName}</h2>
                                    <a href="FlashSaleDetail?id=${fs.id}" class="view-all">Xem tất cả <i class="ri-arrow-right-s-line"></i></a>
                                </div>
                                <div class="sale-timer">
                                    <span class="status-label">Đang diễn ra:</span>
                                    <div class="countdown-boxes" id="timer-${fs.id}"></div>
                                </div>
                            </div>
                            <p class="sale-note">${fs.note}</p>
                        </div>
                    </c:when>

                    <c:when test="${now.before(startDt) && diffDays < 30}">
                        <div class="sale-card upcoming" data-countdown="${fs.startDate}">
                            <div class="sale-header">
                                <div class="sale-info">
                                    <h2 class="sale-name">${fs.campaignName}</h2>
                                    <span class="view-all disabled">Sắp diễn ra</span>
                                </div>
                                <div class="sale-timer">
                                    <span class="status-label">Bắt đầu sau:</span>
                                    <div class="countdown-boxes" id="timer-${fs.id}"></div>
                                </div>
                            </div>
                            <p class="sale-note">${fs.note}</p>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <div class="sale-card future">
                            <div class="sale-header">
                                <div class="sale-info">
                                    <h2 class="sale-name">${fs.campaignName}</h2>
                                    <span class="view-all disabled">Chưa diễn ra</span>
                                </div>
                                <div class="sale-timer">
                                    <span class="status-label">Bắt đầu vào:</span>
                                    <div class="start-date"><fmt:formatDate value="${startDt}" pattern="dd/MM/yyyy - HH:mm"/></div>
                                </div>
                            </div>
                            <p class="sale-note">${fs.note}</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/flashsale_all_user.js"></script>
</body>
</html>