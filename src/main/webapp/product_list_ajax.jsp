<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${listFav}" var="p">
    <div class="product-card">
        <button class="wishlist-btn active">
            <i class="fas fa-heart"></i>
        </button>
        <a href="ProductDetailServlet?id=${p.id}" class="product-link">
            <div class="set">
                <img src="${empty p.imageUrl ? 'img/default.png' : p.imageUrl}">
                <h2>${p.nameProduct}</h2>
                <div class="price">
                    <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                </div>
            </div>
        </a>
        <div class="action-buttons">
            <a href="CartServlet?action=add&id=${p.id}" class="add-cart">
                Thêm giỏ hàng
            </a>
        </div>
    </div>
</c:forEach>