<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="model.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.OrderDao" %>

<%User user = (User) session.getAttribute("LOGGED_USER");
    OrderDao dao = new OrderDao();
    double thisWeek = dao.getRevenueByWeekOffset(0);
    double lastWeek = dao.getRevenueByWeekOffset(1);
    double thisMonth = dao.getRevenueByMonthOffset(0);
    double lastMonth = dao.getRevenueByMonthOffset(1);
    double weekPercent = lastWeek == 0 ? 100 : ((thisWeek - lastWeek) / lastWeek) * 100;
    double monthPercent = lastMonth == 0 ? 100 : ((thisMonth - lastMonth) / lastMonth) * 100;
    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    UserDao userDao = new UserDao();
    int newUsersLast30Days = userDao.countNewUsersLast30Days();

    Integer orderCountObj = (Integer) request.getAttribute("orderCount");
    int orderCount = 0;
    if (orderCountObj == null) {
        OrderDao orderDao = new OrderDao();

        try {
            orderCount = orderDao.getOrderCount();
        } catch (Exception e) {
            e.printStackTrace();
            orderCount = 0;
        }
    } else {
        orderCount = orderCountObj;
    }
    OrderDao orderDao = new OrderDao();
    double totalRevenue = orderDao.getTotalRevenue();

    dao.ProductDao productDao = new dao.ProductDao();
    List<model.Product> topProducts = productDao.getTop8BestSellers();
    request.setAttribute("topProducts", topProducts);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HOME DECOR - TỔNG QUAN</title>
    <link rel="icon" type="image/png"  href="img/logo.png" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/homepage_admin.css">
    <link rel="stylesheet" href="css/admin_profile_style.css">

</head>
<body>

<div class="admin-container">
    <%@ include file="admin_header.jsp" %>
    <div class="main-wrapper">
        <%@ include file="admin_sidebar.jsp" %>


        <main class="content">
            <h2 class="page-title">Tổng quan</h2>

            <div class="kpi-row-modern">
                <div class="kpi-card-modern" onclick="openRevenuePopup()">
                <div class="kpi-label-modern">Tổng Doanh Thu </div>
                    <div class="kpi-value-modern">
                        <fmt:formatNumber value="<%= totalRevenue %>" pattern="#,###"/>
                        <span class="unit">VND</span></div>
                </div>
                <%
                    System.out.println("Order Count (JSP): " + request.getAttribute("orderCount"));
                %>
                <div class="kpi-card-modern" onclick="openOrderPopup()">
                    <div class="kpi-label-modern">Số Lượng Đơn Hàng</div>
                    <div class="kpi-value-modern">

                        <%= orderCount %>
                    </div>
                </div>
                <div class="kpi-card-modern">
                    <div class="kpi-label-modern">Khách Hàng Mới </div>
                    <div class="kpi-value-modern"><%= newUsersLast30Days %></div>
                </div>
                <div class="kpi-card-modern">
                    <div class="kpi-label-modern">Doanh Thu Tuần</div>
                    <div class="kpi-value-modern">
                        <fmt:formatNumber value="<%= thisWeek %>" pattern="#,###"/> VND
                    </div>
                    <div class="trend <%= weekPercent >= 0 ? "up" : "down" %>">
                        <%= String.format("%.1f", weekPercent) %>%
                        <i class="fas <%= weekPercent >= 0 ? "fa-arrow-up" : "fa-arrow-down" %>"></i>
                    </div>
                </div>
                <div class="kpi-card-modern">
                    <div class="kpi-label-modern">Doanh Thu Tháng</div>
                    <div class="kpi-value-modern">
                        <fmt:formatNumber value="<%= thisMonth %>" pattern="#,###"/> VND
                    </div>
                    <div class="trend <%= monthPercent >= 0 ? "up" : "down" %>">
                        <%= String.format("%.1f", monthPercent) %>%
                        <i class="fas <%= monthPercent >= 0 ? "fa-arrow-up" : "fa-arrow-down" %>"></i>
                    </div>
                </div>
            </div>

            <div class="widget-full-width">
                <div class="widget-card">
                    <table class="data-table-modern">
                        <thead>
                        <tr>
                            <th>Top</th>
                            <th>Sản Phẩm</th>
                            <th>Giá Tiền</th>
                            <th>Đánh Giá</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${topProducts}" var="p" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 10px;">
                                        <img src="${p.imageUrl}" alt="${p.nameProduct}" style="width: 40px; height: 40px; border-radius: 4px; object-fit: cover;">
                                            ${p.nameProduct}
                                    </div>
                                </td>
                                <td>${p.price} VND</td>
                                <td>
                                    <fmt:formatNumber value="${p.averageRating}" pattern="#.#"/>
                                    <i class="fas fa-star text-yellow"></i>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty topProducts}">
                            <tr>
                                <td colspan="4" style="text-align: center;">Chưa có dữ liệu bán hàng</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</div>
<div id="orderModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeOrderPopup()">&times;</span>
        <h3>Thống kê đơn hàng</h3>
        <div class="filter-btns">
            <button onclick="loadOrderStats('week')">Tuần</button>
            <button onclick="loadOrderStats('month')">Tháng</button>
            <button onclick="loadOrderStats('year')">Năm</button>
        </div>
        <div id="orderResult">
        </div>
    </div>
</div>
<div id="revenueModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeRevenuePopup()">&times;</span>
        <h3>Thống kê doanh thu</h3>
        <div class="filter-btns">
            <button onclick="loadRevenueStats('week')">Tuần</button>
            <button onclick="loadRevenueStats('month')">Tháng</button>
            <button onclick="loadRevenueStats('year')">Năm</button>
        </div>
        <div id="revenueResult">
            Tổng doanh thu: <fmt:formatNumber value="<%= totalRevenue %>" pattern="#,###"/> VND
        </div>
    </div>
    </div>
<script>
    const contextPath = '<%= request.getContextPath() %>';
</script>
<script src="js/homepage_admin.js"></script>
</body>
</html>
