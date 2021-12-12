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
			<!-- <a href="#order">order</a> -->
		</nav>

		<div class="icons">
			<i class="fas fa-bars" id="menu-bars"></i> <i class="fas fa-search"
				id="search-icon"></i>
			<c:if test="${isLogin }">
				<a href="feedback.htm" class="fas fa-comment-alt"></a>
			</c:if>
			<c:if test="${isLogin }">
				<a href="history.htm" class="fas fa-heart"></a>
			</c:if>
			<i class="fas fa-shopping-cart" id="cart-btn"></i> <i
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
							<a href="order.htm" class="btn">Đặt hàng</a>
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
						Quên mật khẩu <a href="forgot-password.htm">nhấn đây</a>
					</p>
					<p>
						Tôi chưa có tài khoản <a href="signup.htm">tạo ngay</a>
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

	<!-- home section starts  -->

	<section class="home" id="home">

		<div class="swiper-container home-slider">

			<div class="swiper-wrapper wrapper">
				<c:forEach var="food" items="${specialFoods }">
					<div class="swiper-slide slide">
						<div class="content">
							<span>Món đặc biệt</span>
							<h3>${food.NAME }</h3>
							<p>${food.DESCRIBE }</p>
							<!-- <a href="#" class="btn">order now</a> -->
						</div>
						<div class="image">
							<img src="${food.IMAGE }" alt="">
						</div>
					</div>
				</c:forEach>

				<!-- <div class="swiper-slide slide">
					<div class="content">
						<span>our special dish</span>
						<h3>spicy noodles</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Sit natus dolor cumque?</p>
						<a href="#" class="btn">order now</a>
					</div>
					<div class="image">
						<img src="resources/images/home-img-1.png" alt="">
					</div>
				</div>

				<div class="swiper-slide slide">
					<div class="content">
						<span>our special dish</span>
						<h3>fried chicken</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Sit natus dolor cumque?</p>
						<a href="#" class="btn">order now</a>
					</div>
					<div class="image">
						<img src="resources/images/home-img-2.png" alt="">
					</div>
				</div>

				<div class="swiper-slide slide">
					<div class="content">
						<span>our special dish</span>
						<h3>hot pizza</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Sit natus dolor cumque?</p>
						<a href="#" class="btn">order now</a>
					</div>
					<div class="image">
						<img src="resources/images/home-img-3.png" alt="">
					</div>
				</div> -->
			</div>
			<!--<div class="swiper-pagination"></div>  -->

		</div>

	</section>

	<!-- home section ends -->

	<!-- dishes section starts  -->
	<section class="dishes" id="dishes">

		<h3 class="sub-heading">Món ăn</h3>
		<h1 class="heading">Món phổ biến</h1>

		<div class="box-container">
			<c:forEach var="food" items="${dailyFoods }">
				<div class="box">
					<a href="#" class="fas fa-heart"></a> <a href="#"
						class="fas fa-eye"></a> <img src="${food.IMAGE }" alt="">
					<h3>${food.NAME }</h3>
					<div class="stars">
						<c:choose>
							<c:when test="${food.SCORE == 0 }">
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
							</c:when>
							<c:when test="${food.SCORE <1}">
								<i class="fas fa-star-half-alt"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
							</c:when>
							<c:when test="${food.SCORE == 1}">
								<i class="fas fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
							</c:when>
							<c:when test="${food.SCORE < 2}">
								<i class="fas fa-star"></i>
								<i class="fas fa-star-half-alt"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
							</c:when>
							<c:when test="${food.SCORE == 2}">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
							</c:when>
							<c:when test="${food.SCORE < 3}">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star-half-alt"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
							</c:when>
							<c:when test="${food.SCORE == 3}">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
							</c:when>
							<c:when test="${food.SCORE < 4 }">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star-half-alt"></i>
								<i class="far fa-star"></i>
							</c:when>
							<c:when test="${food.SCORE == 4}">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="far fa-star"></i>
							</c:when>
							<c:when test="${food.SCORE < 5}">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star-half-alt"></i>
							</c:when>
							<c:when test="${food.SCORE == 5}">
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
								<i class="fas fa-star"></i>
							</c:when>

						</c:choose>
						<!-- <i class="far fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i> -->
					</div>
					<span>${food.PRICE} VND</span>
					<c:if test="${food.STATUS }">
						<a href="add_cart.htm?id_food=${food.ID_FOOD }" class="btn">Thêm
							vào giỏ</a>
					</c:if>
				</div>
			</c:forEach>

			<!-- <div class="box">
				<a href="#" class="fas fa-heart"></a> <a href="#" class="fas fa-eye"></a>
				<img
					src="resources/images/2112041031-menu-3.jpg"
					alt="">
				<h3>tasty food</h3>
				<div class="stars">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star-half-alt"></i>
				</div>
				<span>$15.99</span> <a href="#" class="btn">add to cart</a>
			</div>

			<div class="box">
				<a href="#" class="fas fa-heart"></a> <a href="#" class="fas fa-eye"></a>
				<img src="resources/images/dish-2.png" alt="">
				<h3>tasty food</h3>
				<div class="stars">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star-half-alt"></i>
				</div>
				<span>$15.99</span> <a href="#" class="btn">add to cart</a>
			</div>

			<div class="box">
				<a href="#" class="fas fa-heart"></a> <a href="#" class="fas fa-eye"></a>
				<img src="resources/images/dish-3.png" alt="">
				<h3>tasty food</h3>
				<div class="stars">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star-half-alt"></i>
				</div>
				<span>$15.99</span> <a href="#" class="btn">add to cart</a>
			</div>

			<div class="box">
				<a href="#" class="fas fa-heart"></a> <a href="#" class="fas fa-eye"></a>
				<img src="resources/images/dish-4.png" alt="">
				<h3>tasty food</h3>
				<div class="stars">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star-half-alt"></i>
				</div>
				<span>$15.99</span> <a href="#" class="btn">add to cart</a>
			</div>

			<div class="box">
				<a href="#" class="fas fa-heart"></a> <a href="#" class="fas fa-eye"></a>
				<img src="resources/images/dish-5.png" alt="">
				<h3>tasty food</h3>
				<div class="stars">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star-half-alt"></i>
				</div>
				<span>$15.99</span> <a href="#" class="btn">add to cart</a>
			</div>

			<div class="box">
				<a href="#" class="fas fa-heart"></a> <a href="#" class="fas fa-eye"></a>
				<img src="resources/images/dish-6.png" alt="">
				<h3>tasty food</h3>
				<div class="stars">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star"></i> <i class="fas fa-star"></i> <i
						class="fas fa-star-half-alt"></i>
				</div>
				<span>$15.99</span> <a href="#" class="btn">add to cart</a>
			</div> -->

		</div>

	</section>

	<!-- dishes section ends -->

	<!-- about section starts  -->
	<section class="about" id="about">

		<h3 class="sub-heading">Những điều cần biết</h3>
		<h1 class="heading">Chất lượng về sản phẩm</h1>

		<div class="row">

			<div class="image">
				<img src="resources/images/about-img.png" alt="">
			</div>

			<div class="content">
				<h3>Đồ ăn đúng chuẩn châu Âu</h3>
				<p>Nguyên liệu của chúng tôi được nhập khẩu từ các nước châu Âu,
					để có thể giữ được hương vị "đúng chất" mà không cần đi du lịch.</p>
				<p>Đội ngũ đầu bếp của chúng tôi đã được đào tạo và làm việc ở
					các nước châu Âu.</p>
				<div class="icons-container">
					<div class="icons">
						<i class="fas fa-shipping-fast"></i> <span>Miễn phí giao
							hàng</span>
					</div>
					<div class="icons">
						<i class="fas fa-dollar-sign"></i> <span>Thanh toán dễ dàng</span>
					</div>
					<div class="icons">
						<i class="fas fa-headset"></i> <span>Hỗ trợ nhiệt tình</span>
					</div>
				</div>
				<!-- <a href="#" class="btn">learn more</a> -->
			</div>

		</div>

	</section>
	<!-- about section ends -->

	<!-- menu section starts  -->

	<section class="menu" id="menu">

		<h3 class="sub-heading">Thực đơn</h3>
		<h1 class="heading">Món ngon mỗi ngày</h1>

		<div class="box-container">


			<c:forEach var="food" items="${menuFoods }">
				<div class="box">
					<div class="image">
						<img src="${food.IMAGE }" alt=""> <a href="#"
							class="fas fa-heart"></a>
					</div>
					<div class="content">
						<div class="stars">
							<c:choose>
								<c:when test="${food.SCORE == 0 }">
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${food.SCORE <1}">
									<i class="fas fa-star-half-alt"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${food.SCORE == 1}">
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${food.SCORE < 2}">
									<i class="fas fa-star"></i>
									<i class="fas fa-star-half-alt"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${food.SCORE == 2}">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${food.SCORE < 3}">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star-half-alt"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${food.SCORE == 3}">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${food.SCORE < 4 }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star-half-alt"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${food.SCORE == 4}">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${food.SCORE < 5}">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star-half-alt"></i>
								</c:when>
								<c:when test="${food.SCORE == 5}">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</c:when>

							</c:choose>
						</div>
						<h3>${food.NAME }</h3>
						<p>${food.DESCRIBE }</p>
						<span class="price">${food.PRICE } VND</span>
						<c:if test="${food.STATUS }">
							<a href="add_cart.htm?id_food=${food.ID_FOOD }" class="btn">Thêm
								vào giỏ</a>
						</c:if>
					</div>
				</div>
			</c:forEach>
			<!-- <div class="box">
				<div class="image">
					<img src="resources/images/menu-1.jpg" alt=""> <a href="#"
						class="fas fa-heart"></a>
				</div>
				<div class="content">
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<h3>delicious food</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Excepturi, accusantium.</p>
					<a href="#" class="btn">add to cart</a> <span class="price">$12.99</span>
				</div>
			</div>

			<div class="box">
				<div class="image">
					<img src="resources/images/menu-2.jpg" alt=""> <a href="#"
						class="fas fa-heart"></a>
				</div>
				<div class="content">
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<h3>delicious food</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Excepturi, accusantium.</p>
					<a href="#" class="btn">add to cart</a> <span class="price">$12.99</span>
				</div>
			</div>

			<div class="box">
				<div class="image">
					<img src="resources/images/menu-3.jpg" alt=""> <a href="#"
						class="fas fa-heart"></a>
				</div>
				<div class="content">
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<h3>delicious food</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Excepturi, accusantium.</p>
					<a href="#" class="btn">add to cart</a> <span class="price">$12.99</span>
				</div>
			</div>

			<div class="box">
				<div class="image">
					<img src="resources/images/menu-4.jpg" alt=""> <a href="#"
						class="fas fa-heart"></a>
				</div>
				<div class="content">
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<h3>delicious food</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Excepturi, accusantium.</p>
					<a href="#" class="btn">add to cart</a> <span class="price">$12.99</span>
				</div>
			</div>

			<div class="box">
				<div class="image">
					<img src="resources/images/menu-5.jpg" alt=""> <a href="#"
						class="fas fa-heart"></a>
				</div>
				<div class="content">
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<h3>delicious food</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Excepturi, accusantium.</p>
					<a href="#" class="btn">add to cart</a> <span class="price">$12.99</span>
				</div>
			</div>

			<div class="box">
				<div class="image">
					<img src="resources/images/menu-6.jpg" alt=""> <a href="#"
						class="fas fa-heart"></a>
				</div>
				<div class="content">
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<h3>delicious food</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Excepturi, accusantium.</p>
					<a href="#" class="btn">add to cart</a> <span class="price">$12.99</span>
				</div>
			</div>

			<div class="box">
				<div class="image">
					<img src="resources/images/menu-7.jpg" alt=""> <a href="#"
						class="fas fa-heart"></a>
				</div>
				<div class="content">
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<h3>delicious food</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Excepturi, accusantium.</p>
					<a href="#" class="btn">add to cart</a> <span class="price">$12.99</span>
				</div>
			</div>

			<div class="box">
				<div class="image">
					<img src="resources/images/menu-8.jpg" alt=""> <a href="#"
						class="fas fa-heart"></a>
				</div>
				<div class="content">
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<h3>delicious food</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Excepturi, accusantium.</p>
					<a href="#" class="btn">add to cart</a> <span class="price">$12.99</span>
				</div>
			</div>

			<div class="box">
				<div class="image">
					<img src="resources/images/menu-9.jpg" alt=""> <a href="#"
						class="fas fa-heart"></a>
				</div>
				<div class="content">
					<div class="stars">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i>
					</div>
					<h3>delicious food</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit.
						Excepturi, accusantium.</p>
					<a href="#" class="btn">add to cart</a> <span class="price">$12.99</span>
				</div>
			</div>  -->

		</div>

	</section>

	<!-- menu section ends -->

	<!-- review section starts  -->

	<section class="review" id="review">

		<h1 class="sub-heading">phản hồi từ khách hàng</h1>
		<div class="swiper-container review-slider">
			<div class="swiper-wrapper">
				<c:forEach var="feedback" items="${listFeedback }">

					<div class="swiper-slide slide">
						<i class="fas fa-quote-right"></i>
						<div class="user">

							<div class="user-info">
								<h3>${feedback.getAccountFeed().NAME }</h3>
								<div class="stars">
									<c:choose>
										<c:when test="${food.SCORE == 0 }">
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
										</c:when>
										<c:when test="${food.SCORE == 1}">
											<i class="fas fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
										</c:when>
										<c:when test="${food.SCORE == 2}">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
										</c:when>
										<c:when test="${food.SCORE == 3}">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="far fa-star"></i>
											<i class="far fa-star"></i>
										</c:when>
										<c:when test="${food.SCORE == 4}">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="far fa-star"></i>
										</c:when>
										<c:when test="${food.SCORE == 5}">
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
											<i class="fas fa-star"></i>
										</c:when>

									</c:choose>
								</div>
							</div>
						</div>
						<p>${feedback.COMMENT }</p>
					</div>
				</c:forEach>


				<!-- <div class="swiper-slide slide">
					<i class="fas fa-quote-right"></i>
					<div class="user">

						<div class="user-info">
							<h3>john deo</h3>
							<div class="stars">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
						</div>
					</div>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit
						fugiat consequuntur repellendus aperiam deserunt nihil, corporis
						fugit voluptatibus voluptate totam neque illo placeat eius quis
						laborum aspernatur quibusdam. Ipsum, magni.</p>
				</div>

				<div class="swiper-slide slide">
					<i class="fas fa-quote-right"></i>
					<div class="user">

						<div class="user-info">
							<h3>john deo</h3>
							<div class="stars">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
						</div>
					</div>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit
						fugiat consequuntur repellendus aperiam deserunt nihil, corporis
						fugit voluptatibus voluptate totam neque illo placeat eius quis
						laborum aspernatur quibusdam. Ipsum, magni.</p>
				</div>

				<div class="swiper-slide slide">
					<i class="fas fa-quote-right"></i>
					<div class="user">

						<div class="user-info">
							<h3>john deo</h3>
							<div class="stars">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
						</div>
					</div>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit
						fugiat consequuntur repellendus aperiam deserunt nihil, corporis
						fugit voluptatibus voluptate totam neque illo placeat eius quis
						laborum aspernatur quibusdam. Ipsum, magni.</p>
				</div> -->

			</div>

		</div>

	</section>

	<!-- review section ends -->

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

	<%-- <div class="modal fade hide" tabindex="-1" role="dialog" id="confirmModel"  >
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Thông báo</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
						
							<p>${message}</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary">Đồng ý</button>
						</div>
					</div>
				</div>
		</div> --%>

	<c:if test="${hasMess}">
		<script>
			alert("${message}");
		</script>
	</c:if>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<!-- custom js file link  -->
	<script src="resources/js/script.js"></script>

	<script>
		var confirm = function() {
			id = cId;
			console.log(cId);
			$('#confirmModel').modal('show');
			var str = "Thao tác này không thể khôi phục<br>Bạn chắc chắn muốn xóa chứ?";
			$('#confirmBody').html(str);
		}
		$('#btnConfirm').on('click', function(event) {
			console.log("c: " + id);
			window.location.href = "admin/category.htm?delete=" + id;
		});
	</script>
</body>
</html>