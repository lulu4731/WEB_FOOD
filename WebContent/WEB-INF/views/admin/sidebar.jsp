<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="sidebar" id="sidebar">
		<div class="sidebar-inner slimscroll">
			<div id="sidebar-menu" class="sidebar-menu">
				<ul>
					<li class="menu-title"><span>Menu</span></li>
					<li><a class="active" href="manage.htm"><i class="la la-dashboard"></i><span>Thống
							kê tổng quát</span></a></li>
					<c:if test="${role == 1 }">
					<li><a class="active" href="user.htm"><i class="la la-user"></i><span>Tài khoản</span></a></li>
					</c:if>
					<li><a class="active" href="order.htm"><i class="la la-files-o"></i><span>Đơn hàng</span></a></li>
					<li><a class="active" href="payments.htm"><i class="la la-file-text-o"></i><span>Hóa đơn</span></a></li>
					<li><a class="active" href="food.htm"><i class="la la-lemon-o"></i><span>Món ăn</span></a></li>
					<li><a class="active" href="feedback.htm"><i class="la la-commenting"></i><span>Phản hồi</span></a></li>			
				</ul>
			</div>
		</div>
	</div>
</body>
</html>