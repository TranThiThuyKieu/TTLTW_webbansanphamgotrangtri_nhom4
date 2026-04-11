
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product_all_style.css">
    <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="css/search_style.css">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section class="banner-product">

    <img
            src="https://i.pinimg.com/1200x/4d/16/07/4d16076bd71f77a7b5f69963e875cac6.jpg"
            alt="Ảnh trang trí phòng khách"
            class="banner-image"
    />
    <div class="banner-overlay">
        <div class="banner-content">
            <h2>${flashSale.campaignName}</h2>
            <p>${flashSale.note}</p>
        </div>
    </div>
</section>
<jsp:include page="danh_muc_flash_sale.jsp"></jsp:include>
<section class="product-all">
    <div class="product-header">
        <h2 class="titleProduct">TẤT CẢ SẢN PHẨM</h2>
        <form method="get" action="ProductAllFlashSaleServlet" class="sort-form">
            <input type="hidden" name="id" value="${param.id}" />
            <label>Sắp xếp:</label>
            <select name="sort" onchange="this.form.submit()">
                <option value="">Mặc định</option>
                <option value="price_asc" ${param.sort == 'price_asc' ? 'selected' : ''}>
                    Giá tăng dần
                </option>
                <option value="price_desc" ${param.sort == 'price_desc' ? 'selected' : ''}>
                    Giá giảm dần
                </option>
            </select>
        </form>
    </div>
    <div class="product-container">

        <jsp:include page="filter_flashsale.jsp"></jsp:include>
        <div class="products">
            <c:forEach items="${listP}" var="p">
                <div class="product-card">
                    <div class="fs-badge">
                        -${p.discountPercent}%
                    </div>
                    <button class="wishlist-btn" onclick="toggleWishlist(this, '${p.id}')" title="Thêm vào yêu thích">
                        <i class="ri-heart-line"></i>
                    </button>
                    <a href="ProductDetailServlet?id=${p.productId}" class="product-link">
                        <div class="set">
                            <img src="${p.imageUrl}" alt="${p.nameProduct}">
                            <h2>${p.nameProduct}</h2>

                            <div class="rating">
                                <i class="ri-star-s-fill"></i>
                                <span>(${p.averageRating})</span>
                            </div>

                            <div class="price">
                                <c:choose>
                                    <c:when test="${p.originalPrice > p.flashPrice}">
                                        <span class="price-old">
                                            <del>
                                                <fmt:formatNumber value="${p.originalPrice}" type="number"
                                                                  groupingUsed="true"/> VNĐ
                                            </del>
                                        </span>
                                        <br>
                                        <span class="price-sale">
                                            <fmt:formatNumber value="${p.flashPrice}" type="number"
                                                              groupingUsed="true"/> VNĐ
                                        </span>
                                    </c:when>

                                    <c:otherwise>
                                        <span class="price-normal">
                                            <fmt:formatNumber value="${p.originalPrice}" type="number"
                                                              groupingUsed="true"/> VNĐ
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="fs-stock">
                            <p>Đã bán: ${p.sold}</p>
                        </div>
                    </a>

                    <div class="action-buttons">
                        <a href="ProductDetailServlet?id=${p.id}" class="add-cart">Thêm giỏ hàng</a>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty listP}">
                <div class="no-product">
                    <p class="no-product-p">
                        <i class="ri-search-line"></i> Không tìm thấy sản phẩm nào phù hợp.
                    </p>
                </div>
            </c:if>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="${pageContext.request.contextPath}/js/decorate.js"></script>

</html>