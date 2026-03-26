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
                    <label for="old-address">Chọn địa chỉ :</label>
                    <div class="selector-row">
                        <select id="old-address" name="address_id">
                            <c:if test="${empty addresses}">
                                <option disabled selected>Chưa có địa chỉ</option>
                            </c:if>
                            <c:forEach var="addr" items="${addresses}" varStatus="status">
                                <option value="${addr.id}"
                                        data-name="${addr.name}"
                                        data-phone="${addr.phone}"
                                        data-detail="${addr.detail}"
                                        data-province="${addr.province}"
                                        data-district="${addr.district}"
                                        data-ward="${addr.ward}"
                                        data-district-id="${addr.district_id}"
                                        data-ward-code="${addr.ward_code}">
                                        ${addr.name} - ${addr.fullAddress}
                                </option>
                            </c:forEach>
                        </select>
                        <button class="btn-add-address" onclick="openAddAddressModal()">THÊM ĐỊA CHỈ</button>
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
                        <label>Địa chỉ chi tiết</label>
                        <div class="info-wrapper">
                            <input type="text" value="Trường Đại học Nông Lâm" placeholder="Địa chỉ cụ thể" readonly>
                        </div>
                    </div>
                    <div class="input-group">
                        <label>Tỉnh/Thành phố</label>
                        <div class="info-wrapper">
                            <input type="text" value="Thành phố Hồ Chí Minh" placeholder="Tỉnh/Thành phố" readonly>
                        </div>
                    </div>
                    <div class="input-group">
                        <label>Quận/Huyện</label>
                        <div class="info-wrapper">
                            <input type="text" value="Quận Thủ Đức" placeholder="Quận/Huyện" readonly>
                        </div>
                    </div>
                    <div class="input-group">
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
                        <c:forEach var="item" items="${selectedCartItems}">
                        <tr class="product-row">
                                <div data-variant-id="${item.variant.id}">
                                    <td>
                                        <span class="product-title">${item.product.nameProduct}</span>
                                        <span class="product-quantity"> &times; ${item.quantity}</span>
                                        <br>
                                        <small>${item.variant.color.colorName} , ${item.variant.size.size_name}</small>
                                    </td>
                                    <td class="text-right">
                                        <fmt:formatNumber value="${item.variant.variant_price}" type="number" groupingUsed="true"/> đ
                                    </td>
                                </div>
                        </tr>
                        </c:forEach>
                    </table>
                </div>

                <div class="summary-footer">
                    <table class="summary-table">
                        <tr class="calc-row divider">
                            <td>Tạm tính</td>
                            <td class="text-right">
                                <fmt:formatNumber value="${total}" type="number" groupingUsed="true"/> đ
                            </td>
                        </tr>
                        <tr class="calc-row">
                            <td>Phí vận chuyển</td>
                            <td id="shipping-fee" class="text-right">0.000 đ</td>
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
                            <td class="text-right total-row-value" data-subtotal="${total}">${total} đ</td>
                        </tr>
                    </table>
                </div>
            </div>
        </aside>
    </div>
</main>
<div id="addressModal" class="modal-overlay">
    <div class="modal-box">
        <h3 id="modalTitle">
            <i class="fas fa-plus-circle"></i> Thêm địa chỉ
        </h3>

        <form action="AddressServlet" method="post" class="modal-form">
            <input type="hidden" name="id" id="addr-id">
            <input type="hidden" name="action" id="addr-action" value="add">

            <div class="form-group">
                <label>Họ tên</label>
                <input name="name" id="addr-name" placeholder="Nhập tên người nhận" required>
            </div>

            <div class="form-group">
                <label>Số điện thoại</label>
                <input name="phone" id="addr-phone" placeholder="Nhập số điện thoại" required>
            </div>

            <div class="form-group">
                <label>Tỉnh / Thành phố</label>
                <select name="province_id" id="province_id"></select>
                <input type="hidden" name="province" id="province_name">
            </div>

            <div class="form-group">
                <label>Quận / Huyện</label>
                <select name="district_id" id="district_id"></select>
                <input type="hidden" name="district" id="district_name">
            </div>

            <div class="form-group">
                <label>Phường / Xã</label>
                <select name="ward_code" id="ward_code"></select>
                <input type="hidden" name="ward" id="ward_name">
            </div>

            <div class="form-group">
                <label>Địa chỉ chi tiết</label>
                <input name="detail" id="addr-detail" placeholder="Số nhà, tên đường" required>
            </div>

            <div class="modal-actions">
                <button type="submit" class="save-btn">Xác nhận</button>
                <button type="button" class="cancel-btn" onclick="closeAddressModal()">Hủy bỏ</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/checkout.js"></script>

</body>
</html>
