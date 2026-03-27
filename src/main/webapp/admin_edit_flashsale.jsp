<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - CHỈNH SỬA CHUONG TRINH GIAM GIA</title>
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
                <h2 class="page-title">Chỉnh sửa Chương trình giảm giá</h2>

                <form action="FlashSaleController" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${flashSale.id}">
                    <div class="form-container">
                        <div class="form-section">
                            <h3>Thông tin chiến dịch</h3>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Tên chương trình <span class="required">*</span></label>
                                    <input type="text" name="campaignName" placeholder="Ví dụ: Flash Sale ngày 4/4" value="<c:out value='${flashSale != null ? flashSale.campaignName : ""}'/>" required>
                                </div>
                                <div class="form-group">
                                    <label>Ghi chú</label>
                                    <input type="text" name="note" placeholder="Thông tin thêm..." value="<c:out value='${flashSale != null ? flashSale.note : ""}'/>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Ngày bắt đầu</label>
                                    <input type="datetime-local" name="startDate" value="<c:out value='${flashSale != null ? flashSale.startDateString : ""}'/>" required>
                                </div>

                                <div class="form-group">
                                    <label>Ngày kết thúc</label>
                                    <input type="datetime-local" name="endDate"  value="<c:out value='${flashSale != null ? flashSale.endDateString : ""}'/>" required>
                                </div>
                            </div>
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
                                <c:forEach var="d" items="${flashSaleDetails}">
                                <div class="product-variant-card">
                                    <div class="variant-header">
                                        <span>Biến thể #${d.variantId}</span>
                                        <button type="button" class="btn-remove-card" onclick="removeCard(this)"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="variant-body">
                                        <div class="form-row">
                                            <div class="form-group" style="flex: 1.5;">
                                                <label>Mã SKU:</label>
                                                <select name="sku[]" class="sku-select" onchange="updatePrice(this)">
                                                    <option value="0" data-price="0" data-stock="0">-- Chọn sản phẩm --</option>
                                                    <c:forEach var="v" items="${listVariants}">
                                                        <option value="${v.id}" data-price="${v.variant_price}" data-stock="${v.inventory_quantity}"
                                                                <c:if test="${v.id == d.variantId}">selected</c:if>>
                                                                ${v.sku}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Giá gốc (VND):</label>
                                                <input type="text" class="original-price" value="${d.originalPrice}" readonly>
                                            </div>
                                            <div class="form-group">
                                                <label>Giá sau giảm (VND):</label>
                                                <input type="text" class="final-price-display" value="<c:out value='${d.flashPrice > 0 ? d.flashPrice : d.originalPrice * (100 - d.discountPercent)/100}'/>" readonly style="color: #e74c3c; font-weight: bold; background: #fff5f5;">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label>Nhập % giảm:</label>
                                                <input type="number" name="discountPercent[]" class="item-percent" value="${d.discountPercent}" oninput="calculatePrice(this, 'percent')">
                                            </div>
                                            <div class="form-group">
                                                <label>Giá giảm trực tiếp (VND):</label>
                                                <input type="number" name="flashPrice[]" class="item-price" value="${d.flashPrice}" oninput="calculatePrice(this, 'price')">
                                            </div>
                                            <div class="form-group">
                                                <label>Số lượng Sale:</label>
                                                <input type="number" name="saleStock[]" class="item-stock" value="${d.saleStock}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
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