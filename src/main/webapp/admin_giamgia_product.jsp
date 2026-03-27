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
                    <div id="voucher-tab" class="tab-content active">
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
                                        <a href="VoucherController?action=edit&id=${v.id}" class="btn-action edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <button class="btn-action delete" onclick="deleteVoucher(${v.id})"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="flashsale-tab" class="tab-content">
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
                                    <th>nagfy kết thúc</th>
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
                                            ${fs.flashSaleName}
                                    </td>
                                    <td>${fs.startDate.toString().replace("T", " ")}</td>
                                    <td> ${fs.endDate.toString().replace("T", " ")}</td>
                                    <td>
                                        <c:choose>
                                        <c:when test="${fs.status == 1}">
                                            <span class="status-badge success">Đang diễn ra</span>
                                        </c:when>
                                        <c:when test="${fs.status == 0}">
                                            <span class="status-badge pending">Sắp diễn ra</span>
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
                                        <button class="btn-action edit" onclick="editFlashSale(${fs.id})"><i class="fas fa-edit"></i></button>
                                        <button class="btn-action delete" onclick="deleteFlashSale(${fs.id})"><i class="fas fa-trash"></i></button>
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

</body>
<script src="${pageContext.request.contextPath}/js/admin_giamgia.js"></script>
</html>