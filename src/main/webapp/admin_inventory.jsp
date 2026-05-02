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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_import_product.css">
</head>
<body>

<div class="admin-container">
    <%@ include file="admin_header.jsp" %>
    <div class="main-wrapper">
        <%@ include file="admin_sidebar.jsp" %>
        <main class="content">
            <div class="product-management-container">
                <h2 class="page-title">Hệ Thống Quản Lý Kho</h2>
                <div class="tab-menu">
                    <button class="tab-btn active" onclick="openTab(event, 'import-tab')">Phiếu Nhập</button>
                    <button class="tab-btn" onclick="openTab(event, 'export-tab')">Phiếu Xuất</button>
                    <button class="tab-btn" onclick="openTab(event, 'return-tab')">Phiếu Hoàn Trả</button>
                </div>

                <div class="main-card">
                    <div id="import-tab" class="tab-content active">
                        <div class="table-controls">
                            <div class="search-box">
                                <input type="text" placeholder="Tìm mã phiếu nhập...">
                                <i class="fas fa-search"></i>
                            </div>
                            <a href="ImportInventoryStockServlet" class="btn-add-ticket">
                                <i class="fas fa-plus"></i> Tạo Phiếu Nhập
                            </a>
                        </div>
                        <div class="table-responsive">
                            <table class="paper-table">
                                <thead>
                                <tr>
                                    <th>Mã Phiếu</th>
                                    <th>Nhà cung cấp</th>
                                    <th>Người Lập</th>
                                    <th>Ngày Nhập</th>
                                    <th>Tổng giá trị</th>

                                    <th class="text-center">Thao Tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="i" items="${importList}">
                                    <tr>
                                        <td><strong>${i.id}</strong></td>
                                        <td>${i.sourceName}</td>
                                        <td>${i.fullName}</td>
                                        <td>
                                            <fmt:formatDate value="${i.created_at}" pattern="dd/MM/yyyy"/>
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${i.totalAmount}" type="number" groupingUsed="true"/> đ
                                        </td>

                                        <td class="text-center">
                                            <button class="btn-action view">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="export-tab" class="tab-content">
                        <div class="table-controls">
                            <div class="search-box">
                                <input type="text" id="searchExport" placeholder="Tìm mã phiếu xuất...">
                                <i class="fas fa-search"></i>
                            </div>
                            <a href="admin_export_product.jsp" class="btn-add-ticket btn-export-color">
                                <i class="fas fa-plus"></i> Tạo Phiếu Xuất Mới
                            </a>
                        </div>

                        <div class="table-responsive">
                            <table class="paper-table">
                                <thead>
                                <tr>
                                    <th>Mã Phiếu</th>
                                    <th>Người Lập</th>
                                    <th>Ngày Xuất</th>
                                    <th>Lý Do Xuất</th>
                                    <th class="text-center">Thao Tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><strong>PXK-202603002</strong></td>
                                    <td>Trần Thị B</td>
                                    <td>22/03/2026</td>
                                    <td>Xuất bán lẻ</td>
                                    <td class="text-center">
                                        <button class="btn-action view" title="Xem chi tiết"><i class="fas fa-eye"></i></button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>   </div>

                    <div id="return-tab" class="tab-content">
                        <div class="table-controls">
                            <div class="search-box">
                                <input type="text" placeholder="Tìm mã đơn hoàn, khách hàng...">
                                <i class="fas fa-search"></i>
                            </div>
                            <a href="admin_return_product.jsp" class="btn-add-ticket btn-return-color">
                                <i class="fas fa-undo"></i> Tạo Phiếu Hoàn Hàng
                            </a>
                        </div>

                        <div class="table-responsive">
                            <table class="paper-table">
                                <thead>
                                <tr>
                                    <th>Mã Phiếu Hoàn</th>
                                    <th>Mã Đơn Gốc</th>
                                    <th>Khách Hàng</th>
                                    <th>Ngày Hoàn</th>
                                    <th>Lý Do</th>
                                    <th class="text-center">Thao Tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><strong>PHN-20260399</strong></td>
                                    <td>#DH-10254</td>
                                    <td>Lê Văn C</td>
                                    <td>23/03/2026</td>
                                    <td>Khách đổi ý</td>
                                    <td class="text-center">
                                        <button class="btn-action view"><i class="fas fa-eye"></i></button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div> </div>
        </main>


    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/admin_import.js"></script>

</html>