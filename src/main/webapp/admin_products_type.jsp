<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - QUẢN LÝ DANH MỤC</title>
    <link rel="icon" type="image/png" href="../img/logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/admin_products.css">
    <link rel="stylesheet" href="css/admin_profile_style.css">
    <link rel="stylesheet" href="css/admin_category.css">
    <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bootstrap-4/bootstrap-4.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<div class="admin-container">
    <%@ include file="admin_header.jsp" %>

    <div class="main-wrapper">
        <%@ include file="admin_sidebar.jsp" %>

        <main class="content">
            <c:choose>
                <c:when test="${not empty productList}">
                    <div class="category-container">
                        <div class="header-with-back">
                            <a href="AdminProductTypeServlet" class="back-btn">
                                <i class="fa-solid fa-chevron-left"></i> Quay lại
                            </a>
                            <h2 class="page-title">Sản phẩm: ${selectedTypeName}</h2>
                        </div>

                        <div class="category-wrapper">
                            <table class="category-table">
                                <thead>
                                <tr>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá tiền</th>
                                    <th>Trạng thái</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="p" items="${productList}">
                                    <tr>
                                        <td><img src="${p.imageUrl}" class="product-thumb"></td>
                                        <td class="text-left"><strong>${p.nameProduct}</strong></td>
                                        <td class="price-cell">
                                            <fmt:formatNumber value="${p.price}" pattern="#,###"/> đ
                                        </td>
                                        <td>
                                                <span class="status-label ${p.isActive == 1 ? 'active' : 'hidden'}">
                                                        ${p.isActive == 1 ? 'Đang bán' : 'Tạm ẩn'}
                                                </span>
                                        </td>
                                        <td class="col-actions">
                                            <a href="admin-edit-product?id=${p.id}">
                                                <i class="fa-solid fa-pen-to-square edit-icon"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="category-container">
                        <h2 class="page-title">Quản Lý Loại Sản Phẩm</h2>

                        <div class="search-filter">
                            <div class="search-input" style="flex-grow: 1;">
                                <input type="text" placeholder="Tìm kiếm loại sản phẩm..." id="searchInput" value="${keyword}">
                            </div>
                            <button class="add-new-category" onclick="openProductTypeModal()">
                                <i class="fa-solid fa-plus"></i> Thêm Loại SP Mới
                            </button>
                        </div>

                        <div class="category-wrapper">
                            <table class="category-table">
                                <thead>
                                <tr>
                                    <th class="col-id">ID</th>
                                    <th class="col-name">Tên Loại Sản Phẩm</th>
                                    <th class="col-product">Số Sản Phẩm</th>
                                    <th class="col-actions">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listPT}" var="pt">
                                    <tr>
                                        <td class="col-id">${pt.id}</td>
                                        <td class="col-name">
                                            <a href="AdminProductTypeServlet?typeId=${pt.id}" class="type-link">
                                                    ${pt.productTypeName}
                                            </a>
                                        </td>
                                        <td class="col-product">
                                                ${productCountMap[pt.id] != null ? productCountMap[pt.id] : 0}
                                        </td>
                                        <td class="col-actions">
                                            <i class="fa-solid fa-pen-to-square" onclick="editProductType('${pt.id}', '${pt.productTypeName}')"></i>
                                            <i class="fa-solid fa-trash-can" onclick="deleteProductType('${pt.id}', '${pt.productTypeName}')" style="color: #e74c3c; margin-left: 10px;"></i>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>
    </div>
</div>

<%-- Modal (Giữ nguyên bên ngoài main) --%>
<div id="productTypeModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeProductTypeModal()">&times;</span>
        <h3 id="modalTitle">Thêm Loại Sản Phẩm Mới</h3>
        <form id="productTypeForm" action="${pageContext.request.contextPath}/add-product-type" method="post">
            <div class="form-group">
                <label for="productTypeName">Tên Loại Sản Phẩm:</label>
                <input type="text" name="productTypeName" id="productTypeName" required>
            </div>
            <button type="submit" class="submit-btn">Lưu Thông Tin</button>
        </form>
    </div>
</div>

<c:if test="${not empty sessionScope.msg}">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            Swal.fire({
                title: "${sessionScope.msgType}" === 'success' ? 'Thành công!' : 'Thông báo lỗi',
                text: "${sessionScope.msg}",
                icon: "${sessionScope.msgType}" === 'success' ? 'success' : 'error',
                confirmButtonColor: '#d35400'
            });
        });
    </script>
    <c:remove var="msg" scope="session" />
    <c:remove var="msgType" scope="session" />
</c:if>

<script src="js/admin_product_type.js"></script>
<script>
    // JS Logic cho Modal (Giữ nguyên)
    function editProductType(id, name) {
        const modal = document.getElementById('productTypeModal');
        modal.style.display = 'block';
        document.getElementById('modalTitle').innerText = "Chỉnh Sửa Loại Sản Phẩm";
        document.getElementById('productTypeName').value = name;

        let hiddenId = document.getElementById('editId');
        if (!hiddenId) {
            hiddenId = document.createElement('input');
            hiddenId.type = 'hidden';
            hiddenId.name = 'id';
            hiddenId.id = 'editId';
            document.getElementById('productTypeForm').appendChild(hiddenId);
        }
        hiddenId.value = id;
        document.getElementById('productTypeForm').action = "update-product-type";
    }

    function closeProductTypeModal() {
        document.getElementById('productTypeModal').style.display = 'none';
        document.getElementById('productTypeForm').reset();
    }
</script>
</body>
</html>