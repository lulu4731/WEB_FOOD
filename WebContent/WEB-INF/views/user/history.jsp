<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Title</title>
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
<link rel="stylesheet" href="resources/css/style1.css">
<link rel="stylesheet" href="resources/css/style.css?v=1.0">

</head>
<body>
	<!-- header section starts      -->

	<header>

		<a href="#" class="logo"><i class="fas fa-utensils"></i>resto.</a>

		<nav class="navbar">
			<a class="active" href="#home">home</a> <a href="#dishes">dishes</a>
			<a href="#about">about</a> <a href="#menu">menu</a> <a href="#review">review</a>
			<!-- <a href="#order">order</a> -->
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
							<div class="total">T???ng c???ng : ${totalPrice } VND</div>
							<a href="#" class="btn">?????t h??ng</a>
						</c:when>
						<c:otherwise>
							<div class="box">
								<div class="content">
									<h3>Gi??? c???a b???n kh??ng c?? s???n ph???m n??o!</h3>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<div class="box">
						<div class="content">
							<h3>Vui l??ng ????ng nh???p!</h3>
						</div>
					</div>
				</c:otherwise>

			</c:choose>
		</div>

		<c:choose>
			<c:when test="${isLogin }">
				<div class="login-form">
					<h3>${account.NAME}</h3>
					<p>${account.EMAIL}</p>
					<a href="logout.htm"><button class="btn">????ng xu???t</button></a>
				</div>
			</c:when>
			<c:otherwise>
				<form action="login.htm" modelAttribute="user" class="login-form"
					method="post">
					<h3>????ng nh???p</h3>
					<input name="email" type="email" placeholder="email" class="box">
					<input name="password" type="password" placeholder="M???t kh???u"
						class="box">
					<p>
						Qu??n m???t kh???u <a href="#">nh???n ????y</a>
					</p>
					<p>
						T??i ch??a c?? t??i kho???n <a href="#">t???o ngay</a>
					</p>
					<input type="submit" value="login now" class="btn">
				</form>
			</c:otherwise>
		</c:choose>
	</header>

	<section class="order" id="order">
		<h3 class="sub-heading">H??a ????n</h3>
		<h1 class="heading">L???ch s??? ?????t h??ng</h1>

		<div class="table-wrapper">
			<!-- <div class="table-title"> -->
				<div class="row">
					<!-- <div class="col-sm-6">
						<h2>L???ch s??? mua h??ng</h2>
					</div> -->
					<!-- <form class="col-sm-6 text-right">
					<select class="btnH" id="searchStatus" name="searchStatus">
						<option class="text-left" value="">--Select--</option>
						<option class="text-left" value=1>?????t h??ng</option>
						<option class="text-left" value=2>???? giao</option>
						<option class="text-left" value=0>H???y</option>
					</select> <input class="btnH datetimepicker" type="text" name="fromDate"
						id="fromDate"> <input class="btnH datetimepicker"
						type="text" name="toDate" id="toDate">
					<button class="btnH" type="submit" id="search" name="search">Search</button>
				</form> -->
				</div>
			<!-- </div> -->
			<%-- <div class="text-right">
			<tg:paging pagedListHolder="${pagedListHolder}"
				pagedLink="${pagedLink}" />
		</div> --%>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="w-25">S???n ph???m</th>
						<th class="w-25">S??? l?????ng</th>
						<th class="w-25">Gi??</th>
						<th class="w-25">????nh gi??</th>
						<!-- <th>Server&nbsp;Location</th>
					<th>Action</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${listHistories }">
						<tr>
							<th colspan="3">
								<h5>Ng??y ?????t h??ng:</h5>
								<p>${order.getDATE_TIME() }</p> T???ng ti???n: ${order.TOTAL_PRICE }&nbsp;VND
							</th>
							<th>
								<h5>Tr???ng th??i ????n h??ng</h5>
								<div class="dropdown action-label">
									<button
										class="btnS btn-white btn-sm btn-rounded dropdown-toggle"
										href="#" data-toggle="dropdown" aria-expanded="false">
										<i
											class="fa fa-dot-circle-o ${order.STATUS == 1 ? 'text-info' : (order.STATUS == 2 ? 'text-success' : 'text-danger')}"></i>
										${order.STATUS == 1 ? '?????t h??ng' : (order.STATUS == 2 ? '???? giao' : 'H???y')}
									</button>
									<c:choose>
										<c:when test="${order.STATUS == 1}">
											<div class="dropdown-menu dropdown-menu-right">
												<a class="dropdown-item"
													href="cancel.htm?id_order=${order.ID_ORDER }"><i
													class="fa fa-dot-circle-o text-danger"></i> H???y</a>
											</div>
										</c:when>
									</c:choose>

								</div>
							</th>
						</tr>
						<c:forEach var="item" items="${order.getItem()}">
							<tr data-status="active">
								<td>${item.getFoodOrderItem().NAME }</td>
								<td>${item.QUANTITY }</td>
								<td>${item.ITEM_PRICE }&nbsp;VND</td>
								<td>
									<div class="dropdown action-label">
										<button
											class="btnS btn-white btn-sm btn-rounded dropdown-toggle"
											href="#" data-toggle="dropdown" aria-expanded="false">
											<i
												class="fa fa-dot-circle-o ${item.SCORE == 0 ? 'text-info' : 'text-success'}"></i>
											${item.SCORE == 0 ? 'Ch??a ????nh gi??' : '???? ????nh gi??'}
										</button>
										<c:choose>
											<c:when test="${item.SCORE == 0 and order.STATUS == 2 }">
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item"
														href="rate.htm?id_order=${order.ID_ORDER }&id_food=${item.foodOrderItem.ID_FOOD}&score=1"><i
														class="fas fa-star"></i> <i class="far fa-star"></i> <i
														class="far fa-star"></i> <i class="far fa-star"></i> <i
														class="far fa-star"></i></a> <a class="dropdown-item"
														href="rate.htm?id_order=${order.ID_ORDER }&id_food=${item.foodOrderItem.ID_FOOD}&score=2"><i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="far fa-star"></i> <i class="far fa-star"></i> <i
														class="far fa-star"></i></a> <a class="dropdown-item"
														href="rate.htm?id_order=${order.ID_ORDER }&id_food=${item.foodOrderItem.ID_FOOD}&score=3"><i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i> <i class="far fa-star"></i> <i
														class="far fa-star"></i></a> <a class="dropdown-item"
														href="rate.htm?id_order=${order.ID_ORDER }&id_food=${item.foodOrderItem.ID_FOOD}&score=4"><i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="far fa-star"></i></a> <a class="dropdown-item"
														href="rate.htm?id_order=${order.ID_ORDER }&id_food=${item.foodOrderItem.ID_FOOD}&score=5"><i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i> <i class="fas fa-star"></i> <i
														class="fas fa-star"></i></a>

												</div>
											</c:when>
											<c:otherwise>

											</c:otherwise>
										</c:choose>

									</div>
								</td>

							</tr>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>



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
	<!-- footer section ends -->

	<script src="resources/assets/js/jquery-3.5.1.min.js"></script>
	<script src="resources/assets/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/moment.min.js"></script>
	<script src="resources/assets/js/popper.min.js"></script>
	<script src="resources/assets/js/bootstrap-datetimepicker.min.js"></script>
	<script src="resources/assets/js/app.js"></script>
</body>
</html>