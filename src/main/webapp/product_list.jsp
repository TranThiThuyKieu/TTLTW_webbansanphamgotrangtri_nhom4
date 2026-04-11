<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${listP}" var="p">
    <div class="product-card">
        <button class="wishlist-btn" onclick="toggleWishlist(this, '${p.id}')" title="Thêm vào yêu thích">
            <i class="ri-heart-line"></i>
        </button>
        <a href="ProductDetailServlet?id=${p.id}" class="product-link">
            <div class="set">
                <img src="${pageContext.request.contextPath}/${p.imageUrl}"
                     onerror="this.src='${pageContext.request.contextPath}/img/logo.png'">
                <h2>${p.nameProduct}</h2>
                <div class="rating">
                    <i class="ri-star-s-fill"></i>
                    <span>(${p.averageRating})</span>
                </div>
                <div class="price">
                    <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                </div>
                <div class="fs-stock">
                    <p>Đã bán 2 </p>
                </div>
                <div class="action-buttons">
                    <a href="ProductDetailServlet?id=${p.id}" class="add-cart">Thêm giỏ hàng</a>
                </div>
            </div>
        </a>
    </div>
</c:forEach>