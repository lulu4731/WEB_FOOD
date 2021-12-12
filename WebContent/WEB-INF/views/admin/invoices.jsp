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
<title>Quản Lý Món Ăn</title>

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
		<c:url value="food.htm" var="pagedLink">
			<c:param name="page" value="~" />
		</c:url>
		<div class="content container-fluid">
			<div class="page-header">
				<div class="row align-items-center">
					<div class="col">
						<h3 class="page-title">Quản Lý Món Ăn</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title mb-0">Thêm món ăn</h4>
						</div>
						<div class="card-body">
							<form:form modelAttribute="foods" action="food.htm" method="POST" enctype="multipart/form-data">
								<div class="row">
									<div class="col-xl-6">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">TÊN</label>
											<div class="col-lg-9">
												<form:input path="NAME" class="form-control" />
												<form:errors path="NAME" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">GIÁ</label>
											<div class="col-lg-9">
												<form:input path="PRICE" class="form-control" type="number"/>
												<form:errors path="PRICE" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">MỞ BÁN</label>
											<div class="col-lg-9">
												<form:select class="select" path="STATUS" items="${status}">
												</form:select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">IMAGE</label>
											<div class="col-lg-9">
												<form:input path="IMAGE" class="form-control" type="file"/>
											</div>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">SỐ LƯỢNG</label>
											<div class="col-lg-9">
												<form:input path="AMOUNT" class="form-control" type="number" />
												<form:errors path="AMOUNT" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">SỐ LƯỢNG CÒN</label>
											<div class="col-lg-9">
												<form:input path="AMOUNT_DEFAULT" class="form-control" type="number"/>
												<form:errors path="AMOUNT_DEFAULT" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-3 col-form-label">MÔ TẢ MÓN ĂN</label>
											<div class="col-lg-9">
												<form:textarea rows="4" cols="5" class="form-control"
													path="DESCRIBE"></form:textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="text-right">
									<button class="btn btn-primary" name="${btnStatus}">Submit</button>
								</div>
							</form:form>
						</div>
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
					<div class="form-group form-focus select-focus">
						<select class="select floating" name="searchTT" id="searchTT">
							<option value=''>--Select--</option>
							<option value=true>MỞ BÁN</option>
							<option value=false>KHÔNG MỞ BÁN</option>
						</select> <label class="focus-label">Trạng thái</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<button class="btn btn-success btn-block" name="btnsearchFood"
						id="searchFood" type="submit">Search</button>
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
									<th>Số lượng</th>
									<th>Số lượng còn</th>
									<th>Tiền</th>
									<th>Mô tả món ăn</th>
									<th class="text-left">Trạng thái</th>
									<th class="text-right">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${pagedListHolder.pageList}">
									<tr>
										<td><strong>${u.NAME}</strong></td>
										<td>${u.AMOUNT }</td>
										<td>${u.AMOUNT_DEFAULT }</td>
										<td>${u.PRICE }</td>
										<td>${u.DESCRIBE }</td>
										<td class="text-left">
											<div class="dropdown action-label">
												<a class="btn btn-white btn-sm btn-rounded dropdown-toggle"
													href="#" data-toggle="dropdown" aria-expanded="false">
													<i
													class="fa fa-dot-circle-o ${u.STATUS == true ? 'text-success' : 'text-danger'}"></i>
													${u.STATUS == true ? 'Mở bán' : 'Không mở bán'}
												</a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item"
														href="${u.ID_FOOD}.htm?linkStatusFood0"><i
														class="fa fa-dot-circle-o text-danger"></i> Không</a> <a
														class="dropdown-item"
														href="${u.ID_FOOD}.htm?linkStatusFood1"><i
														class="fa fa-dot-circle-o text-success"></i> Có</a>
												</div>
											</div>
										</td>
										<td class="text-right">
											<div class="dropdown dropdown-action">
												<a href="#" class="action-icon dropdown-toggle"
													data-toggle="dropdown" aria-expanded="false"><i
													class="material-icons">more_vert</i></a>
												<div class="dropdown-menu dropdown-menu-right">
													<a class="dropdown-item"
														href="${u.ID_FOOD}.htm?linkEditFood"><i
														class="fa fa-pencil m-r-5"></i> Edit</a>
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