<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Quản Lý Phản Hồi</title>

<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.png">
<link rel="stylesheet"
	href=".././resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/line-awesome.min.css">
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
		<c:url value="feedback.htm" var="pagedLink">
			<c:param name="page" value="~" />
		</c:url>
		<div class="content container-fluid">
			<div class="page-header">
				<div class="row align-items-center">
					<div class="col">
						<h3 class="page-title">Quản Lý Phản Hồi</h3>
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
						<div class="cal-icon">
							<input class="form-control floating datetimepicker" type="text"
								id="fromDate" name="fromDate">
						</div>
						<label class="focus-label">From</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3 col-xl-3 col-12">
					<div class="form-group form-focus">
						<div class="cal-icon">
							<input class="form-control floating datetimepicker" type="text"
								id="toDate" name="toDate">
						</div>
						<label class="focus-label">To</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3 col-xl-3 col-12">
					<button class="btn btn-success btn-block" name="searchFB"
						id="searchFB" type="submit">Search</button>
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
									<th>Tên</th>
									<th>Điểm</th>
									<th>Bình luận</th>
									<th>Ngày</th>
									<th class="text-right">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${pagedListHolder.pageList}">
									<tr>
										<td>
											<h2 class="table-avatar">
												<a href="profile.html" class="avatar"><img
													src="http://windows79.com/wp-content/uploads/2021/02/Thay-the-hinh-dai-dien-tai-khoan-nguoi-dung-mac.png"
													alt=""></a> <a href="profile.html">${u.accountFeed.NAME}<span>${u.accountFeed.role.ID_ROLE == 1 ? 'Admin' : (u.accountFeed.role.ID_ROLE == 2 ? 'Quản lý' : 'Người dùng' )}</span></a>
											</h2>
										</td>
										<td>${u.SCORE }</td>
										<td>${u.COMMENT}</td>
										<td>${u.DATE_TIME }</td>
										<td class="text-right">
											<div class="dropdown dropdown-action">
												<a href="#" class="action-icon dropdown-toggle"
													data-toggle="dropdown" aria-expanded="false"><i
													class="material-icons">more_vert</i></a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item" data-toggle="modal"
														data-target="#delete_expense"><i
														class="fa fa-trash-o m-r-5"></i> Delete</a>
												</div>
											</div>

											<div class="modal custom-modal fade" id="delete_expense"
												data-toggle="modal" data-target="#delete_expense"
												role="dialog">
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
																		<a href="${u.ID_FEEDBACK}.htm?linkDeleteFeedBack"
																			class="btn btn-primary continue-btn">Delete</a>
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
										</td>
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
		</div>
	</div>



	<script src=".././resources/assets/js/jquery-3.5.1.min.js"></script>
	<script src=".././resources/assets/js/popper.min.js"></script>
	<script src=".././resources/assets/js/bootstrap.min.js"></script>
	<script src=".././resources/assets/js/jquery.slimscroll.min.js"></script>
	<script src=".././resources/assets/js/select2.min.js"></script>
	<script src=".././resources/assets/js/app.js"></script>
	<script src=".././resources/assets/js/moment.min.js"></script>
	<script src=".././resources/assets/js/bootstrap-datetimepicker.min.js"></script>
</body>
</body>
</html>