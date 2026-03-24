<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - TRANG CHỦ</title>
    <link rel="icon" type="image/png"  href="img/logo.png" >
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage_style.css">
    <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.7.0/fonts/remixicon.css"
            rel="stylesheet"
    />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="banner">
    <div class="banner-container">
        <div class="banner-slide active" id="slide-1"
             style="background-image: url('https://i.pinimg.com/1200x/c1/9d/df/c19ddf496eadac9b51cfd9c56c719686.jpg');" >
            <div class="overlay"></div>
        </div>
    </div>
    <div class="banner-slogan">
        <h2>Nơi gỗ kể câu chuyện của không gian.</h2>
        <p>Từng đường vân, sắc màu và cảm hứng từ thiên nhiên được chúng tôi tỉ mỉ chọn lọc và chăm chút, mang đến cảm giác ấm áp, tinh tế và gần gũi – tạo nên không gian hài hòa, chan hòa với thiên nhiên.</p>
    </div>

</div>

<div class="fs-container">
    <div class="fs-header">
        <h2 class="fs-title">FLASH <SALE></SALE></h2>

        <div class="fs-timer">
            <span>02</span> : <span>45</span> : <span>10</span>
        </div>
    </div>

    <div class="products">
        <div class="product-card fs-item">
            <div class="fs-badge">-20%</div>
            <a href="#" class="product-link">
                <img src="https://www.google.com/imgres?q=hinh%20sp%20go&imgurl=https%3A%2F%2Fpng.pngtree.com%2Fthumb_back%2Ffh260%2Fbackground%2F20230814%2Fpngtree-wood-grain-texture-wooden-flooring-design-with-wooden-floor-textures-image_13051712.jpg&imgrefurl=https%3A%2F%2Fvi.pngtree.com%2Ffree-backgrounds-photos%2Fg%25E1%25BB%2597&docid=v7Y09az3PJUaIM&tbnid=u44GgfsJKSFuJM&vet=12ahUKEwjAi4HoiriTAxWjWHADHeQQBKAQnPAOegQIHBAB..i&w=640&h=427&hcb=2&ved=2ahUKEwjAi4HoiriTAxWjWHADHeQQBKAQnPAOegQIHBAB" alt="sp">
                <h2>Kệ Gỗ Thông 3 Tầng</h2>
            </a>
            <div class="rating">
                <i class="ri-star-s-fill"></i>
                <span>(4.5)</span>
            </div>
            <div class="price">
                <span class="fs-old">500.000 VNĐ</span> <br>
                <span class="fs-new">400.000 VNĐ</span>
            </div>
            <div class="fs-stock">
                <div class="stock-bar"><div class="stock-fill" style="width: 70%;"></div></div>
                <p>Đã bán 15</p>
            </div>
            <div class="action-buttons">
                <a href="#" class="buy-now" >MUA NGAY</a>
            </div>
        </div>

        <div class="product-card fs-item">
            <div class="fs-badge">-100.000vndd</div>
            <a href="#" class="product-link">
                <img src="https://www.lazada.vn/products/mo-hinh-go-sai-gon-xua-thu-nho-diy-tiem-sap-kho-ma-sp-sg01-i274484700.html?srsltid=AfmBOooDWWiy0hFjELNdMCyZ28MvjnjTKzrq0cO-y_2hqgSonJxAkc4i" alt="sp">
                <h2>Bàn Trà Gỗ Sồi</h2>
            </a>
            <div class="rating">
                <i class="ri-star-s-fill"></i>
                <span>(5.0)</span>
            </div>
            <div class="price">
                <span class="fs-old">1.000.000 VNĐ</span> <br>
                <span class="fs-new">900.000 VNĐ</span>
            </div>
            <div class="fs-stock">
                <div class="stock-bar"><div class="stock-fill" style="width: 20%;"></div></div>
                <p>Đã bán 2 </p>
            </div>
            <div class="action-buttons">
                <a href="#" class="buy-now" >MUA NGAY</a>
            </div>
        </div>
    </div>
