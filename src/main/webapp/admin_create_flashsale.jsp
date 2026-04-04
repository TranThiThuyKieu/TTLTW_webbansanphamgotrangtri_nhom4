<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - TẠO CHUONG TRINH GIAM GIA</title>
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
                <h2 class="page-title">Tạo Chương trình giảm giá</h2>
                <form action="FlashSaleController" method="POST">
                    <input type="hidden" name="action" value="${flashSale != null ? 'update' : 'create'}">
                    <c:if test="${flashSale != null}">
                        <input type="hidden" name="id" value="${flashSale.id}">
                    </c:if>
                    <div class="form-container">
                        <div class="form-section">
                            <h3>Thông tin chiến dịch</h3>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Tên chương trình <span class="required">*</span></label>
                                    <input type="text" name="campaignName" placeholder="Ví dụ: Flash Sale ngày 4/4" required>
                                </div>
                                <div class="form-group">
                                    <label>Ghi chú</label>
                                    <input type="text" name="note" placeholder="Thông tin thêm...">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Ngày bắt đầu</label>
                                    <input type="datetime-local" id="startDate" name="startDate" required>
                                </div>

                                <div class="form-group">
                                    <label>Ngày kết thúc</label>
                                    <input type="datetime-local" id="endDate" name="endDate" required>
                                </div>
                            </div>
                            <div id="timeError" class="alert alert-danger" style="display:none;"></div>
                        </div>

                        <div class="form-section">
                            <div class="section-header-flex">
                                <h3>Sản phẩm tham gia</h3>
                                <div class="bulk-update-tool">
                                    <span class="tool-label">Thiết lập nhanh:</span>
                                    <input type="number" id="bulk-percent" placeholder="% Giảm" oninput="applyBulk('percent')">
                                    <input type="number" id="bulk-direct" placeholder="Giảm trực tiếp" oninput="applyBulk('direct')">
                                    <input type="number" id="bulk-stock" placeholder="Số lượng" oninput="applyBulk('stock')">
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
                                                    <option value="0" data-price="0" data-stock="0">-- Chọn sản phẩm --</option>
                                                    <c:forEach var="v" items="${listVariants}">
                                                        <option value="${v.id}" data-price="${v.variant_price}" data-stock="${v.inventory_quantity}">
                                                                ${v.sku}
                                                        </option>
                                                    </c:forEach>
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
                                                <input type="number" name="saleStock[]" class="item-stock" value="0">
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