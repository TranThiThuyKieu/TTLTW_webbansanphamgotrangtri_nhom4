
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
            <h2>BỘ SƯU TẬP SẢN PHẨM</h2>
            <p>Nâng tầm không gian sống với những sản phẩm decor tinh tế và hiện đại.</p>
        </div>
    </div>
</section>
<jsp:include page="danh_muc_loc.jsp"></jsp:include>
<section class="product-all">
    <div class="product-header">
        <h2 class="titleProduct">TẤT CẢ SẢN PHẨM</h2>
        <form method="get" action="ProductAllServlet" class="sort-form">
            <label>Sắp xếp:</label>
            <select name="sort" onchange="sortProduct(this.value)">
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

        <jsp:include page="filter.jsp"></jsp:include>
        <div class="products" id="productList">
            <jsp:include page="product_list.jsp"/>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="${pageContext.request.contextPath}/js/decorate.js"></script>

</html>