</div>
    <div class="products">
        <c:forEach items="${top3Products}" var="p">
            <div class="product-card">
                <a href="ProductDetailServlet?id=${p.id}" class="product-link">
                    <img src="${p.imageUrl}" alt="${p.nameProduct}">
                    <h2>${p.nameProduct}</h2>
                </a>
                <div class="rating">
                    <i class="ri-star-s-fill"></i>
                    <span>(${p.averageRating})</span>
                </div>
                <div class="price">
                    <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> VNĐ
                </div>
                <div class="action-buttons">
                    <a href="ProductDetailServlet?id=${p.id}" class="add-cart">Thêm giỏ hàng</a>
                    <a href="ProductDetailServlet?id=${p.id}" class="buy-now">Mua hàng</a>
                </div>
            </div>
        </c:forEach>
    </div>



    <section class="intro-section">
        <div class="intro-content">
            <div class="intro-text">
                <h2>An tâm mua sắm với chính sách hỗ trợ toàn diện</h2>
                <p>Chúng tôi luôn đặt lợi ích khách hàng lên hàng đầu. Tìm hiểu về Chính sách Bảo hành, Vận chuyển và Đổi trả để yên tâm lựa chọn sản phẩm ưng ý.</p>
                <a class="menu" href="${pageContext.request.contextPath}/purchasing_policy_user.jsp">
                    Tìm hiểu thêm
                </a>
            </div>
            <div class="intro-image">
                <img src="https://i.pinimg.com/1200x/f3/01/41/f3014120ee3158232a4285f3695663c1.jpg" alt="sp">
            </div>
        </div>
    </section>

<div class="v-section">
    <h2 class="v-title">ƯU ĐÃI ĐẶC BIỆT</h2>
    <div class="v-grid">
        <div class="v-card">
            <div class="v-left"><i class="fas fa-ticket-alt"></i></div>
            <div class="v-right">
                <p class="v-label">Giảm trực tiếp</p>
                <h3>50.000 VNĐ</h3>
                <p class="v-min">Đơn từ 500.000 VNĐ</p>
                <div class="v-footer">
                    <span class="v-code">WOOD50</span>
                    <button class="v-btn">LƯU</button>
                </div>
            </div>
        </div>

        <div class="v-card">
            <div class="v-left"><i class="fas fa-percent"></i></div>
            <div class="v-right">
                <p class="v-label">Chiết khấu</p>
                <h3>GIẢM 10% TỔNG</h3>
                <p class="v-min">Đơn từ 2.000.000 VNĐ</p>
                <div class="v-footer">
                    <span class="v-code">DECOR10</span>
                    <button class="v-btn">LƯU</button>
                </div>
            </div>
        </div>
    </div>
</div>


<section class="san-pham-moi">
    <h2 class="title">SẢN PHẨM BÁN CHẠY</h2>
    <p class="section-desc">Những sản phẩm được khách hàng yêu thích nhất tại Home Decor.</p>
    <div class="san-pham-nb">
        <c:forEach items="${bestSeller}" var="p">
            <div class="product-card">
                <a href="ProductDetailServlet?id=${p.id}" class="product-link">
                    <img src="${p.imageUrl}" alt="${p.nameProduct}">
                    <h2>${p.nameProduct}</h2>
                </a>
                <div class="rating">
                    <i class="ri-star-s-fill"></i>
                    <span>(${p.averageRating})</span>
                </div>
                <div class="price">
                    <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/> VNĐ
                </div>
                <div class="action-buttons">
                    <a href="ProductDetailServlet?id=${p.id}" class="add-cart">Thêm giỏ hàng</a>
                    <a href="ProductDetailServlet?id=${p.id}" class="buy-now">Mua hàng</a>
                </div>
            </div>
        </c:forEach>
    </div>
</section>

<section class="about-section">
    <div class="about-content">
        <div class="about-text">
            <h2>Về <span>HOME DECOR</span></h2>
            <h3>Không Gian Sống – Nơi Cảm Xúc Bắt Đầu</h3>
            <p>
                Home Decor mang đến giải pháp thiết kế nội thất độc đáo, kết hợp giữa phong cách hiện đại
                và tinh thần mộc mạc. Chúng tôi tin rằng mỗi món đồ gỗ đều kể một câu chuyện –
                câu chuyện về gu thẩm mỹ và dấu ấn riêng của bạn.
            </p>
            <div class="about-signature">
                <p><strong>Tran Thi Thuy Kieu</strong><br>Founder & CEO, HOME Decor</p>
            </div>

        </div>

        <div class="about-images">
            <div class="img-top">
                <img src="https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg" alt="Living room decor">
                <img src="https://images.pexels.com/photos/1457841/pexels-photo-1457841.jpeg" alt="Bedroom decor">
            </div>
            <div class="about-card">
                <div class="card-header">
                    <img src="https://i.pinimg.com/736x/ac/ee/d5/aceed58b2efee46f597864ed43a8c291.jpg" alt="user">
                    <div class="card-info">
                        <h4>Xuân Mai</h4>
                        <p>Khách hàng thân thiết</p>
                    </div>
                    <i class="ri-star-s-fill rating"></i><span>(4.9) </span>
                </div>
                <p>
                    “Tôi thật sự ấn tượng với sự tinh tế trong từng chi tiết.
                    Không gian trở nên ấm cúng và sang trọng hơn rất nhiều.”
                </p>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
    var isLogin = ${not empty sessionScope.LOGGED_USER};
</script>
<script src="${pageContext.request.contextPath}/js/homepage.js"></script>
    </html>