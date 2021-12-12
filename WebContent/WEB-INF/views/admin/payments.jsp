<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
<title>Quản Lý Hóa Đơn</title>

<link rel="shortcut icon" type="image/x-icon"
	href=".././resources/assets/img/favicon.png">
<link rel="stylesheet"
	href=".././resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/line-awesome.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href=".././resources/assets/css/select2.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href=".././resources/assets/css/style.css">
</head>
<body>
	<%@include file="/WEB-INF/views/admin/header.jsp"%>
	<%@include file="/WEB-INF/views/admin/sidebar.jsp"%>
	<div class="page-wrapper">

		<div class="content container-fluid">
			<jsp:useBean id="pagedListHolder" scope="request"
				type="org.springframework.beans.support.PagedListHolder" />
			<c:url value="payments.htm" var="pagedLink">
				<c:param name="page" value="~" />
			</c:url>
			<div class="page-header">
				<div class="row">
					<div class="col-sm-12">
						<h3 class="page-title">Quản Lý Hóa Đơn</h3>
					</div>
				</div>
			</div>
			<form class="row filter-row">
				<div class="col-sm-6 col-md-3 col-lg-3 col-xl-3 col-12">
					<div class="form-group form-focus">
						<input type="text" class="form-control floating" name="searchM"
							id="searchM"> <label class="focus-label">Mã hóa đơn</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3 col-xl-3 col-12">
					<div class="form-group form-focus">
						<input type="text" class="form-control floating" name="searchName"
							id="searchName"> <label class="focus-label">Tên
							khách hàng</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">
					<div class="form-group form-focus">
						<div class="cal-icon">
							<input class="form-control floating datetimepicker" type="text"
								id="fromDate" name="fromDate">
						</div>
						<label class="focus-label">From</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">
					<div class="form-group form-focus">
						<div class="cal-icon">
							<input class="form-control floating datetimepicker" type="text"
								id="toDate" name="toDate">
						</div>
						<label class="focus-label">To</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3 col-xl-2 col-12">
					<button class="btn btn-success btn-block" name="searchHD" id="searchHD"
						type="submit">Search</button>
				</div>
			</form>
			<div class="col">
				<tg:paging pagedListHolder="${pagedListHolder}"
					pagedLink="${pagedLink}" />
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-responsive">
						<table class="table table-striped custom-table mb-0">
							<thead>
								<tr>
									<th>Mã hóa đơn</th>
									<th>Khách hàng</th>
									<th>Số tài khoản</th>
									<th>Ngày mua hàng</th>
									<th>Tổng thanh toán</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${pagedListHolder.pageList}">
									<tr>
										<td><a href="invoices.htm?linkReceipt=${u.ID_ORDER}">#INV-000${u.ID_ORDER}</a></td>
										<td>
											<h2>
												<a>${u.accountOrder.NAME}</a>
											</h2>
										</td>
										<td>${u.accountOrder.CARD_NUMBER}</td>
										<td>${u.DATE_TIME}</td>
										<td>${u.TOTAL_PRICE}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col">
							<tg:paging pagedListHolder="${pagedListHolder}"
								pagedLink="${pagedLink}" />
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>



	<script src=".././resources/assets/js/jquery-3.5.1.min.js"></script>
	<script src=".././resources/assets/js/popper.min.js"></script>
	<script src=".././resources/assets/js/bootstrap.min.js"></script>
	<script src=".././resources/assets/js/jquery.slimscroll.min.js"></script>
	<script src=".././resources/assets/js/select2.min.js"></script>
	<script src=".././resources/assets/js/jquery.dataTables.min.js"></script>
	<script src=".././resources/assets/js/dataTables.bootstrap4.min.js"></script>
	<script src=".././resources/assets/js/moment.min.js"></script>
	<script src=".././resources/assets/js/bootstrap-datetimepicker.min.js"></script>
	<!--  -->
	<script src=".././resources/assets/js/app.js"></script>
</body>
</html>