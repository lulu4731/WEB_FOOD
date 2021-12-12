<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Title</title>
<%-- <base href="${pageContext.servletContext.contextPath}/"> --%>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.1/css/bootstrap.min.css">

<link rel="stylesheet" href="resources/assets/css/select2.min.css">
<link rel="stylesheet"
	href="resources/assets/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- custom css file link  -->
<link rel="stylesheet" href="resources/css/style.css?v=1.0">
<link rel="stylesheet" href="resources/css/style1.css">
</head>
<body>
	<!-- header section starts      -->

	<header>

		<a href="#" class="logo"><i class="fas fa-utensils"></i>resto.</a>

		<nav class="navbar">
			<a class="active" href="#home">home</a> <a href="#dishes">dishes</a>
			<a href="#about">about</a> <a href="#menu">menu</a> <a href="#review">review</a>
			<a href="#order">order</a>
		</nav>

		<div class="icons">
			<i class="fas fa-bars" id="menu-bars"></i> <i class="fas fa-search"
				id="search-icon"></i> <a href="#" class="fas fa-heart"></a> <i
				class="fas fa-shopping-cart" id="cart-btn"></i> <i
				class="fas fa-user" id="login-btn"></i>
		</div>

		<div class="shopping-cart">
			<c:choose>
				<c:when test="${isLogin }">
					<c:choose>
						<c:when test="${hasCart }">
							<c:forEach var="cart" items="${listCart }">
								<div class="box">
									<a href="remove_cart.htm?id_food=${cart.foodCart.ID_FOOD }"><i
										class="fas fa-trash"></i></a> <img src="${cart.foodCart.IMAGE }"
										alt="">
									<div class="content">
										<h3>${cart.foodCart.NAME }</h3>
										<span class="price">${cart.foodCart.PRICE }</span> <span
											class="quantity">SL : ${cart.QUANTITY }</span>
									</div>
								</div>
							</c:forEach>
							<div class="total">Tổng cộng : ${totalPrice } VND</div>
							<a href="#" class="btn">Đặt hàng</a>
						</c:when>
						<c:otherwise>
							<div class="box">
								<div class="content">
									<h3>Giỏ của bản không có sản phẩm nào!</h3>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<div class="box">
						<div class="content">
							<h3>Vui lòng đăng nhập!</h3>
						</div>
					</div>
				</c:otherwise>

			</c:choose>
			<%-- <c:forEach var="u" items="cart">
				<div class="box">
					<i class="fas fa-trash"></i> <img src="resources/images/dish-1.png"
						alt="">
					<div class="content">
						<h3>watermelon</h3>
						<span class="price">$4.99/-</span> <span class="quantity">qty
							: 1</span>
					</div>
				</div>
			</c:forEach> --%>
			<!--  	<div class="box">
				<i class="fas fa-trash"></i> <img src="image/cart-img-2.png" alt="">
				<div class="content">
					<h3>onion</h3>
					<span class="price">$4.99/-</span> <span class="quantity">qty
						: 1</span>
				</div>
			</div>
			<div class="box">
				<i class="fas fa-trash"></i> <img src="image/cart-img-3.png" alt="">
				<div class="content">
					<h3>chicken</h3>
					<span class="price">$4.99/-</span> <span class="quantity">qty
						: 1</span>
				</div>
			</div>-->
			<!-- <div class="total">total : $19.69/-</div> -->

		</div>

		<c:choose>
			<c:when test="${isLogin }">
				<div class="login-form">
					<h3>${account.NAME}</h3>
					<p>${account.EMAIL}</p>
					<a href="logout.htm"><button class="btn">Đăng xuất</button></a>
				</div>
			</c:when>
			<c:otherwise>
				<form action="login.htm" modelAttribute="user" class="login-form"
					method="post">
					<h3>Đăng nhập</h3>
					<input name="email" type="email" placeholder="email" class="box">
					<input name="password" type="password" placeholder="Mật khẩu"
						class="box">
					<p>
						Quên mật khẩu <a href="#">nhấn đây</a>
					</p>
					<p>
						Tôi chưa có tài khoản <a href="#">tạo ngay</a>
					</p>
					<input type="submit" value="login now" class="btn">
				</form>
			</c:otherwise>
		</c:choose>



		<!-- notification -->
		<%-- <c:if test="${hasMess}">
		<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
			
		</c:if> --%>

	</header>

	<!-- header section ends-->

	<!-- search form  -->

	<form action="" id="search-form">
		<input type="search" placeholder="search here..." name=""
			id="search-box"> <label for="search-box"
			class="fas fa-search"></label> <i class="fas fa-times" id="close"></i>
	</form>

	<!-- order section starts  -->

	<section class="order" id="order">

		<form action="pay.htm">
			<h3 class="sub-heading">order now</h3>
			<h1 class="heading">free and fast</h1>

			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="w-25">Hình ảnh</th>
						<th class="w-25">Sản phẩm</th>
						<th class="w-25">Số lượng</th>
						<th class="w-25">Giá</th>
						<!-- <th>Server&nbsp;Location</th>
					<th>Action</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cart" items="${listCart }">
						<tr data-status="active">
							<td><img src="${cart.getFoodCart().IMAGE }" style="width: 100px; height: 100px"></td>
							<td>${cart.getFoodCart().NAME }</td>
							<td>${cart.QUANTITY }</td>
							<td>${cart.getFoodCart().PRICE }&nbsp;VND</td>

						</tr>
					</c:forEach>
					<tr>
						<th colspan="2">Tổng tiền:</th>
						<td colspan="2">${totalPrice }&nbsp;VND</td>
					</tr>
				</tbody>
			</table>

			<input type="submit" value="Đặt món" class="btn">
		</form>

	</section>

	<!-- order section ends -->

	<!-- footer section starts  -->

	<section class="footer">

		<div class="box-container">

			<div class="box">
				<h3>locations</h3>
				<a href="#">india</a> <a href="#">japan</a> <a href="#">russia</a> <a
					href="#">USA</a> <a href="#">france</a>
			</div>

			<div class="box">
				<h3>quick links</h3>
				<a href="#">home</a> <a href="#">dishes</a> <a href="#">about</a> <a
					href="#">menu</a> <a href="#">reivew</a> <a href="#">order</a>
			</div>

			<div class="box">
				<h3>contact info</h3>
				<a href="#">+123-456-7890</a> <a href="#">+111-222-3333</a> <a
					href="#">shaikhanas@gmail.com</a> <a href="#">anasbhai@gmail.com</a>
				<a href="#">mumbai, india - 400104</a>
			</div>

			<div class="box">
				<h3>follow us</h3>
				<a href="#">facebook</a> <a href="#">twitter</a> <a href="#">instagram</a>
				<a href="#">linkedin</a>
			</div>

		</div>

		<div class="credit">
			copyright @ 2021 by <span>mr. web designer</span>
		</div>

	</section>
	!-- footer section ends -->

	<!-- loader part  -->
	<div class="loader-container">
		<img src="resources/images/loader.gif" alt="">
	</div>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<!-- custom js file link  -->
	<script src="resources/js/script.js"></script>

</body>
</html>