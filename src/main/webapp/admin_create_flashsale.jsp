<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - TẠO FLASH SALE</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage_admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_create_voucher.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_create_flashsale.css">
</head>
<body>

<div class="admin-container">
    <%@ include file="admin_header.jsp" %>
    <div class="main-wrapper">
        <%@ include file="admin_sidebar.jsp" %>
        <main class="content">
            <div class="product-management-container">
                <h2 class="page-title">Thiết Lập Chương Trình Flash Sale</h2>

                <form action="FlashSaleController" method="POST">
                    <div class="form-container">
                        <div class="form-section">
                            <h3>Thông tin chiến dịch</h3>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Tên chương trình <span class="required">*</span></label>
                                    <input type="text" name="campaignName" placeholder="Ví dụ: Flash Sale ngày 4/4" required>
                                </div>
                                <div class="form-group">
                                    <label>Khung giờ <span class="required">*</span></label>
                                    <select name="timeSlot" required>
                                        <option value="09:00">09:00 - 12:00</option>
                                        <option value="12:00">12:00 - 15:00</option>
                                        <option value="20:00">20:00 - 23:59</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Ngày diễn ra <span class="required">*</span></label>
                                    <input type="date" name="flashDate" required>
                                </div>
                                <div class="form-group">
                                    <label>Ghi chú</label>
                                    <input type="text" name="note" placeholder="Thông tin thêm...">
                                </div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="section-header-flex">
                                <h3>Sản phẩm tham gia</h3>

                                <div class="bulk-update-tool">
                                    <span class="tool-label"><i class="fas fa-magic"></i> Thiết lập nhanh cho tất cả:</span>
                                    <input type="number" id="bulk-percent" placeholder="% Giảm" oninput="applyBulk('percent')">
                                    <input type="number" id="bulk-direct" placeholder="Giảm trực tiếp" oninput="applyBulk('direct')">
                                    <input type="number" id="bulk-stock" placeholder="Số lượng" oninput="applyBulk('stock')">
                                    <button type="button" class="btn-tool-apply" onclick="applyBulk('all')">Áp dụng</button>
                                </div>
                            </div>

                            <div id="flash-product-list">
                                <div class="product-variant-card">
                                    <div class="variant-header">
                                        <span>Biến thể #1</span>
                                        <button type="button" class="btn-remove-card" onclick="removeCard(this)"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="variant-body">
                                        <div class="form-row">
                                            <div class="form-group" style="flex: 1.5;">
                                                <label>Mã SKU:</label>
                                                <select name="sku[]" class="sku-select" onchange="updatePrice(this)">
                                                    <option value="0" data-price="0">-- Chọn sản phẩm --</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Giá gốc (VND):</label>
                                                <input type="text" class="original-price" value="0" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label>Giá sau giảm (VND):</label>
                                                <input type="text" class="final-price-display" value="0" readonly style="color: #e74c3c; font-weight: bold; background: #fff5f5;">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label>Nhập % giảm:</label>
                                                <input type="number" name="discountPercent[]" class="item-percent" placeholder="20" oninput="calculatePrice(this, 'percent')">
                                            </div>
                                            <div class="form-group">
                                                <label>Giá giảm trực tiếp (VND):</label>
                                                <input type="number" name="flashPrice[]" class="item-price" placeholder="Nhập số tiền giảm..." oninput="calculatePrice(this, 'price')">
                                            </div>
                                            <div class="form-group">
                                                <label>Số lượng Sale:</label>
                                                <input type="number" name="saleStock[]" class="item-stock" value="10">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="add-variant-trigger">
                                <button type="button" class="btn-add-variant" onclick="addNewProductCard()">
                                    <i class="fas fa-plus"></i> Thêm biến thể mới
                                </button>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="button" class="btn-cancel" onclick="history.back()">Hủy bỏ</button>
                            <button type="submit" class="btn-submit" style="background: #8B5E3C;">LƯU CHƯƠNG TRÌNH</button>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/admin_create_flashsale.js"></script>


</body>
</html>