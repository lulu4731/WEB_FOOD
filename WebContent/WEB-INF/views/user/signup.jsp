<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link rel="stylesheet" href="resources/css/style1.css?v=1.0">

</head>
<body>
	<!-- header section starts      -->

	<header>

		<a href="#" class="logo"><i class="fas fa-utensils"></i>resto.</a>

		<nav class="navbar">
			<a class="active"
				href="${pageContext.servletContext.contextPath}/#home">home</a> <a
				href="${pageContext.servletContext.contextPath}/#dishes">dishes</a>
			<a href="${pageContext.servletContext.contextPath}/#about">about</a>
			<a href="${pageContext.servletContext.contextPath}/#menu">menu</a> <a
				href="${pageContext.servletContext.contextPath}/#review">review</a>
			<a href="#order">sign up</a>
		</nav>

		<div class="icons">
			<i class="fas fa-bars" id="menu-bars"></i>
		</div>

	</header>

	<!-- header section ends-->

	<!-- search form  -->

	<form action="" id="search-form">
		<input type="search" placeholder="search here..." name=""
			id="search-box"> <label for="search-box"
			class="fas fa-search"></label> <i class="fas fa-times" id="close"></i>
	</form>

	<!-- order section starts  -->

	<section class="order1" id="order">

		<h3 class="sub-heading">????ng k??</h3>
		<h1 class="heading">T???o t??i kho???n ????? c?? th??? mua h??ng</h1>

		<form:form action="signup.htm" modelAttribute="user" method="post"
			id="feedbackForm">

			<div class="inputBox">
				<div class="input">
					<span style="text-align: center">H??? v?? t??n</span> <br> <br>
					<form:errors path="name" element="div" />
					<form:input path="name" placeholder="Nh???p h??? v?? t??n c???a b???n!"></form:input>
				</div>
				<div class="input">
					<span style="text-align: center">?????a ch??? giao h??ng</span> <br>
					<br>
					<form:errors path="address" element="div" />
					<form:input path="address" placeholder="Nh???p ?????a ch??? c???a b???n!"></form:input>
				</div>
				<div class="input">
					<span style="text-align: center">S??? th???</span> <br> <br>
					<form:errors path="card" element="div" />
					<form:input path="card" type="number"
						placeholder="Nh???p s??? th??? c???a b???n!"></form:input>
				</div>
				<div class="input">
					<span style="text-align: center">S??? ??i???n tho???i</span> <br> <br>
					<form:errors path="phone" element="div" />
					<form:input path="phone" type="number"
						placeholder="Nh???p s??? ??i???n tho???i c???a b???n!"></form:input>
				</div>
				<div class="input">
					<span style="text-align: center">?????a ch??? email</span> <br> <br>
					<form:errors path="email" element="div" />
					<form:input path="email" placeholder="Nh???p email c???a b???n!"></form:input>
				</div>
				<div class="input">
					<span style="text-align: center">M???t kh???u</span> <br> <br>
					<form:errors path="password" element="div" />
					<form:input path="password" type="password"
						placeholder="Nh???p m???t kh???u c???a b???n!"></form:input>
				</div>
			</div>

			<div class="errors">${message }</div>

			<input type="submit" value="????ng k?? ngay" class="btn">

		</form:form>

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
	<!-- <div class="loader-container">
		<img src="resources/images/loader.gif" alt="">
	</div> -->

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<!-- custom js file link  -->
	<script src="resources/js/script.js"></script>


	<!-- footer section ends -->

	<script src="resources/assets/js/jquery-3.5.1.min.js"></script>
	<script src="resources/assets/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/moment.min.js"></script>
	<script src="resources/assets/js/popper.min.js"></script>
	<script src="resources/assets/js/bootstrap-datetimepicker.min.js"></script>
	<script src="resources/assets/js/app.js"></script>

</body>
</html>