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
<title>Quản lý đơn hàng</title>

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
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="order.htm" var="pagedLink">
			<c:param name="page" value="~" />
		</c:url>
		<div class="content container-fluid">
			<div class="page-header">
				<div class="row align-items-center">
					<div class="col">
						<h3 class="page-title">Quản Lý Đơn hàng</h3>
					</div>
				</div>
			</div>


			<form class="row filter-row">
				<div class="col-sm-6 col-md-3 col-lg-3 col-xl-3 col-12">
					<div class="form-group form-focus">
						<input type="text" class="form-control floating" name="searchName"
							id="searchName"> <label class="focus-label">Tên
							khách hàng</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3 col-xl-3 col-12">
					<div class="form-group form-focus">
						<input type="text" class="form-control floating" name="searchSDT"
							id="searchSDT"> <label class="focus-label">Số điện thoại</label>
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
					<button class="btn btn-success btn-block" name="search" id="search"
						type="submit">Search</button>
				</div>
			</form>
			<div>
				<tg:paging pagedListHolder="${pagedListHolder}"
					pagedLink="${pagedLink}" />
			</div>

			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-striped custom-table">
						<thead>
							<tr>
								<th>Món ăn/Số lượng</th>
								<th>Khách hàng</th>
								<th>Thời gian</th>
								<th>Địa chỉ</th>
								<th>Số điện thoại</th>
								<th>Tổng tiền</th>
								<th>Thanh toán</th>
								<th>Trạng thái</th>
								<!-- <th class="text-right">Hành động</th> -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${pagedListHolder.pageList}">
								<tr>
									<td><c:forEach var="item" items="${u.getItem()}">
											<strong>${item.foodOrderItem.NAME }: ${item.QUANTITY }</strong>
										</c:forEach></td>
									<td>
										<h2 class="table-avatar">
											<a href="profile.html" class="avatar avatar-xs"><img
												src="http://windows79.com/wp-content/uploads/2021/02/Thay-the-hinh-dai-dien-tai-khoan-nguoi-dung-mac.png"
												alt=""></a> <a href="profile.html">${u.accountOrder.NAME}</a>
										</h2>
									</td>
									<td>${u.DATE_TIME }</td>
									<td>${u.ADDRESS }</td>
									<td>0327896968</td>
									<!-- Chinh sua tien -->
									<td>${u.TOTAL_PRICE}</td>
									<td>${u.accountOrder.CARD_NUMBER}</td>
									<td>
										<div class="dropdown action-label">
											<a class="btn btn-white btn-sm btn-rounded dropdown-toggle"
												href="#" data-toggle="dropdown" aria-expanded="false"> <i
												class="fa fa-dot-circle-o ${u.STATUS == 1 ? 'text-info' : (u.STATUS == 2 ? 'text-success' : 'text-danger')}"></i>
												${u.STATUS == 1 ? 'Đặt hàng' : (u.STATUS == 2 ? 'Đã giao' : 'Hủy')}
											</a>
											<c:choose>
												<c:when test="${u.STATUS == 2}">
												</c:when>
												<c:otherwise>
											<div class="dropdown-menu dropdown-menu-right">
												<a class="dropdown-item"
													href="${u.ID_ORDER}.htm?linkStatus0"><i
													class="fa fa-dot-circle-o text-danger"></i> Hủy</a> 
													<!--  <a
													class="dropdown-item" href="${u.ID_ORDER}.htm?linkStatus1"><i
													class="fa fa-dot-circle-o text-info"></i> Đặt hàng</a> -->
													<a
													class="dropdown-item" href="${u.ID_ORDER}.htm?linkStatus2"><i
													class="fa fa-dot-circle-o text-success"></i> Đã giao</a>
											</div>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
								<!--	<td class="text-right">
										<div class="dropdown dropdown-action">
											<a href="#" class="action-icon dropdown-toggle"
												data-toggle="dropdown" aria-expanded="false"><i
												class="material-icons">more_vert</i></a>
											<div class="dropdown-menu dropdown-menu-right">
												<a class="dropdown-item" href="" data-toggle="modal"
													data-target="#edit_expense"><i
													class="fa fa-pencil m-r-5"></i> Edit</a> <a
													class="dropdown-item" href="#" data-toggle="modal"
													data-target="#delete_expense"><i
													class="fa fa-trash-o m-r-5"></i> Delete</a>
											</div>
										</div>
									</td>  -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div>
						<tg:paging pagedListHolder="${pagedListHolder}"
							pagedLink="${pagedLink}" />
					</div>
				</div>
			</div>
		</div>


		<div id="add_expense" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Add Expense</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Item Name</label> <input class="form-control"
											type="text">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Purchase From</label> <input class="form-control"
											type="text">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Purchase Date</label>
										<div class="cal-icon">
											<input class="form-control datetimepicker" type="text">
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Purchased By </label> <select class="select">
											<option>Daniel Porter</option>
											<option>Roger Dixon</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Amount</label> <input placeholder="$50"
											class="form-control" type="text">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Paid By</label> <select class="select">
											<option>Cash</option>
											<option>Cheque</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Status</label> <select class="select">
											<option>Pending</option>
											<option>Approved</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Attachments</label> <input class="form-control"
											type="file">
									</div>
								</div>
							</div>
							<div class="attach-files">
								<ul>
									<li><img src="assets/img/placeholder.jpg" alt=""> <a
										href="#" class="fa fa-close file-remove"></a></li>
									<li><img src="assets/img/placeholder.jpg" alt=""> <a
										href="#" class="fa fa-close file-remove"></a></li>
								</ul>
							</div>
							<div class="submit-section">
								<button class="btn btn-primary submit-btn">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<div id="edit_expense" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Edit Expense</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Item Name</label> <input class="form-control"
											value="Dell Laptop" type="text">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Purchase From</label> <input class="form-control"
											value="Amazon" type="text">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Purchase Date</label>
										<div class="cal-icon">
											<input class="form-control datetimepicker" type="text">
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Purchased By </label> <select class="select">
											<option>Daniel Porter</option>
											<option>Roger Dixon</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Amount</label> <input placeholder="$50"
											class="form-control" value="$10000" type="text">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Paid By</label> <select class="select">
											<option>Cash</option>
											<option>Cheque</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Status</label> <select class="select">
											<option>Pending</option>
											<option>Approved</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Attachments</label> <input class="form-control"
											type="file">
									</div>
								</div>
							</div>
							<div class="attach-files">
								<ul>
									<li><img src="assets/img/placeholder.jpg" alt=""> <a
										href="#" class="fa fa-close file-remove"></a></li>
									<li><img src="assets/img/placeholder.jpg" alt=""> <a
										href="#" class="fa fa-close file-remove"></a></li>
								</ul>
							</div>
							<div class="submit-section">
								<button class="btn btn-primary submit-btn">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<div class="modal custom-modal fade" id="delete_expense" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-header">
							<h3>Delete Expense</h3>
							<p>Are you sure want to delete?</p>
						</div>
						<div class="modal-btn delete-action">
							<div class="row">
								<div class="col-6">
									<a href="#" class="btn btn-primary continue-btn">Delete</a>
								</div>
								<div class="col-6">
									<a href="javascript:void(0);" data-dismiss="modal"
										class="btn btn-primary cancel-btn">Cancel</a>
								</div>
							</div>
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