<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">

		<div class="header-left">
			<a href="../" class="logo"> <img
				src=".././resources/assets/img/logo.png" width="40" height="40"
				alt="">
			</a>
		</div>
		<a id="toggle_btn" href="javascript:void(0);"> <span
			class="bar-icon"> <span></span> <span></span> <span></span>
		</span>
		</a>
		<div class="page-title-box">
			<h3>Quản Lý Đặt Hàng Món Âu Mỹ</h3>
		</div>
		<a id="mobile_btn" class="mobile_btn" href="#sidebar"><i
			class="fa fa-bars"></i></a>

		<ul class="nav user-menu">
		
			<li class="nav-item dropdown has-arrow main-drop"><a href="#"
				class="dropdown-toggle nav-link" data-toggle="dropdown"> <span
					class="user-img"><img
						src=".././resources/assets/img/profiles/avatar-21.jpg" alt=""> <span
						class="status online"></span></span> <span>Admin</span>
			</a>
				<div class="dropdown-menu">
				 <a class="dropdown-item" href=".././logout.htm">Logout</a>
				</div></li>
		</ul>
		<div class="dropdown mobile-user-menu">
			<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
				aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
			<div class="dropdown-menu dropdown-menu-right">
				<a class="dropdown-item" href="profile.html">My Profile</a> <a
					class="dropdown-item" href="settings.html">Settings</a> <a
					class="dropdown-item" href="login.html">Logout</a>
			</div>
		</div>

	</div>
</body>
</html>