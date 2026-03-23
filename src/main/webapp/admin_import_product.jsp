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
<%--                    <button class="tab-btn active" onclick="openTab(event, 'import-tab')">Phiếu Nhập</button>--%>
<%--                    <button class="tab-btn" onclick="openTab(event, 'export-tab')">Phiếu Xuất</button>--%>
<%--                    <button class="tab-btn" onclick="openTab(event, 'return-tab')">Phiếu Hoàn Trả</button>--%>
<%--                </div>--%>

                <div id="import-tab" class="tab-content active">
                    <div class="paper-form">
                        <form action="send-request-admin" method="POST" class="document-form">
                            <div class="paper-header">
                                <div class="document-type">PHIẾU YÊU CẦU NHẬP KHO</div>
                                <div class="document-no">Số: PNK-20260323</div>
                            </div>
                            <div class="paper-info-grid">
                                <div class="info-item">
                                    <label>Nhà cung cấp:</label>
                                    <select name="supplierId" class="minimal-input" required>
                                        <option value="">-- Chọn đối tác --</option>
                                    </select>
                                </div>
                                <div class="info-item">
                                    <label>Người tạo:</label>
                                    <input type="text" name="billCode" class="minimal-input" placeholder="Họ và tên...">
                                </div>
                                <div class="info-item">
                                    <label>Ngày lập:</label>
                                    <input type="date" name="importDate" class="minimal-input" value="2026-03-23">
                                </div>
                            </div>

                            <table class="paper-table" id="importTable">
                                <thead>
                                <tr>
                                    <th>Tên mặt hàng</th>
                                    <th width="80">SL</th>
                                    <th width="140">Đơn giá nhập</th>
                                    <th width="140">Thành tiền</th>
                                    <th width="40"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <select name="vId[]" class="minimal-input">
                                        </select>
                                    </td>
                                    <td><input type="number" name="qty[]" value="1" min="1" class="minimal-input text-center" oninput="updateRowTotal(this, 'import')"></td>
                                    <td><input type="number" name="prc[]" value="0" class="minimal-input" oninput="updateRowTotal(this, 'import')"></td>
                                    <td class="row-total">0 đ</td>
                                    <td><button type="button" class="btn-clear" onclick="removeRow(this, 'import')">×</button></td>
                                </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn-text-add" onclick="addRow('importTable')">+ Thêm dòng mới</button>
                            <div class="paper-summary">
                                <span>Tổng trị giá: <strong id="grandTotalImport">0 đ</strong></span>
                            </div>
                            <div class="confirmation-box">
                                <label class="checkbox-container">
                                    <input type="checkbox" name="confirmImport" required>
                                    <span class="checkmark"></span>
                                    Tôi cam đoan số lượng và đơn giá nhập trên là đúng thực tế.
                                </label>
                                <button type="submit" class="btn-send-admin btn-import">
                                Tạo Phiếu
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