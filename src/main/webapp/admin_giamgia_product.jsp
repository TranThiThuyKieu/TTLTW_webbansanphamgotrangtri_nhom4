<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - QUẢN LÝ KHO</title>
    <link rel="icon" type="image/png"  href="../img/logo.png" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage_admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_products.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_import_product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_giamgia_product.css">
</head>
<body>

<div class="admin-container">
    <%@ include file="admin_header.jsp" %>
    <div class="main-wrapper">
        <%@ include file="admin_sidebar.jsp" %>
        <main class="content">
            <div class="product-management-container">
                <h2 class="page-title">Hệ Thống Quản Lý Khuyến Mãi</h2>
                <div class="tab-menu">
                    <a href="VoucherAdminServlet" class="tab-btn ${activeTab=='voucher'?'active':''}">Mã Giảm Giá (Voucher)</a>
                    <a href="FlashSaleAdminServlet" class="tab-btn ${activeTab=='flashsale'?'active':''}">Chương Trình Flash Sale</a>
                </div>
                <div class="main-card">
                    <div id="voucher-tab" class="tab-content ${activeTab=='voucher' ? 'active' : ''}">
                        <div class="table-controls">
                            <div class="search-box">
                                <input type="text" id="voucherSearch" placeholder="Tìm mã voucher, tên chương trình...">
                                <i class="fas fa-search"></i>
                            </div>
                            <a href="VoucherController" class="btn-add-ticket">
                                <i class="fas fa-ticket-alt"></i> Tạo Voucher Mới
                            </a>
                        </div>

                        <div class="table-responsive">
                            <table class="paper-table">
                                <thead>
                                <tr>
                                    <th>Mã Code</th>
                                    <th>Tên chuương trình</th>
                                    <th>Loại ưu dãi</th>
                                    <th>Ngày bắt đầu</th>
                                    <th>Ngày kết thúc</th>
                                    <th>Trạng Thái</th>
                                    <th>Hoạt động</th>

                                    <th class="text-center">Thao Tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listVoucher}" var="v">
                                <tr>
                                    <td><span class="code-label">${v.voucherCode}</span></td>
                                    <td>${v.voucherName}</td>
                                    <td><c:choose>
                                        <c:when test="${v.promoType == 'PERCENT'}">
                                            Giảm ${v.promoValue}%
                                        </c:when>
                                        <c:otherwise>
                                            Giảm <fmt:formatNumber value="${v.promoValue}" pattern="#,###"/>đ
                                        </c:otherwise>
                                    </c:choose>
                                    </td>
                                    <td>${v.startDate.toString().replace("T", " ")}</td>
                                    <td>${v.endDate.toString().replace("T", " ")}</td>
                                    <td>
                                        <c:set var="now" value="<%= java.time.LocalDateTime.now() %>" />
                                        <c:choose>
                                            <c:when test="${v.startDate > now}">
                                                <span class="status-badge pending">Sắp diễn ra</span>
                                            </c:when>
                                            <c:when test="${v.startDate <= now and v.endDate >= now}">
                                                <span class="status-badge success">Đang hoạt động</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge danger">Đã kết thúc</span>
                                            </c:otherwise>
                                    </c:choose>
                                    </td>
                                    <td class="col-status">
                                        <label class="switch">
                                            <input type="checkbox" ${v.status == 1 ? 'checked' : ''}
                                                   onchange="toggleStatus(${v.id}, this)">
                                            <span class="slider round"></span>
                                        </label>
                                    </td>
                                    <td class="text-center">
                                        <a href="javascript:void(0)" onclick="showVoucherDetail(${v.id})">
                                            <i class="fas fa-eye" title="Xem chi tiết"></i>
                                        </a>
                                        <a href="VoucherController?action=edit&id=${v.id}" class="btn-action edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <button class="btn-action delete" onclick="deleteVoucher(${v.id})"><i class="fas fa-trash"></i></button>
                                        <div id="data-voucher-${v.id}" class="voucher-detail-hidden" style="display:none;">
                                            <h2> Chi tiết Voucher </h2>
                                            <h3 class="order-detail-title">
                                                Mã Code: ${v.voucherCode}
                                            </h3>
                                            <div class="order-info-row">
                                                <div>
                                                    <p><strong>Tên:</strong> ${v.voucherName}</p>
                                                    <p><strong>Mô tả:</strong> ${v.description}</p>
                                                    <p><strong>Loại:</strong> ${v.promoType}</p>
                                                </div>
                                                <div class="text-right">
                                                    <p><strong>Bắt đầu:</strong> ${v.startDate.toString().replace("T"," ")}</p>
                                                    <p><strong>Kết thúc:</strong> ${v.endDate.toString().replace("T"," ")}</p>
                                                </div>
                                            </div>
                                            <div class="summary-horizontal-card">
                                                <div class="summary-section">
                                                    <span class="summary-title">Giá trị giảm</span>
                                                    <span class="summary-amount">
                                                        <c:choose>
                                                            <c:when test="${v.promoType == 'PERCENT'}">${v.promoValue}%
                                                            </c:when>
                                                            <c:otherwise><fmt:formatNumber value="${v.promoValue}" pattern="#,###"/>đ
                                                            </c:otherwise>
                                                        </c:choose></span>
                                                </div>
                                                <div class="summary-divider-vertical"></div>
                                                <div class="summary-section">
                                                    <span class="summary-title">Đơn tối thiểu</span>
                                                    <span class="summary-amount"><fmt:formatNumber value="${v.minOrderValue}" pattern="#,###"/>đ</span>
                                                </div>
                                                <div class="summary-divider-vertical"></div>
                                                <div class="summary-section">
                                                    <span class="summary-title">Số lượng phát hành</span>
                                                    <span class="summary-amount">${v.totalRelease}</span>
                                                </div>
                                                <div class="summary-divider-vertical"></div>
                                                <div class="summary-section">
                                                    <span class="summary-title">Giới hạn/user</span>
                                                    <span class="summary-amount">${v.maxPerUser}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="flashsale-tab" class="tab-content ${activeTab=='flashsale' ? 'active' : ''}">
                        <div class="table-controls">
                            <div class="search-box">
                                <input type="text" id="flashSaleSearch" placeholder="Tìm sản phẩm flash sale...">
                                <i class="fas fa-search"></i>
                            </div>
                            <a href="FlashSaleController" class="btn-add-ticket btn-flash-color">
                                <i class="fas fa-bolt"></i> Tạo chương trình giảm giá
                            </a>
                        </div>

                        <div class="table-responsive">
                            <table class="paper-table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên chương trình</th>
                                    <th>Ngày bắt đầu</th>
                                    <th>Ngày kết thúc</th>
                                    <th>Trạng thái</th>
                                    <th>Hoạt động</th>
                                    <th class="text-center">Thao Tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listFlashSale}" var="fs">
                                <tr>
                                    <td>
                                            ${fs.id}
                                    </td>
                                    <td>
                                            ${fs.campaignName}
                                    </td>
                                    <td>${fs.startDate.toString().replace("T", " ")}</td>
                                    <td> ${fs.endDate.toString().replace("T", " ")}</td>
                                    <td>
                                        <c:set var="now" value="<%= java.time.LocalDateTime.now() %>" />
                                        <c:choose>
                                            <c:when test="${fs.startDate > now}">
                                                <span class="status-badge pending">Sắp diễn ra</span>
                                            </c:when>
                                            <c:when test="${fs.startDate <= now && fs.endDate >= now}">
                                                <span class="status-badge success">Đang diễn ra</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge danger">Đã kết thúc</span>
                                            </c:otherwise>
                                    </c:choose></td>
                                    <td class="col-status">
                                        <label class="switch">
                                            <input type="checkbox" ${fs.status == 1 ? 'checked' : ''} onchange="toggleFlashSaleStatus(${fs.id}, this)">
                                            <span class="slider round"></span>
                                        </label>

                                    </td>
                                    <td class="text-center">
                                        <a href="javascript:void(0)" onclick="showPromotionDetail(${fs.id})">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="FlashSaleController?action=edit&id=${fs.id}" class="btn-action edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <button class="btn-action delete" onclick="deleteFlashSale(${fs.id})"><i class="fas fa-trash"></i></button>
                                        <div id="data-flashsale-${fs.id}" class="voucher-detail-hidden" style="display:none;">
                                            <h2>Chi tiết Flash Sale</h2>

                                            <h3 class="order-detail-title">
                                                    ${fs.campaignName}
                                            </h3>

                                            <div class="order-info-row">
                                                <div>
                                                    <p><strong>Ghi chú:</strong> ${fs.note}</p>
                                                </div>
                                                <div class="text-right">
                                                    <p><strong>Bắt đầu:</strong> ${fs.startDate.toString().replace("T"," ")}</p>
                                                    <p><strong>Kết thúc:</strong> ${fs.endDate.toString().replace("T"," ")}</p>
                                                </div>
                                            </div>

                                            <h3>Danh sách sản phẩm</h3>

                                            <table class="paper-table">
                                                <thead>
                                                <tr>
                                                    <th>SKU</th>
                                                    <th>Giá gốc</th>
                                                    <th>Giảm (%)</th>
                                                    <th>Giá Flash</th>
                                                    <th>Kho bán</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${fs.details}" var="d">
                                                    <tr>
                                                        <td>${d.sku}</td>
                                                        <td><fmt:formatNumber value="${d.originalPrice}" pattern="#,###"/>đ</td>
                                                        <td>${d.discountPercent}%</td>
                                                        <td><fmt:formatNumber value="${d.flashPrice}" pattern="#,###"/>đ</td>
                                                        <td>${d.saleStock}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<div id="voucherModal" class="modal">
    <div class="modal-content">
        <span onclick="closeVoucherModal()" class="modal-close">&times;</span>
        <div id="voucherModalContainer"></div>
    </div>
</div>
<div id="promotionModal" class="modal">
    <div class="modal-content">
        <span onclick="closePromotionModal()" class="modal-close">&times;</span>
        <div id="promotionModalContainer"></div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/admin_giamgia.js"></script>
</html>