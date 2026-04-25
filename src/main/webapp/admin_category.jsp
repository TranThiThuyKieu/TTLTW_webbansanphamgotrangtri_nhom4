<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - QUẢN LÝ SẢN PHẨM</title>
    <link rel="icon" type="image/png" href="../img/logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/admin_products.css">
    <link rel="stylesheet" href="css/admin_profile_style.css">
    <link rel="stylesheet" href="css/admin_category.css">

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
                            <a href="AdminCountProductCategoryServlet" class="back-btn">
                                <i class="fa-solid fa-chevron-left"></i> Quay lại
                            </a>
                            <h2 class="page-title">Danh mục: ${selectedCategoryName}</h2>
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
                        <h2 class="page-title">Quản Lý Danh Mục Sản Phẩm</h2>

                        <div class="search-filter">
                            <form action="${pageContext.request.contextPath}/search-category" method="get"
                                  class="search-filter">
                                <div class="search-input" style="flex-grow: 1;">
                                    <input type="text"
                                           name="keyword"
                                           placeholder="Tìm kiếm danh mục"
                                           value="${keyword}">
                                </div>
                                <button type="submit" class="add-new-category">
                                    <i class="fa-solid fa-magnifying-glass"></i> Tìm kiếm
                                </button>
                                <button type="button" class="add-new-category" onclick="openCategoryModal()">
                                    <i class="fa-solid fa-plus"></i> Thêm Danh Mục Mới
                                </button>
                            </form>

                        </div>
                        <div class="category-wrapper">
                            <table class="category-table">
                                <thead>
                                <tr>
                                    <th class="col-id">ID</th>
                                    <th class="col-name">Tên Danh Mục</th>
                                    <th class="col-product">Số Sản Phẩm</th>

                                    <th class="col-actions">Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listC}" var="c">
                                    <tr>
                                        <td class="col-id">${c.id}</td>
                                        <td class="col-name">
                                            <a href="AdminCountProductCategoryServlet?categoryId=${c.id}">
                                                    ${c.categoryName}
                                            </a>
                                        </td>
                                        <td class="col-product">
                                                ${productCountMap[c.id] != null ? productCountMap[c.id] : 0}
                                        </td>
                                        <td class="col-actions">
                                            <i class="fa-solid fa-pen-to-square"
                                               onclick="editCategory('${c.id}', '${c.categoryName}')"></i>
                                            <i class="fa-solid fa-trash-can"
                                               onclick="deleteCategory('${c.id}', '${c.categoryName}')"
                                               style="cursor:pointer; color:red; margin-left:10px;"></i>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

            <div id="categoryModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" onclick="closeCategoryModal()">&times;</span>
                    <h3 id="modalTitle">Thêm Danh mục Mới</h3>

                    <form id="categoryForm" action="${pageContext.request.contextPath}/add-category" method="post">
                        <input type="hidden" name="categoryId" id="modalId">
                        <div class="form-group">
                            <label for="categoryName">Tên Danh mục:</label>
                            <input type="text" name="categoryName" id="categoryName" required>
                        </div>
                        <button type="submit" class="submit-btn">Lưu Thông Tin</button>
                    </form>
                </div>
            </div>

        </main>


    </div>
</div>
<script src="js/admin_category.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<c:if test="${not empty sessionScope.msg}">
    <script>
        Swal.fire({
            icon: '${sessionScope.msgType}',
            text: '${sessionScope.msg}'
        });
    </script>
    <c:remove var="msg" scope="session"/>
    <c:remove var="msgType" scope="session"/>
</c:if>
</body>
</html>