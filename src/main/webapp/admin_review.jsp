<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    DateTimeFormatter localTimeFmt = DateTimeFormatter.ofPattern("HH:mm");
    DateTimeFormatter localDateFmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    request.setAttribute("localTimeFmt", localTimeFmt);
    request.setAttribute("localDateFmt", localDateFmt);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đánh giá và phản hồi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_add_products.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_review.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
<div class="admin-container">
    <%@ include file="admin_header.jsp" %>
    <div class="main-wrapper">
        <%@ include file="admin_sidebar.jsp" %>

        <main class="content">
            <h2 class="page-title">Quản Lý Đánh Giá và Phản Hồi</h2>
            <div class="control-panel">
                <div class="filters">
                    <input type="text" placeholder="Tìm kiếm..." class="search-input" id="searchInput" value="${keyword}">

                    <select name="rating" class="filter-select" id="rateFilter">
                        <option value="">-- Xếp hạng --</option>
                    </select>

                    <select name="type" class="filter-select" id="typeFilter">
                        <option value="">-- Loại --</option>
                        <option value="no-reply">Chưa trả lời</option>
                        <option value="replied">Đã trả lời</option>
                    </select>
                </div>

                <div class="summary-info">
                    <div class="total-reviews">Tổng:  đánh giá</div>
                    <div class="avg-rating">TB: <i class="fas fa-star text-warning"></i> /5</div>
                </div>
            </div>

            <div class="review-table-container">
                <table class="review-table">
                    <thead>
                    <tr>
                        <th>Ngày giờ</th>
                        <th>Sản phẩm</th>
                        <th>Khách hàng</th>
                        <th>Sao</th>
                        <th>Nội dung Đánh giá</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>

                        <tr class="highlight-row">
                            <td>
                            </td>

                            <td> Bàn gỗ</td>

                            <td>
                                Tên khach hàng
                            </td>

                            <td class="rating-stars">
                               5 sao
                            </td>
                            <td>Xịnnnnn</td>
                            <td><span class="status-badge status-replied">Đã trả lời</span></td>
                            <td>
                                <button class="btn-sm btn-info reply-btn">
                                    <i class="fas fa-reply"></i> Trả lời
                                </button>
                                <button class="btn-icon delete-btn">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="pagination">


            </div>
        </main>

    </div>
</div>
<script src="${pageContext.request.contextPath}/js/admin_review.js"></script>
</body>
</html>