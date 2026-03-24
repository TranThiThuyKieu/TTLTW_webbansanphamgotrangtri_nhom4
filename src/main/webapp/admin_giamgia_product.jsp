<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - QUẢN LÝ KHO</title>
    <link rel="icon" type="image/png"  href="../img/logo.png" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage_admin.css">
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
                    <button class="tab-btn active" onclick="openTab(event, 'voucher-tab')">Mã Giảm Giá (Voucher)</button>
                    <button class="tab-btn" onclick="openTab(event, 'flashsale-tab')">Chương Trình Flash Sale</button>
                </div>
                <div class="main-card">
                    <div id="voucher-tab" class="tab-content active">
                        <div class="table-controls">
                            <div class="search-box">
                                <input type="text" placeholder="Tìm mã voucher, tên chương trình...">
                                <i class="fas fa-search"></i>
                            </div>
                            <a href="admin_create_voucher.jsp" class="btn-add-ticket">
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
                                <tr>
                                    <td><span class="code-label">DECO</span></td>
                                    <td>san pham ton</td>
                                    <td>ưu đãi dặc quền</td>
                                    <td>30/04/2026</td>
                                    <td>30/04/2026</td>

                                    <td><span class="status-badge success">Đang chạy</span></td>
                                    <td class="col-status">
                                        <label class="switch">
                                            <input type="checkbox" checked="">
                                            <span class="slider round"></span>

                                        </label>

                                    </td>
                                    <td class="text-center">
                                        <button class="btn-action edit"><i class="fas fa-edit"></i></button>
                                        <button class="btn-action delete"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="flashsale-tab" class="tab-content">
                        <div class="table-controls">
                            <div class="search-box">
                                <input type="text" placeholder="Tìm sản phẩm flash sale...">
                                <i class="fas fa-search"></i>
                            </div>
                            <a href="admin_create_flashsale.jsp" class="btn-add-ticket btn-flash-color">
                                <i class="fas fa-bolt"></i> Thiết Lập Flash Sale
                            </a>
                        </div>

                        <div class="table-responsive">
                            <table class="paper-table">
                                <thead>
                                <tr>
                                    <th>Mã CODE</th>
                                    <th>Tên chương trình</th>
                                    <th>Thời gian kết thúc</th>
                                    <th>Thời gian bắt đầu</th>
                                    <th>Trạng thái</th>
                                    <th>Hoạt động</th>
                                    <th class="text-center">Thao Tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        816482649
                                    </td>
                                    <td>
                                        giam gia tet
                                    </td>
                                    <td>20:00 23/8/2025</td>
                                    <td>20:00 24/8/2026</td>
                                    <td><span class="status-badge pending">Sắp diễn ra</span></td>
                                    <td class="col-status">
                                        <label class="switch">
                                            <input type="checkbox" checked="">
                                            <span class="slider round"></span>
                                        </label>

                                    </td>
                                    <td class="text-center">
                                        <button class="btn-action edit"><i class="fas fa-edit"></i></button>
                                        <button class="btn-action delete"><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
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