<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - YÊU THÍCH</title>
    <link rel="icon" type="image/png" href="img/logo.png" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_all_style.css">

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<section class="product-all">
    <div class="product-header">
        <h2 class="titleProduct">SẢN PHẨM YÊU THÍCH</h2>
        <form class="">
            <label>Sắp xếp:</label>
            <select id="sortSelect" onchange="sortProducts()">
                <option value="">Mặc định</option>
                <option value="newest">Mới nhất</option>
                <option value="oldest">Cũ nhất</option>
            </select>
        </form>
    </div>

    <div class="product-container">
        <div class="products" id="productList">
            <c:forEach items="${listFav}" var="p">
                <div class="product-card">
                    <button class="wishlist-btn active">
                        <i class="fas fa-heart"></i>
                    </button>
                    <a href="ProductDetailServlet?id=${p.id}" class="product-link">
                        <div class="set">
                            <img src="${empty p.imageUrl ? 'img/default.png' : p.imageUrl}"
                                 alt="${p.nameProduct}">
                            <h2>${p.nameProduct}</h2>
                            <div class="rating">
                                <i class="ri-star-s-fill"></i>
                                <span>(${p.averageRating != 0 ? p.averageRating : '5.0'})</span>
                            </div>
                            <div class="price">
                                <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                            </div>
                            <div class="fs-stock">
                                <p>Đã bán ${p.totalSold != 0 ? p.totalSold : 0}</p>
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
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="${pageContext.request.contextPath}/js/yeuthich.js"></script>
</html>
