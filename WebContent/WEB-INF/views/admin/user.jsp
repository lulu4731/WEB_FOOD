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
<title>Trang quản lý tài khoản</title>

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
		<c:url value="user.htm" var="pagedLink">
			<c:param name="page" value="~" />
		</c:url>
		<div class="content container-fluid">
			<div class="page-header">
				<div class="row align-items-center">
					<div class="col">
						<h3 class="page-title">Quản Lý Tài khoản</h3>
					</div>
				</div>
			</div>

			<form class="row filter-row">
				<div class="col-sm-6 col-md-3">
					<div class="form-group form-focus">
						<input type="text" class="form-control floating" name="searchName"
							id="searchName"> <label class="focus-label">Tên</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="form-group form-focus">
						<input type="text" class="form-control floating" name="searchSDT"
							id="searchSDT"> <label class="focus-label">Số
							điện thoại</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="form-group form-focus select-focus">
						<select class="select floating" name="searchQ" id="searchQ">
							<option value=''>--Select--</option>
							<option value=1>Admin</option>
							<option value=2>Nhân viên</option>
							<option value=3>Người dùng</option>
						</select> <label class="focus-label">Quyền</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<button class="btn btn-success btn-block" name="btnsearch"
						id="search" type="submit">Search</button>
				</div>
			</form>
			<!--  <div class="row">
				<form class="col">
					<label>Show <select
						class="custom-select-sm form-control-sm"
						style="background-color: #2e3439; color: #bbc4cc" id="count"
						name="count"><option value=5>5</option>
							<option value=9>9</option>
							<option value=18>18</option>
							<option value=36>36</option></select>
						<button class="btn btn-success" type="submit">Choose</button></label>

				</form>
			</div>-->
			<div class="col">
				<tg:paging pagedListHolder="${pagedListHolder}"
					pagedLink="${pagedLink}" />
			</div>
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-striped custom-table">
						<thead>
							<tr>
								<th>Tên</th>
								<th>Email</th>
								<th>Số điện thoại</th>
								<th>Địa chỉ</th>
								<th>Quyền</th>
								<th class="text-right">Trạng thái</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="u" items="${pagedListHolder.pageList}">
								<tr>
									<td>
										<h2 class="table-avatar">
											<a class="avatar"><img
												src="http://windows79.com/wp-content/uploads/2021/02/Thay-the-hinh-dai-dien-tai-khoan-nguoi-dung-mac.png"
												alt=""></a> <a href="profile.html">${u.NAME}<span>${u.role.ID_ROLE == 1 ? 'Admin' : (u.role.ID_ROLE == 2 ? 'Nhân viên' : 'Người dùng' )}</span></a>
										</h2>
									</td>
									<td><a>${u.EMAIL}</a></td>
									<td>${u.PHONE_NUMBER }</td>
									<td>${u.ADDRESS}</td>
									<td>
									<%-- <span
										class="${u.role.ID_ROLE == 1 ? 'badge bg-inverse-danger' : (u.role.ID_ROLE == 2 ? 'badge bg-inverse-info' : 'badge bg-inverse-success' )}">${u.role.ID_ROLE == 1 ? 'Admin' : (u.role.ID_ROLE == 2 ? 'Nhân viên' : 'Người dùng' )}</span> --%>
										
										<div class="dropdown action-label">
											<a class="btn btn-white btn-sm btn-rounded dropdown-toggle"
												href="#" data-toggle="dropdown" aria-expanded="false"> <i
												class="fa fa-dot-circle-o ${u.role.ID_ROLE == 1 ? 'text-danger' : (u.role.ID_ROLE == 2 ? 'text-info' : 'text-success' )}"></i>
												${u.role.ID_ROLE == 1 ? 'Admin' : (u.role.ID_ROLE == 2 ? 'Nhân viên' : 'Người dùng' )}
											</a>
											<c:choose>
												<c:when test="${u.role.ID_ROLE == 1}">
												</c:when>
												<c:otherwise>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item"
															href="${u.ID_ACCOUNT}.htm?linkChangeRole2"><i
															class="fa fa-dot-circle-o text-success"></i> Người dùng</a> <a
															class="dropdown-item"
															href="${u.ID_ACCOUNT}.htm?linkChangeRole3"><i
															class="fa fa-dot-circle-o text-info"></i> Nhân viên</a>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
										
										</td>
									<td class="text-right">
										<div class="dropdown action-label">
											<a class="btn btn-white btn-sm btn-rounded dropdown-toggle"
												href="#" data-toggle="dropdown" aria-expanded="false"> <i
												class="fa fa-dot-circle-o ${u.IS_ACTIVE == true ? 'text-success' : 'text-danger'}"></i>
												${u.IS_ACTIVE == true ? 'Hoạt động' : 'Khóa'}
											</a>
											<c:choose>
												<c:when test="${u.role.ID_ROLE == 1}">
												</c:when>
												<c:otherwise>
													<div class="dropdown-menu dropdown-menu-right">
														<a class="dropdown-item"
															href="${u.ID_ACCOUNT}.htm?linkIsActive0"><i
															class="fa fa-dot-circle-o text-danger"></i> Khóa</a> <a
															class="dropdown-item"
															href="${u.ID_ACCOUNT}.htm?linkIsActive1"><i
															class="fa fa-dot-circle-o text-success"></i> Hoạt động</a>
													</div>
												</c:otherwise>
											</c:choose>
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


	<!--  <div id="add_user" class="modal custom-modal fade" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add User</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>First Name <span class="text-danger">*</span></label> <input
										class="form-control" type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Last Name</label> <input class="form-control"
										type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Username <span class="text-danger">*</span></label> <input
										class="form-control" type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Email <span class="text-danger">*</span></label> <input
										class="form-control" type="email">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Password</label> <input class="form-control"
										type="password">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Confirm Password</label> <input class="form-control"
										type="password">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Phone </label> <input class="form-control" type="text">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Role</label> <select class="select">
										<option>Admin</option>
										<option>Client</option>
										<option>Employee</option>
									</select>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Company</label> <select class="select">
										<option>Global Technologies</option>
										<option>Delta Infotech</option>
									</select>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Employee ID <span class="text-danger">*</span></label> <input
										type="text" class="form-control floating">
								</div>
							</div>
						</div>
						<div class="submit-section">
							<button class="btn btn-primary submit-btn">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>-->



	<script data-cfasync="false"
		src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src=".././resources/assets/js/jquery-3.5.1.min.js"></script>
	<script src=".././resources/assets/js/popper.min.js"></script>
	<script src=".././resources/assets/js/bootstrap.min.js"></script>
	<script src=".././resources/assets/js/jquery.slimscroll.min.js"></script>
	<script src=".././resources/assets/js/select2.min.js"></script>
	<script src=".././resources/assets/js/moment.min.js"></script>
	<script src=".././resources/assets/js/bootstrap-datetimepicker.min.js"></script>
	<script src=".././resources/assets/js/jquery.dataTables.min.js"></script>
	<script src=".././resources/assets/js/dataTables.bootstrap4.min.js"></script>
	<script src=".././resources/assets/js/app.js"></script>
</body>
</body>
</html>