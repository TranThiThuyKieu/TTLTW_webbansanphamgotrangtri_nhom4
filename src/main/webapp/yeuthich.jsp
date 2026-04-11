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
            <select name="sort">
                <option value="">Mặc định</option>
                <option value="price_asc">Mới nhất</option>
                <option value="price_desc">Cũ nhất</option>
            </select>
        </form>
    </div>

    <div class="product-container">
        <div class="products" id="productList" >
            <div class="product-card">
                <button class="wishlist-btn"><i class="ri-heart-line"></i></button>
                <div class="set">
                    <img src="https://moho.com.vn/blogs/noi-that-ung-dung/tim-hieu-ve-cac-loai-go-tu-nhien-thong-dung?srsltid=AfmBOopnDq-NilAEiQXtahC83JVuyhgdxK9XWxMGWQAQoXQExRVpiY5y" alt="Sản phẩm 1">
                    <h2>SP gỗ cao cấp gường ngủ 3 tầng</h2>
                    <div class="rating"><i class="ri-star-s-fill"></i> <span>(4.9)</span></div>
                    <div class="price">29,990,000 VNĐ</div>
                    <div class="fs-stock"><p>Đã bán 150</p></div>
                    <div class="action-buttons"><span class="add-cart">Thêm giỏ hàng</span></div>
                </div>
            </div>

            <div class="product-card">
                <button class="wishlist-btn"><i class="ri-heart-line"></i></button>
                <div class="set">
                    <img src="https://moho.com.vn/blogs/noi-that-ung-dung/tim-hieu-ve-cac-loai-go-tu-nhien-thong-dung?srsltid=AfmBOopnDq-NilAEiQXtahC83JVuyhgdxK9XWxMGWQAQoXQExRVpiY5y" alt="Sản phẩm 2">
                    <h2>tủ áo</h2>
                    <div class="rating"><i class="ri-star-s-fill"></i> <span>(4.8)</span></div>
                    <div class="price">24,500,000 VNĐ</div>
                    <div class="fs-stock"><p>Đã bán 89</p></div>
                    <div class="action-buttons"><span class="add-cart">Thêm giỏ hàng</span></div>
                </div>
            </div>

            <div class="product-card">
                <button class="wishlist-btn"><i class="ri-heart-line"></i></button>
                <div class="set">
                    <img src="https://moho.com.vn/blogs/noi-that-ung-dung/tim-hieu-ve-cac-loai-go-tu-nhien-thong-dung?srsltid=AfmBOopnDq-NilAEiQXtahC83JVuyhgdxK9XWxMGWQAQoXQExRVpiY5y" alt="Sản phẩm 3">
                    <h2>giá đỡ bằng gỗ nhẹ maay</h2>
                    <div class="rating"><i class="ri-star-s-fill"></i> <span>(4.7)</span></div>
                    <div class="price">4,990,000 VNĐ</div>
                    <div class="fs-stock"><p>Đã bán 1.2k</p></div>
                    <div class="action-buttons"><span class="add-cart">Thêm giỏ hàng</span></div>
                </div>
            </div>

            <div class="product-card">
                <button class="wishlist-btn"><i class="ri-heart-line"></i></button>
                <div class="set">
                    <img src="https://moho.com.vn/blogs/noi-that-ung-dung/tim-hieu-ve-cac-loai-go-tu-nhien-thong-dung?srsltid=AfmBOopnDq-NilAEiQXtahC83JVuyhgdxK9XWxMGWQAQoXQExRVpiY5y" alt="Sản phẩm 4">
                    <h2>bàn học tiện ích</h2>
                    <div class="rating"><i class="ri-star-s-fill"></i> <span>(4.6)</span></div>
                    <div class="price">18,900,000 VNĐ</div>
                    <div class="fs-stock"><p>Đã bán 45</p></div>
                    <div class="action-buttons"><span class="add-cart">Thêm giỏ hàng</span></div>
                </div>
            </div>

            <div class="product-card">
                <button class="wishlist-btn"><i class="ri-heart-line"></i></button>
                <div class="set">
                    <img src="https://moho.com.vn/blogs/noi-that-ung-dung/tim-hieu-ve-cac-loai-go-tu-nhien-thong-dung?srsltid=AfmBOopnDq-NilAEiQXtahC83JVuyhgdxK9XWxMGWQAQoXQExRVpiY5y" alt="Sản phẩm 5">
                    <h2>Bàn phím gỗ để trưng</h2>
                    <div class="rating"><i class="ri-star-s-fill"></i> <span>(5.0)</span></div>
                    <div class="price">1,250,000 VNĐ</div>
                    <div class="fs-stock"><p>Đã bán 300</p></div>
                    <div class="action-buttons"><span class="add-cart">Thêm giỏ hàng</span></div>
                </div>
            </div>

            <div class="product-card">
                <button class="wishlist-btn"><i class="ri-heart-line"></i></button>
                <div class="set">
                    <img src="https://moho.com.vn/blogs/noi-that-ung-dung/tim-hieu-ve-cac-loai-go-tu-nhien-thong-dung?srsltid=AfmBOopnDq-NilAEiQXtahC83JVuyhgdxK9XWxMGWQAQoXQExRVpiY5y" alt="Sản phẩm 6">
                    <h2>Chuột điêu khắc gỗ</h2>
                    <div class="rating"><i class="ri-star-s-fill"></i> <span>(4.9)</span></div>
                    <div class="price">950,000 VNĐ</div>
                    <div class="fs-stock"><p>Đã bán 2.5k</p></div>
                    <div class="action-buttons"><span class="add-cart">Thêm giỏ hàng</span></div>
                </div>
            </div>

            <div class="product-card">
                <button class="wishlist-btn"><i class="ri-heart-line"></i></button>
                <div class="set">
                    <img src="https://moho.com.vn/blogs/noi-that-ung-dung/tim-hieu-ve-cac-loai-go-tu-nhien-thong-dung?srsltid=AfmBOopnDq-NilAEiQXtahC83JVuyhgdxK9XWxMGWQAQoXQExRVpiY5y" alt="Sản phẩm 7">
                    <h2>Đồng hồ treo tường</h2>
                    <div class="rating"><i class="ri-star-s-fill"></i> <span>(4.8)</span></div>
                    <div class="price">9,200,000 VNĐ</div>
                    <div class="fs-stock"><p>Đã bán 67</p></div>
                    <div class="action-buttons"><span class="add-cart">Thêm giỏ hàng</span></div>
                </div>
            </div>

            <div class="product-card">
                <button class="wishlist-btn"><i class="ri-heart-line"></i></button>
                <div class="set">
                    <img src="https://moho.com.vn/blogs/noi-that-ung-dung/tim-hieu-ve-cac-loai-go-tu-nhien-thong-dung?srsltid=AfmBOopnDq-NilAEiQXtahC83JVuyhgdxK9XWxMGWQAQoXQExRVpiY5y" alt="Sản phẩm 8">
                    <h2>Loa điêu khắc kĩ niệm dùng để trưng</h2>
                    <div class="rating"><i class="ri-star-s-fill"></i> <span>(4.7)</span></div>
                    <div class="price">3,800,000 VNĐ</div>
                    <div class="fs-stock"><p>Đã bán 110</p></div>
                    <div class="action-buttons"><span class="add-cart">Thêm giỏ hàng</span></div>
                </div>
            </div>

        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
