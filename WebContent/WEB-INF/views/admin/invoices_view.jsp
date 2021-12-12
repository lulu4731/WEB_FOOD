<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<meta name="description" content="Smarthr - Bootstrap Admin Template">
<meta name="keywords"
	content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
<meta name="author" content="Dreamguys - Bootstrap Admin Template">
<meta name="robots" content="noindex, nofollow">
<title>Xuất hóa đơn đặt hàng</title>

<link rel="shortcut icon" type="image/x-icon"
	href=".././resources/assets/img/favicon.png">
<link rel="stylesheet"
	href=".././resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/line-awesome.min.css">
<link rel="stylesheet" href=".././resources/assets/css/style.css">
</head>
<body>
	<%@include file="/WEB-INF/views/admin/header.jsp"%>
	<%@include file="/WEB-INF/views/admin/sidebar.jsp"%>

	<div class="page-wrapper">

		<div class="content container-fluid">

			<div class="page-header">
				<div class="row align-items-center">
					<div class="col">
						<h3 class="page-title">Hóa đơn mua hàng</h3>
						<!--  <ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
							<li class="breadcrumb-item active">Invoice</li>
						</ul>-->
					</div>
					<!--  <div class="col-auto float-right ml-auto">
						<div class="btn-group btn-group-sm">
							<button class="btn btn-white">CSV</button>
							<button class="btn btn-white">PDF</button>
							<button class="btn btn-white">
								<i class="fa fa-print fa-lg"></i> Print
							</button>
						</div>
					</div>-->
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-6 m-b-20">
									<img src="assets/img/logo2.png" class="inv-logo" alt="">
									<ul class="list-unstyled">
										<li>Chào mừng bạn đến với FOOD ÂU-MỸ</li>
										<li>97 Man Thiện, Phường Hiệp Phú, TP Thủ Đức, TP Hồ Chí
											Minh</li>
										<li>SĐT: 0327876080</li>
									</ul>
								</div>
								<div class="col-sm-6 m-b-20">
									<div class="invoice-details">
										<h3 class="text-uppercase">Hóa đơn
											#INV-000${order.ID_ORDER }</h3>
										<ul class="list-unstyled">
											<li>Ngày đặt hàng: <span>${order.DATE_TIME }</span></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6 col-lg-7 col-xl-8 m-b-20">
									<br> <br>
									<h4>Giao đến</h4>
									<ul class="list-unstyled">
										<li><h5>
												<strong>Anh/Chị: ${order.accountOrder.NAME}</strong>
											</h5></li>
										<li><span>SĐT: ${order.accountOrder.PHONE_NUMBER }</span></li>
										<li>Địa chỉ: ${order.ADDRESS }</li>
									</ul>
								</div>
								<div class="col-sm-6 col-lg-5 col-xl-4 m-b-20">
									<span class="text-muted">Chi tiết thanh toán :</span>
									<ul class="list-unstyled invoice-payment-details">
										<li><h5>
												Tổng tiền: <span class="text-right">${order.TOTAL_PRICE }</span>
											</h5></li>
										<li>Tổng số lượng món đã đặt: <span>10</span></li>
										<li>Phương thức thanh toán: <span>Thẻ</span></li>

									</ul>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-striped table-hover">
									<thead>
										<tr>
											<th>Thứ tự</th>
											<th>Tên món ăn</th>
											<th class="d-none d-sm-table-cell">Ghi chú</th>
											<th>Đơn giá</th>
											<th>Số lượng</th>
											<th class="text-right">Tổng tiền</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${order_item}" varStatus="loop">
											<tr>
												<td>${loop.index + 1 }</td>
												<td>${item.foodOrderItem.NAME }</td>
												<td class="d-none d-sm-table-cell">${item.order.NOTE }</td>
												<td>${item.ITEM_PRICE }</td>
												<td>${item.QUANTITY }</td>
												<td class="text-right">${item.ITEM_PRICE * item.QUANTITY}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div>
								<div class="row invoice-payment">
									<div class="col-sm-7"></div>
									<div class="col-sm-5">
										<div class="m-b-20">
											<div class="table-responsive no-border">
												<table class="table mb-0">
													<tbody>
														<tr>
															<th>Tổng cộng:</th>
															<td class="text-right">${order.TOTAL_PRICE }</td>
														</tr>
														<!-- 	<tr>
															<th>Tax: <span class="text-regular">(25%)</span></th>
															<td class="text-right">$1,750</td>
														</tr>
														<tr>
															<th>Total:</th>
															<td class="text-right text-primary"><h5>$8,750</h5></td>
														</tr> -->
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="invoice-info">
									<h5>Thông tin</h5>
									<p class="text-muted">Cảm ơn quý khách đã đặt món ăn của chúng
										tôi. Chúc quý khách ngon miệng. Mọi vấn đề liên quan đến món
										ăn xin liên hệ chúng tôi qua SĐT: 0327876080</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script data-cfasync="false"
		src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src=".././resources/assets/js/jquery-3.5.1.min.js"></script>
	<script src=".././resources/assets/js/popper.min.js"></script>
	<script src=".././resources/assets/js/bootstrap.min.js"></script>
	<script src=".././resources/assets/js/jquery.slimscroll.min.js"></script>
	<script src=".././resources/assets/js/app.js"></script>
</body>
</html>