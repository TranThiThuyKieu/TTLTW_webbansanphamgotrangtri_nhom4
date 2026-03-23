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
                        <div class="paper-form paper-return">
                            <form action="send-request-return" method="POST" class="document-form">
                                <div class="paper-header">
                                    <div class="document-type">PHIẾU YÊU CẦU HOÀN TRẢ HÀNG</div>
                                    <div class="document-no">Số: PHT-20260323</div>
                                </div>

                                <div class="paper-info-grid">
                                    <div class="info-item">
                                        <label>Đối tác nhận trả:</label>
                                        <select name="supplierId" class="minimal-input" required>
                                            <option value="">-- Chọn đối tác --</option>

                                        </select>
                                    </div>
                                    <div class="info-item">
                                        <label>Lý do hoàn trả:</label>
                                        <select name="returnReason" class="minimal-input">
                                            <option value="Lỗi sản xuất">Hàng lỗi nhà sản xuất</option>
                                            <option value="Sai mẫu mã">Sai mẫu mã/kích thước</option>
                                            <option value="Hết hạn">Sắp hết hạn/Cận date</option>
                                            <option value="Khác">Lý do khác...</option>
                                        </select>
                                    </div>
                                    <div class="info-item">
                                        <label>Ngày hoàn trả:</label>
                                        <input type="date" name="returnDate" class="minimal-input" value="2026-03-23">
                                    </div>
                                </div>

                                <table class="paper-table" id="returnTable">
                                    <thead>
                                    <tr>
                                        <th>Tên mặt hàng</th>
                                        <th width="80">SL</th>
                                        <th width="140">Đơn giá hoàn</th>
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
                                        <td><input type="number" name="qty[]" value="1" min="1" class="minimal-input text-center" oninput="updateRowTotal(this, 'return')"></td>
                                        <td><input type="number" name="prc[]" value="0" class="minimal-input" oninput="updateRowTotal(this, 'return')"></td>
                                        <td class="row-total">0 đ</td>
                                        <td><button type="button" class="btn-clear" onclick="removeRow(this, 'return')">×</button></td>
                                    </tr>
                                    </tbody>
                                </table>

                                <button type="button" class="btn-text-add" onclick="addRow('returnTable')">+ Thêm mặt hàng hoàn trả</button>

                                <div class="paper-summary">
                                    <span>Tổng giá trị hoàn: <strong id="grandTotalReturn">0 đ</strong></span>
                                </div>

                                <div class="confirmation-box">
                                    <label class="checkbox-container">
                                        <input type="checkbox" name="confirmReturn" required>
                                        <span class="checkmark"></span>
                                        Xác nhận thông tin hoàn trả và cập nhật lại kho hàng.
                                    </label>
                                    <button type="submit" class="btn-send-admin btn-return">
                                   Tạo phiếu
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
            </div>      </main>


    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/admin_import.js"></script>

</html>