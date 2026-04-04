<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
    .button-group {
        display: flex;
        flex-direction: column;
        gap: 10px;
        margin-top: 10px;
    }
    .btn-filter, .btn-clear {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }
    .btn-filter {
        background-color: #8B5E3C;
        color: white;
        border: none;
    }
    .btn-filter:hover {
        background-color: #6f4a2f;
    }
    .btn-clear {
        background-color: white;
        color: #8B5E3C;
        border: 2px solid #8B5E3C;
    }
    .btn-clear:hover {
        background-color: #8B5E3C;
        color: white;
    }
</style>
<form id = "filterForm" action="ProductAllFlashSaleServlet" method="get">
    <input type="hidden" name="id" value="${flashSale.id}">
    <input type="hidden" name="returnPage"
           value="${pageContext.request.servletPath}">
    <aside class="filter-sidebar">
        <h3>Bộ lọc</h3>

        <div class="filter-group">
            <h4>Loại</h4>
            <c:forEach items="${listType}" var="t">
                <label>
                    <input type="checkbox" name="type" value="${t.id}"
                    <c:forEach items="${paramValues.type}" var="selectedId">
                        ${selectedId == t.id ? 'checked' : ''}
                    </c:forEach>
                    > ${t.productTypeName} </label>
            </c:forEach>
        </div>

        <div class="filter-group">
            <h4>Màu sắc</h4>
            <select name="color" class="filter-select">
                <option value="">-- Chọn màu --</option>
                <c:forEach items="${listColor}" var="c">
                    <option value="${c.id}" ${param.color == c.id ? 'selected' : ''}>
                            ${c.colorName}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="filter-group">
            <h4>Giá tiền</h4>
            <c:set var="prices" value="${fn:join(paramValues.price, ',')}" />

            <label>
                <input type="checkbox" name="price" value="1"
                       <c:if test="${fn:contains(prices, '1')}">checked</c:if>>
                Dưới 1 triệu
            </label>

            <label>
                <input type="checkbox" name="price" value="2"
                       <c:if test="${fn:contains(prices, '2')}">checked</c:if>>
                1 - 3 triệu
            </label>

            <label>
                <input type="checkbox" name="price" value="3"
                       <c:if test="${fn:contains(prices, '3')}">checked</c:if>>
                3 - 5 triệu
            </label>

            <label>
                <input type="checkbox" name="price" value="4"
                       <c:if test="${fn:contains(prices, '4')}">checked</c:if>>
                5 - 10 triệu
            </label>

            <label>
                <input type="checkbox" name="price" value="5"
                       <c:if test="${fn:contains(prices, '5')}">checked</c:if>>
                Trên 10 triệu
            </label>

        </div>

        <div class="filter-group">
            <h4>Đánh giá</h4>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <c:set var="ratings" value="${fn:join(paramValues.rating, ',')}" />

            <label>
                <input type="checkbox" name="rating" value="5"
                       <c:if test="${fn:contains(ratings, '5')}">checked</c:if>>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
            </label>

            <label>
                <input type="checkbox" name="rating" value="4"
                       <c:if test="${fn:contains(ratings, '4')}">checked</c:if>>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
            </label>

            <label>
                <input type="checkbox" name="rating" value="3"
                       <c:if test="${fn:contains(ratings, '3')}">checked</c:if>>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
            </label>

            <label>
                <input type="checkbox" name="rating" value="2"
                       <c:if test="${fn:contains(ratings, '2')}">checked</c:if>>
                <i class="ri-star-s-fill rating"></i>
                <i class="ri-star-s-fill rating"></i>
            </label>

            <label>
                <input type="checkbox" name="rating" value="1"
                       <c:if test="${fn:contains(ratings, '1')}">checked</c:if>>
                <i class="ri-star-s-fill rating"></i>
            </label>

        </div>
        <div class="filter-group">
            <h4>Nhà cung cấp</h4>
            <select name="source" class="filter-select" style="width: 100%; padding: 8px; border-radius: 4px;">
                <option value="">-- Chọn nhà cung cấp --</option>
                <c:forEach items="${listSource}" var="s">
                    <option value="${s.id}" ${param.source == s.id ? 'selected' : ''}>
                            ${s.sourceName}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="filter-group">
            <h4>Khoảng giá (VNĐ)</h4>
            <div class="price-slider-wrapper">
                <div class="price-input">
                    <input type="number" name="minPrice" id="minPrice" min="0"
                           value="${param.minPrice != null ? param.minPrice : 0}">
                    <input type="number" name="maxPrice" id="maxPrice" min="0"
                           value="${param.maxPrice != null ? param.maxPrice : 50000000}">
                </div>
            </div>
        </div>
        <br><br>
        <div class="button-group">
            <button type="submit" class="btn-filter">LỌC SẢN PHẨM</button>
            <button type="button" onclick="clearFilter()" class="btn-clear">XÓA BỘ LỌC</button>
        </div>
    </aside>
</form>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.getElementById("filterForm");
        form.addEventListener("submit", function(e) {
            let min = document.getElementById("minPrice").value;
            let max = document.getElementById("maxPrice").value;
            min = min ? parseInt(min) : null;
            max = max ? parseInt(max) : null;
            if (min !== null && max !== null && min > max) {
                alert("Giá tối thiểu không được lớn hơn giá tối đa");
                e.preventDefault();
            }
        });
    });
    function clearFilter() {
        let url = window.location.pathname;
        let params = new URLSearchParams(window.location.search);

        let id = params.get("id");

        let newParams = new URLSearchParams();

        if (id) newParams.set("id", id);

        window.location.href = url + "?" + newParams.toString();
    }
</script>