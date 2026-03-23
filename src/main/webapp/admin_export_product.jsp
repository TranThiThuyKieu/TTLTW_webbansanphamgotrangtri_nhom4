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
</head>
<body>

<div class="admin-container">
    <%@ include file="admin_header.jsp" %>
    <div class="main-wrapper">
        <%@ include file="admin_sidebar.jsp" %>
        <main class="content">
            <div class="product-management-container">
                <h2 class="page-title">Hệ Thống Quản Lý Kho</h2>

<%--                <div class="tab-menu">--%>
<%--                    <button class="tab-btn" onclick="openTab(event, 'import-tab')">Phiếu Nhập</button>--%>
<%--                    <button class="tab-btn active" onclick="openTab(event, 'export-tab')">Phiếu Xuất</button>--%>
<%--                    <button class="tab-btn" onclick="openTab(event, 'return-tab')">Phiếu Hoàn Trả</button>--%>
<%--                </div>--%>

                <div id="import-tab" class="tab-content active">
                                    <div class="paper-form paper-export">
                                        <form action="send-request-export" method="POST" class="document-form">
                                            <div class="paper-header">
                                                <div class="document-type">PHIẾU YÊU CẦU XUẤT KHO</div>
                                                <div class="document-no">Số: PXK-20260323</div>
                                            </div>

                                            <div class="paper-info-grid">
                                                <div class="info-item">
                                                    <label>Người nhận/Đại lý:</label>
                                                    <input type="text" name="customer" class="minimal-input" placeholder="Tên khách hàng...">
                                                </div>
                                                <div class="info-item">
                                                    <label>Lý do xuất:</label>
                                                    <select name="reason" class="minimal-input">
                                                        <option value="Bán hàng">Bán hàng</option>
                                                        <option value="Trả hàng">Trả hàng NCC</option>
                                                        <option value="Tiêu hủy">Tiêu hủy/Hỏng</option>
                                                    </select>
                                                </div>
                                                <div class="info-item">
                                                    <label>Ngày xuất:</label>
                                                    <input type="date" name="exportDate" class="minimal-input" value="2026-03-23">
                                                </div>
                                            </div>

                                            <table class="paper-table" id="exportTable">
                                                <thead>
                                                <tr>
                                                    <th>Tên mặt hàng</th>
                                                    <th width="80">SL</th>
                                                    <th width="140">Ghi chú</th>
                                                    <th width="40"></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <select name="vId[]" class="minimal-input">
                                                        </select>
                                                    </td>
                                                    <td><input type="number" name="qty[]" value="1" min="1" class="minimal-input text-center"></td>
                                                    <td><input type="text" name="note[]" class="minimal-input" placeholder="..."></td>
                                                    <td><button type="button" class="btn-clear" onclick="removeRow(this, 'export')">×</button></td>
                                                </tr>
                                                </tbody>
                                            </table>

                                            <button type="button" class="btn-text-add" onclick="addRow('exportTable')">+ Thêm mặt hàng xuất</button>

                                            <div class="confirmation-box">
                                                <label class="checkbox-container">
                                                    <input type="checkbox" name="confirmExport" required>
                                                    <span class="checkmark"></span>
                                                    Xác nhận xuất kho và giảm trừ tồn kho hệ thống.
                                                </label>
                                                <button type="submit" class="btn-send-admin btn-export-color">
                                                 </i> Tạo phiếu
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
            </div>
        </main>

    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/admin_import.js"></script>

</html>