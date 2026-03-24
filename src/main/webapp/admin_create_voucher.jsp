<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - CREATE VOUCHER</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage_admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_create_voucher.css">
</head>
<body>

<div class="admin-container">
    <%@ include file="admin_header.jsp" %>
    <div class="main-wrapper">
        <%@ include file="admin_sidebar.jsp" %>
        <main class="content">
            <div class="product-management-container">
                <h2 class="page-title">Tạo Mới Voucher</h2>
                <form action="VoucherController" method="POST" enctype="multipart/form-data">
                    <div class="form-container">

                        <div class="form-section">
                            <h3>Thông tin hiển thị</h3>
                            <div class="form-group">
                                <label>Ảnh Cover Voucher <span class="required">*</span></label>
                                <input type="file" name="voucherImage" accept="image/*" required>
<%--                                <small>Định dạng: JPG, PNG.</small>--%>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Mã Voucher <span class="required">*</span></label>
                                    <input type="text" name="voucherCode" style="text-transform: uppercase" placeholder="Ví dụ: DECOR2026" required>
                                </div>
                                <div class="form-group">
                                    <label>Tên Voucher <span class="required">*</span></label>
                                    <input type="text" name="voucherName" placeholder="Ví dụ: Voucher Tân Gia 500k" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Mô tả voucher <span class="required">*</span></label>
                                <input type="text" name="voucherName" placeholder="Ví dụ: Voucher áp dụng cho đơn từ 2tr tri an khach hang" required>
                            </div>
                        </div>
                        <div class="form-section">
                            <h3> Hình thức ưu đãi</h3>

                            <div class="form-row">
                                <div class="form-group column-left">
                                    <div class="sub-input">
                                        <label>Loại khuyến mãi</label>
                                        <select name="promoType">
                                            <option value="PERCENT">Giảm giá theo %</option>
                                            <option value="AMOUNT">Giảm giá tiền mặt</option>
                                        </select>
                                    </div>

                                    <div class="sub-input" style="margin-top: 15px;">
                                        <label>Giá trị đơn tối thiểu <span class="required">*</span></label>
                                        <input type="number" name="minOrderValue" value="0" min="0">
                                        <small>Đơn hàng đạt giá trị này mới có thể áp dụng mã.</small>
                                    </div>
                                </div>

                                <div class="form-group column-right">
                                    <label>Đặc quyền ưu đãi</label>
                                    <select name="rewardStyle" id="rewardStyleSelect" onchange="toggleRankSelection()">
                                        <option value="NORMAL">Ưu đãi thường</option>
                                        <option value="SPECIAL">Ưu đãi đặc quyền</option>
                                    </select>

                                    <div id="rankWrapper" class="rank-wrapper" style="display: none;">
                                        <label>Áp dụng cho hạng:</label>
                                        <div class="rank-selection">
                                            <label class="rank-item">
                                                <input type="checkbox" name="memberRank" value="SILVER">
                                                <span class="rank-badge silver">Bạc</span>
                                            </label>
                                            <label class="rank-item">
                                                <input type="checkbox" name="memberRank" value="GOLD">
                                                <span class="rank-badge gold">Vàng</span>
                                            </label>
                                            <label class="rank-item">
                                                <input type="checkbox" name="memberRank" value="DIAMOND">
                                                <span class="rank-badge diamond">Kim Cương</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-section">
                            <h3>Số lượng & Giới hạn</h3>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Tổng số lượng phát hành <span class="required">*</span></label>
                                    <input type="number" name="totalRelease" min="1" placeholder="Ví dụ: 1000" required>
                                </div>
                                <div class="form-group">
                                    <label>Số lượng tối đa / 1 Khách hàng <span class="required">*</span></label>
                                    <input type="number" name="maxPerUser" min="1" value="1" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-section">
                            <h3> Thời gian cấu hình</h3>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Thời gian hiển thị trên App</label>
                                    <input type="datetime-local" name="displayDate" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Ngày bắt đầu áp dụng</label>
                                    <input type="datetime-local" name="startDate" required>
                                </div>
                                <div class="form-group">
                                    <label>Ngày kết thúc áp dụng</label>
                                    <input type="datetime-local" name="endDate" required>
                                </div>
                            </div>
                        </div>

<%--                        <div class="form-section" style="border-bottom: none;">--%>
<%--                            <div class="status-row">--%>
<%--                                <label class="switch">--%>
<%--                                    <span>Kích hoạt ngay</span>--%>
<%--                                    <input type="checkbox" name="status" checked>--%>
<%--                                    <span class="slider round"></span>--%>
<%--                                </label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="form-actions">
                            <button type="button" class="btn-cancel" onclick="history.back()">
                          Hủy bỏ
                            </button>
                            <button type="submit" class="btn-submit">
                             Phát hành Voucher
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</div>

</body>
<script src="${pageContext.request.contextPath}/js/admin_create_voucher.js"></script>

</html>