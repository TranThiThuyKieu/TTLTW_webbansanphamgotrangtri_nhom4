<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${listP}" var="p">
    <div class="product-card">
        <a href="ProductDetailServlet?id=${p.id}" class="product-link">
            <div class="set">
                <img src="${pageContext.request.contextPath}/${p.imageUrl}"
                     onerror="this.src='${pageContext.request.contextPath}/img/logo.png'">
                <h2>${p.nameProduct}</h2>
                <div class="price">
                    <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                </div>
            </div>
        </a>
    </div>
</c:forEach>