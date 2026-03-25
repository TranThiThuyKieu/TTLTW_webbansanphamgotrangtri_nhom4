<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đánh giá sản phẩm - HOME DECOR</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Review.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="review-container">
    <div class="review-header">
        <h2>ĐÁNH GIÁ SẢN PHẨM</h2>
    </div>
    <c:if test="${not empty sessionScope.successMessage}">
        <div class="alert alert-success">
            <i class="fas fa-check-circle"></i> ${sessionScope.successMessage}
        </div>
        <c:remove var="successMessage" scope="session" />
    </c:if>

    <div class="review-tabs">
        <button class="tab-btn active" onclick="showTab('pending')">Chờ đánh giá</button>
        <button class="tab-btn" onclick="showTab('history')">Lịch sử đánh giá</button>
    </div>

    <div id="pending-section" class="tab-content-review">
        <c:set var="hasPending" value="false" />
        <jsp:useBean id="now" class="java.util.Date" />
        <c:set var="oneDayMs" value="${24 * 60 * 60 * 1000}" />
        <c:set var="sevenDaysInMs" value="${7 * oneDayMs}" />

        <c:forEach items="${allOrders}" var="o">
            <c:if test="${o.status eq 'Đã giao'}">
                <c:set var="diff" value="${now.time - o.createAt.time}" />

                <c:if test="${diff <= sevenDaysInMs}">
                    <c:set var="displayedIdsInOrder" value="|" />

                    <c:forEach items="${o.details}" var="d">
                        <c:set var="currentIdTag" value="|${d.productId}|" />

                        <c:if test="${not fn:contains(displayedIdsInOrder, currentIdTag)}">
                            <c:set var="currentReviewKey" value="${o.id}_${d.productId}" />
                            <c:set var="alreadyReviewed" value="false" />
                            <c:forEach items="${reviewedKeys}" var="key">
                                <c:if test="${key eq currentReviewKey}">
                                    <c:set var="alreadyReviewed" value="true" />
                                </c:if>
                            </c:forEach>

                            <c:if test="${not alreadyReviewed}">
                                <div class="review-item">
                                    <div class="product-info">
                                        <img src="${d.productImg}" alt="Product" class="product-img">
                                        <div class="product-details">
                                            <strong class="product-title">${d.productName}</strong>
                                            <p class="order-code">Mã đơn: #${o.id}</p>
                                            <p class="delivery-date">
                                                <i class="fas fa-shipping-fast"></i> Đã giao: <fmt:formatDate value="${o.createAt}" pattern="dd/MM/yyyy HH:mm"/>
                                            </p>
                                            <p class="expiry-note">
                                                <i class="fas fa-clock"></i> Hạn đánh giá còn:
                                                <c:set var="daysLeft" value="${7 - (diff / oneDayMs).intValue()}" />
                                                <span class="days-highlight">${daysLeft > 0 ? daysLeft : 0} ngày</span>
                                            </p>
                                            <a href="ProductDetailServlet?id=${d.productId}" class="btn-action btn-view">
                                                <i class="fas fa-eye"></i> Xem sản phẩm
                                            </a>
                                        </div>
                                    </div>
                                    <button class="btn-action btn-review" onclick="openReviewModal('${d.productId}', '${fn:escapeXml(d.productName)}', '${o.id}')">
                                        <i class="fas fa-edit"></i> Viết đánh giá
                                    </button>
                                </div>
                                <c:set var="hasPending" value="true" />
                                <c:set var="displayedIdsInOrder" value="${displayedIdsInOrder}${d.productId}|" />
                            </c:if>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:if>
        </c:forEach>

        <c:if test="${not hasPending}">
            <div class="no-data">
                <p>Không có sản phẩm nào chờ đánh giá.</p>
            </div>
        </c:if>
    </div>

    <div id="history-section" class="tab-content-review" style="display:none;">
        <c:choose>
            <c:when test="${empty myReviews}">
                <div class="no-data">Bạn chưa có đánh giá nào.</div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${myReviews}" var="rev">
                    <div class="history-item">
                        <div class="product-info">
                            <img src="${rev.productImg}" alt="Product" class="product-img">
                            <div class="product-details">
                                <div class="history-header" style="display: flex; justify-content: space-between; align-items: flex-start;">
                                    <strong class="product-title">${rev.productName}</strong>
                                    <span class="history-time" >
                                        <i class="far fa-clock"></i>
                                        <c:choose>
                                            <c:when test="${not empty rev.createAt}">
                                                <fmt:formatDate value="${rev.createAt}" pattern="dd/MM/yyyy HH:mm"/>
                                            </c:when>
                                            <c:otherwise>Chưa rõ ngày</c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="stars">
                                    <c:forEach begin="1" end="${rev.rating}">★</c:forEach>
                                    <c:forEach begin="${rev.rating + 1}" end="5">☆</c:forEach>
                                </div>
                                <div class="comment-box" >
                                    <p class="review-comment">"${rev.comment}"</p>
                                </div>
                                <a href="ProductDetailServlet?id=${rev.productId}" class="btn-action btn-view">
                                    <i class="fas fa-redo"></i> Xem lại sản phẩm
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div id="reviewModal" class="modal-overlay">
    <div class="modal-content" >
        <span onclick="closeModal()" class="close-btn">&times;</span>
        <h3 id="modalName">Đánh giá sản phẩm</h3>
        <hr>
        <form action="ReviewServlet" method="POST">
            <input type="hidden" name="productId" id="modalId">
            <input type="hidden" name="orderId" id="modalOrderId">

            <div class="form-group" >
                <label style="display: block">Mức độ hài lòng:</label>
                <select name="rating" class="form-control" >
                    <option value="5">5 Sao - Tuyệt vời</option>
                    <option value="4">4 Sao - Tốt</option>
                    <option value="3">3 Sao - Bình thường</option>
                    <option value="2">2 Sao - Kém</option>
                    <option value="1">1 Sao - Tệ</option>
                </select>
            </div>
            <div class="form-group">
                <label style="display: block">Nhận xét:</label>
                <textarea name="comment" class="form-control" rows="4" required placeholder="Cảm nhận của bạn về sản phẩm "></textarea>
            </div>
            <button type="submit" class="btn-review" >
         GỬI ĐÁNH GIÁ
            </button>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/js/review.js"></script>


</body>
</html>