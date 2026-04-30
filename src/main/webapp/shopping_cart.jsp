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


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shopping_cart_style.css">

</head>

<body>

<jsp:include page="header.jsp"/>

<c:set var="cart" value="${sessionScope.CART}"/>

<div class="main-content">
    <div class="cart-page-content-new">

        <div class="shopping-cart-list">

            <div class="cart-header-text">
                Bạn đang có ${fn:length(cart)} sản phẩm trong giỏ hàng
            </div>

            <c:forEach var="item" items="${cartItems}">
                <div class="cart-item" data-variant-id="${item.variant.id}">

                    <input type="checkbox"
                           name="selectedItems"
                           value="${item.variant.id}"
                           class="cart-check"
                           checked
                           onchange="updateTotal()">

                    <div class="product-details">
                        <img src="${item.product.imageUrl}" class="product-image-list">

                        <div class="product-info-list">
                            <div class="product-name-list">
                                    ${item.product.nameProduct}
                            </div>

                            <div class="product-options">
                                Màu: ${item.variant.color.colorName} |
                                Size: ${item.variant.size.size_name}
                            </div>
                        </div>
                    </div>

                    <div class="product-actions-price">

                        <span class="item-price"
                              data-price="${item.variant.variant_price}">
            <fmt:formatNumber value="${item.variant.variant_price}" pattern="#,###"/> đ
        </span>

                        <div class="quantity-control-list">
                            <button type="button"
                                    class="quantity-btn-list"
                                    onclick="changeQty(this, -1)">
                                −
                            </button>

                            <input type="text"
                                   class="quantity-input-list item-qty"
                                   data-id="${item.variant.id}"
                                   value="${item.quantity}"
                                   readonly>

                            <button type="button"
                                    class="quantity-btn-list"
                                    onclick="changeQty(this, 1)">
                                +
                            </button>
                        </div>


                    </div>
                    <a href="RemoveFromCartServlet?variantId=${item.variant.id}"
                       data-variant-id="${item.variant.id}"
                       class="remove-link">
                        <i class="fas fa-trash-alt remove-icon-list"></i>
                    </a>
                </div>


            </c:forEach>

        </div>


        <div class="cart-summary-container">

            <div class="voucher-input">
                <span class="input-title">Nhập Mã Khuyến Mãi</span>
                <input type="text" placeholder="Voucher hoặc gift code">
                <button class="apply-btn">Áp dụng</button>
            </div>



            <div class="summary-title">Thông tin đơn hàng</div>

            <div class="summary-line-new">
                <span>Tạm tính</span>
                <span id="sub-total">
        <fmt:formatNumber value="${subTotal}" pattern="#,###"/> VND
    </span>
            </div>

            <div class="summary-line-new">
                <span>Thuế GTGT (10%)</span>
                <span id="tax-amount">
        <fmt:formatNumber value="${taxAmount}" pattern="#,###"/> VND
    </span>
            </div>


            <div class="summary-line-new total-new">
                <span>Tổng cộng</span>
                <span id="cart-total"
                      style="color: #e54d42; font-weight: bold; font-size: 1.2em;">
        <c:choose>
            <c:when test="${not empty CART and total > 0}">
                <fmt:formatNumber value="${total}" pattern="#,###"/> VND
            </c:when>
            <c:otherwise>
                0 VND
            </c:otherwise>
        </c:choose>
    </span>
            </div>

            <a href="#" class="checkout-btn-new" onclick="handleCheckout(event)">
                Thanh toán
            </a>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/shopping_cart.js"></script>

</body>
</html>
