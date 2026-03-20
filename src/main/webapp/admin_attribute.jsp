<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - QUẢN LÝ MÀU SẮC VÀ KÍCH THƯỚC</title>
    <link rel="icon" type="image/png"  href="../img/logo.png" >
    <link rel="stylesheet" href="../css/admin_customer_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_attribute.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
<div class="admin-container">
    <%@ include file="admin_header.jsp" %>
    <div class="main-wrapper">
        <%@ include file="admin_sidebar.jsp" %>
        <main class="content-area">
            <h2>Quản lý màu sắc và kích thước</h2>

            <div class="tab-navigation">
                <button class="tab-btn active" onclick="openTab(event, 'colorTab')">Màu sắc</button>
                <button class="tab-btn" onclick="openTab(event, 'sizeTab')">Kích thước</button>
            </div>

            <div class="attribute-wrapper">
                <div id="colorTab" class="tab-content active">
                    <div class="attribute-card">
                        <button class="btn-add" onclick="openColor()">+ Thêm màu</button>
                        <table>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Mã</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listColors}" var="c">
                                <tr>
                                    <td>${c.id}</td>
                                    <td>${c.colorName}</td>
                                    <td>
                                    <span style="background:${c.colorCode};color:white;padding:4px 10px;border-radius:6px; border: 1px solid #ddd">
                                            ${c.colorCode}
                                    </span>
                                    </td>
                                    <td class="action">
                                        <i class="fa fa-edit" onclick="editColor(${c.id},'${c.colorName}','${c.colorCode}')"></i>
                                        <i class="fa fa-trash" onclick="deleteColor(${c.id})"></i>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="sizeTab" class="tab-content">
                    <div class="attribute-card">
                        <button class="btn-add" onclick="openSize()">+ Thêm size</button>
                        <table>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Size</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listSizes}" var="s">
                                <tr>
                                    <td>${s.id}</td>
                                    <td>${s.sizeName}</td>
                                    <td class="action">
                                        <i class="fa fa-edit" onclick="editSize(${s.id},'${s.sizeName}')"></i>
                                        <i class="fa fa-trash" onclick="deleteSize(${s.id})"></i>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </main>

    </div>
</div>
<div class="modal" id="colorModal">
    <div class="modal-box">
        <h3>Thông tin màu sắc</h3>
        <form action="admin-attribute" method="post">
            <input type="hidden" name="type" value="color">
            <input type="hidden" name="id" id="colorId">

            <label>Tên màu:</label>
            <input type="text" name="name" id="colorName" required>

            <label>Mã màu (Hex):</label>
            <input type="color" name="code" id="colorCode" style="height: 40px; padding: 2px;">

            <div style="display: flex; gap: 10px; margin-top: 10px;">
                <button type="submit" class="btn-add">Lưu lại</button>
                <button type="button" class="btn-add" style="background:#6c757d" onclick="document.getElementById('colorModal').style.display='none'">Hủy</button>
            </div>
        </form>
    </div>
</div>

</body>
<script src="${pageContext.request.contextPath}/js/admin_attribute.js"></script>
</html>