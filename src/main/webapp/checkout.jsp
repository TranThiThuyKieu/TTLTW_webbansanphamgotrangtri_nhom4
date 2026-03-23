<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - GIỎ HÀNG</title>

    <link rel="icon" href="img/logo.png">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer_user.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">

</head>

<body>

<jsp:include page="header.jsp"/>

<c:set var="cart" value="${sessionScope.CART}"/>
<main class="checkout-container">
    <div class="checkout-layout-wrapper">
        <div class="left-column">
            <section class="billing-details">
                <h2 class="section-title">Chi tiết thanh toán</h2>
                <div class="address-selector">
                    <label for="old-address">Chọn địa chỉ khác:</label>
                    <div class="selector-row">
                        <select id="old-address">
                            <option>Nguyễn Minh Hậu - Trường đại học Nông Lâm</option>
                        </select>
                        <button class="btn-add-address">THÊM ĐỊA CHỈ MỚI</button>
                    </div>
                </div>

                <div class="info-grid">
                    <div class="input-group">
                        <label>Thông tin cá nhân</label>
                        <div class="info-wrapper">
                            <input type="text" value="Nguyễn Minh Hậu" placeholder="Họ và tên" readonly>
                            <i class="fas fa-user"></i>
                        </div>
                    </div>
                    <div class="input-group">
                        <label>&nbsp;</label> <div class="info-wrapper">
                        <input type="text" value="0962967942" placeholder="Số điện thoại" readonly>
                        <i class="fas fa-phone"></i>
                    </div>
                    </div>
                    <div class="input-group">
                        <label>Địa chỉ</label>
                        <div class="info-wrapper">
                            <input type="text" value="Trường Đại học Nông Lâm" placeholder="Địa chỉ cụ thể" readonly>
                        </div>
                    </div>
                    <div class="address-group">
                        <label>Tỉnh/Thành phố</label>
                        <div class="info-wrapper">
                            <input type="text" value="Thành phố Hồ Chí Minh" placeholder="Tỉnh/Thành phố" readonly>
                        </div>
                    </div>
                    <div class="address-group">
                        <label>Quận/Huyện</label>
                        <div class="info-wrapper">
                            <input type="text" value="Quận Thủ Đức" placeholder="Quận/Huyện" readonly>
                        </div>
                    </div>
                    <div class="address-group">
                        <label>Phường/Xã</label>
                        <div class="info-wrapper">
                            <input type="text" value="Phường Bình Thọ" placeholder="Phường/Xã" readonly>
                        </div>
                    </div>
                </div>
            </section>

            <section class="payment-method-section">
                <h2 class="section-title">Phương thức thanh toán</h2>
                <div class="method-box">
                    <label class="radio-container">
                        <input type="radio" name="payment" checked>
                        <span class="checkmark"></span>
                        Thanh toán khi nhận hàng
                    </label>
                    <label class="radio-container">
                        <input type="radio" name="payment">
                        <span class="checkmark"></span>
                        PayPal
                        <img src="https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg" alt="paypal" width="60">
                    </label>
                </div>
                <button class="btn-order">ĐẶT HÀNG</button>
            </section>
        </div>

        <aside class="right-column">
            <div class="order-summary">
                <h2 class="section-title">Tổng sản phẩm</h2>
                <div class="coupon-box">
                    <input type="text" placeholder="Nhập mã giảm giá">
                    <button class="btn-apply">Áp dụng</button>
                </div>

                <div class="product-scroll-area">
                    <table class="summary-table">
                        <tr class="product-row">
                            <td>
                                <span class="product-title">Bàn ăn bằng gỗ đẹp cho gia đình</span>
                                <span class="product-quantity"> &times; 2</span>
                                <br>
                                <small>Màu nâu, 2200x450x500</small>
                            </td>
                            <td class="text-right">50.000 đ</td>
                        </tr>
                        <tr class="product-row">
                            <td>
                                <span class="product-title">Bàn ăn hiện đại cho cặp đôi gỗ MDF</span>
                                <span class="product-quantity">&times; 1</span>
                                <br>
                                <small>Màu đen, 1200x250x300</small>
                            </td>
                            <td class="text-right">15.000 đ</td>
                        </tr>
                        <tr class="product-row">
                            <td>
                                <span class="product-title">Bàn ăn hiện đại cho cặp đôi gỗ MDF</span>
                                <span class="product-quantity">&times; 1</span>
                                <br>
                                <small>Màu đen, 1200x250x300</small>
                            </td>
                            <td class="text-right">15.000 đ</td>
                        </tr>
                        <tr class="product-row">
                            <td>
                                <span class="product-title">Bàn ăn hiện đại cho cặp đôi gỗ MDF</span>
                                <span class="product-quantity">&times; 1</span>
                                <br>
                                <small>Màu đen, 1200x250x300</small>
                            </td>
                            <td class="text-right">15.000 đ</td>
                        </tr>
                        <tr class="product-row">
                            <td>
                                <span class="product-title">Bàn ăn hiện đại cho cặp đôi gỗ MDF</span>
                                <span class="product-quantity">&times; 1</span>
                                <br>
                                <small>Màu đen, 1200x250x300</small>
                            </td>
                            <td class="text-right">15.000 đ</td>
                        </tr>
                        <tr class="product-row">
                            <td>
                                <span class="product-title">Bàn ăn hiện đại cho cặp đôi gỗ MDF</span>
                                <span class="product-quantity">&times; 1</span>
                                <br>
                                <small>Màu đen, 1200x250x300</small>
                            </td>
                            <td class="text-right">15.000 đ</td>
                        </tr>
                        <tr class="product-row">
                            <td>
                                <span class="product-title">Bàn ăn hiện đại cho cặp đôi gỗ MDF</span>
                                <span class="product-quantity">&times; 1</span>
                                <br>
                                <small>Màu đen, 1200x250x300</small>
                            </td>
                            <td class="text-right">15.000 đ</td>
                        </tr>
                        <tr class="product-row">
                            <td>
                                <span class="product-title">Bàn ăn hiện đại cho cặp đôi gỗ MDF</span>
                                <span class="product-quantity">&times; 1</span>
                                <br>
                                <small>Màu đen, 1200x250x300</small>
                            </td>
                            <td class="text-right">15.000 đ</td>
                        </tr>
                        <tr class="product-row">
                            <td>
                                <span class="product-title">Bàn ăn hiện đại cho cặp đôi gỗ MDF</span>
                                <span class="product-quantity">&times; 1</span>
                                <br>
                                <small>Màu đen, 1200x250x300</small>
                            </td>
                            <td class="text-right">15.000 đ</td>
                        </tr>
                    </table>
                </div>

                <div class="summary-footer">
                    <table class="summary-table">
                        <tr class="calc-row divider">
                            <td>Tạm tính</td>
                            <td class="text-right">65.000 đ</td>
                        </tr>
                        <tr class="calc-row">
                            <td>Phí vận chuyển</td>
                            <td class="text-right">25.000 đ</td>
                        </tr>
                        <tr class="calc-row promotion">
                            <td>Giảm giá</td>
                            <td class="text-right">- 0đ</td>
                        </tr>
                        <tr class="calc-row voucher">
                            <td>Voucher</td>
                            <td class="text-right">- 0đ</td>
                        </tr>
                        <tr class="total-row">
                            <td>Tổng cộng</td>
                            <td class="text-right">90.000 đ</td>
                        </tr>
                    </table>
                </div>
            </div>
        </aside>
    </div>
</main>

<jsp:include page="footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/shopping_cart.js"></script>

</body>
</html>
