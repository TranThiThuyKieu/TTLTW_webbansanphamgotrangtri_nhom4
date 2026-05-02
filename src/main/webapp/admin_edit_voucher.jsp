<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - CHỈNH SUỬA VOUCHER</title>
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
                <h2 class="page-title">Chỉnh sửa Voucher</h2>
                <form action="VoucherController" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${voucher.id}">
                    <div class="form-container">
                        <div class="form-section">
                            <h3>Thông tin hiển thị</h3>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Mã Voucher <span class="required">*</span></label>
                                    <input type="text" name="voucherCode" value="${voucher.voucherCode}" style="text-transform: uppercase" placeholder="Ví dụ: DECOR2026" required>
                                </div>
                                <div class="form-group">
                                    <label>Tên Voucher <span class="required">*</span></label>
                                    <input type="text" name="voucherName" value="${voucher.voucherName}" placeholder="Ví dụ: Voucher Tân Gia 500k" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Ghi chú</label>
                                <input type="text" name="description" value="${voucher.description}" placeholder="Ví dụ: Voucher tri ân khách hàng">
                            </div>
                        </div>

                        <div class="form-section">
                            <h3>Hình thức ưu đãi</h3>
                            <div class="form-row">
                                <div class="form-group column-left">
                                    <div class="sub-input">
                                        <label>Loại khuyến mãi</label>
                                        <select name="promoType">
                                            <option value="PERCENT" ${voucher.promoType=='PERCENT'?'selected':''}>%</option>
                                            <option value="AMOUNT" ${voucher.promoType=='AMOUNT'?'selected':''}>Tiền</option>
                                        </select>
                                    </div>
                                    <div class="sub-row promo-margin">
                                        <div class="sub-input">
                                            <label id="promoValueLabel">Mức giảm <span class="required">*</span></label>
                                            <div class="input-relative">
                                                <input type="number" name="promoValue" value="${voucher.promoValue}" min="1" placeholder="Nhập số tiền/%" required>
                                            </div>
                                        </div>
                                        <div class="sub-input">
                                            <label>Giá trị đơn tối thiểu <span class="required">*</span></label>
                                            <input type="number" name="minOrderValue" value="${voucher.minOrderValue}" min="0" placeholder="Ví dụ: 500000">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group column-right">
                                    <label>Đặc quyền ưu đãi</label>
                                    <select name="rewardStyle" id="rewardStyleSelect" onchange="toggleRankSelection()">
                                        <option value="NORMAL" ${voucher.rewardStyle == 'NORMAL' ? 'selected' : ''}>Ưu đãi thường</option>
                                        <option value="SPECIAL" ${voucher.rewardStyle == 'SPECIAL' ? 'selected' : ''}>Ưu đãi đặc quyền</option>
                                    </select>

                                    <div id="rankWrapper" class="rank-wrapper" style="display: none;">
                                        <label>Áp dụng cho hạng:</label>
                                        <div class="rank-selection">
                                            <label class="rank-item">
                                                <input type="checkbox" name="memberRank" value="SILVER"> Bạc
                                            </label>
                                            <label class="rank-item">
                                                <input type="checkbox" name="memberRank" value="GOLD"> Vàng
                                            </label>
                                            <label class="rank-item">
                                                <input type="checkbox" name="memberRank" value="DIAMOND"> Kim Cương
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
                                    <input type="number" name="totalRelease" value="${voucher.totalRelease}" min="1" required>
                                </div>
                                <div class="form-group">
                                    <label>Số lượng tối đa / 1 Khách hàng</label>
                                    <input type="number" name="maxPerUser" value="${voucher.maxPerUser}" min="1">
                                </div>
                            </div>
                        </div>

                        <div class="form-section">
                            <h3>Thời gian</h3>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Ngày bắt đầu</label>
                                    <input type="datetime-local" name="startDate" value="${voucher.startDate.toString().substring(0,16)}">
                                </div>
                                <div class="form-group">
                                    <label>Ngày kết thúc</label>
                                    <input type="datetime-local" name="endDate" value="${voucher.endDate.toString().substring(0,16)}">
                                </div>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="button" class="btn-cancel" onclick="history.back()">Hủy bỏ</button>
                            <button type="submit" class="btn-submit">Phát hành Voucher</button>
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