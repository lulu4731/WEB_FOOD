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
<title>Trang quản lý</title>

<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.png">
<link rel="stylesheet"
	href=".././resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href=".././resources/assets/css/line-awesome.min.css">
<link rel="stylesheet"
	href=".././resources/assets/plugins/morris/morris.css">
<link rel="stylesheet" href=".././resources/assets/css/style.css">
</head>
<body>
	<div class="main-wrapper">
		<%@include file="/WEB-INF/views/admin/header.jsp"%>
		<%@include file="/WEB-INF/views/admin/sidebar.jsp"%>

		<div class="page-wrapper">

			<div class="content container-fluid">

				<div class="page-header">
					<div class="row">
						<div class="col-sm-12">
							<h3 class="page-title">Xin chào Admin!</h3>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
						<div class="card dash-widget">
							<div class="card-body">
								<span class="dash-widget-icon"><i class="fa fa-cubes"></i></span>
								<div class="dash-widget-info">
									<h3>${countFoodTrue }</h3>
									<span>Số lượng món ăn được mở bán</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
						<div class="card dash-widget">
							<div class="card-body">
								<span class="dash-widget-icon"><i class="fa fa-usd"></i></span>
								<div class="dash-widget-info">
									<h3>${sumNT }</h3>
									<span>Số tiền thu được theo ngày</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
						<div class="card dash-widget">
							<div class="card-body">
								<span class="dash-widget-icon"><i class="fa fa-diamond"></i></span>
								<div class="dash-widget-info">
									<h3>${countNSLDH }/${countNSLTDH }</h3>
									<span>Đơn hàng đã duyệt/Tổng đơn</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
						<div class="card dash-widget">
							<div class="card-body">
								<span class="dash-widget-icon"><i class="fa fa-user"></i></span>
								<div class="dash-widget-info">
									<h3>${countFBTN }</h3>
									<span>Số lượng phản hồi theo ngày</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  	<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6 text-center">
								<div class="card">
									<div class="card-body">
										<h3 class="card-title">Total Revenue</h3>
										<div id="bar-charts"></div>
									</div>
								</div>
							</div>
							<div class="col-md-6 text-center">
								<div class="card">
									<div class="card-body">
										<h3 class="card-title">Sales Overview</h3>
										<div id="line-charts"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>-->
				<div class="row">
					<div class="col-md-12">
						<div class="card-group m-b-30">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between mb-3">
										<div>
											<span class="d-block">Số lượng đơn hàng</span>
										</div>
										<div>
											<span
												class="${avgSLDH < 100 ? 'text-danger' :'text-success'}">${avgSLDH < 100 ? '-' : '+'}${avgSLDH < 100 ? 100 - avgSLDH : (avgSLDH == 100 ? avgSLDH : avgSLDH -100)}%</span>
										</div>
									</div>
									<h3 class="mb-3">${sum1SLDH }</h3>
									<div class="progress mb-2" style="height: 5px;">
										<div class="progress-bar bg-primary" role="progressbar"
											style="width: ${avgSLDH}%;" aria-valuenow="40"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<p class="mb-0">
										Tháng trước <span class="text-muted">${sum2SLDH }</span>
									</p>
								</div>
							</div>
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between mb-3">
										<div>
											<span class="d-block">Số tiền thu được</span>
										</div>
										<div>
											<span class="${avg < 100 ? 'text-danger' :'text-success'}">${avg < 100 ? '-' : '+'}${avg < 100 ? 100 - avg : (avg == 100 ? avg : avg -100)}%</span>
										</div>
									</div>
									<h3 class="mb-3">${sum1}</h3>
									<div class="progress mb-2" style="height: 5px;">
										<div class="progress-bar bg-primary" role="progressbar"
											style="width: ${avg}%;" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
									<p class="mb-0">
										Tháng trước <span class="text-muted">${sum2}</span>
									</p>
								</div>
							</div>
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between mb-3">
										<div>
											<span class="d-block">Số lượng phần ăn được đặt</span>
										</div>
										<div>
											<span
												class="${avgSLMA < 100 ? 'text-danger' :'text-success'}">${avgSLMA < 100 ? '-' : '+'}${avgSLMA < 100 ? 100 - avgSLMA : (avgSLMA == 100 ? avgSLMA : avgSLMA -100)}%</span>
										</div>
									</div>
									<h3 class="mb-3">${countSLMNTT1 }</h3>
									<div class="progress mb-2" style="height: 5px;">
										<div class="progress-bar bg-primary" role="progressbar"
											style="width: ${avgSLMA}%;" aria-valuenow="40"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<p class="mb-0">
										Tháng trước <span class="text-muted">${countSLMNTT2 }</span>
									</p>
								</div>
							</div>
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between mb-3">
										<div>
											<span class="d-block">Số lượng phản hồi</span>
										</div>
										<div>
											<span
												class="${avgSLFB < 100 ? 'text-danger' :'text-success'}">${avgSLFB < 100 ? '-' : '+'}${avgSLFB < 100 ? 100 - avgSLFB : (avgSLFB == 100 ? avgSLFB : avgSLFB -100)}%</span>
										</div>
									</div>
									<h3 class="mb-3">${countFBTT1 }</h3>
									<div class="progress mb-2" style="height: 5px;">
										<div class="progress-bar bg-primary" role="progressbar"
											style="width: ${avgSLFB}%;" aria-valuenow="40"
											aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<p class="mb-0">
										Tháng trước <span class="text-muted">${countFBTT2 }</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 col-lg-12 col-xl-4 d-flex">
						<div class="card flex-fill dash-statistics">
							<div class="card-body">
								<h5 class="card-title">Doanh thu 5 tháng gần nhất: ${avg5t }</h5>
								<div class="stats-list">
									<div class="stats-info">
										<p>
											Tháng ${month} <strong>${sum1} <small>/
													${Math.round(sum1*100/avg5t*10)/10}%</small></strong>
										</p>
										<div class="progress">
											<div class="progress-bar bg-primary" role="progressbar"
												style="width: ${sum1*100/avg5t}%" aria-valuenow="31"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
									<div class="stats-info">
										<p>
											Tháng ${month-1} <strong>${sum2} <small>/
													${Math.round(sum2*100/avg5t*10)/10}%</small></strong>
										</p>
										<div class="progress">
											<div class="progress-bar bg-purple" role="progressbar"
												style="width: ${sum2*100/avg5t}%" aria-valuenow="31"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
									<div class="stats-info">
										<p>
											Tháng ${month-2} <strong>${sum3} <small>/
													${Math.round(sum3*100/avg5t*10)/10}%</small></strong>
										</p>
										<div class="progress">
											<div class="progress-bar bg-success" role="progressbar"
												style="width: ${sum3*100/avg5t}%" aria-valuenow="62"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
									<div class="stats-info">
										<p>
											Tháng ${month-3} <strong>${sum4} <small>/
													${Math.round(sum4*100/avg5t*10)/10}%</small></strong>
										</p>
										<div class="progress">
											<div class="progress-bar bg-danger" role="progressbar"
												style="width: ${sum4*100/avg5t}%" aria-valuenow="62"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
									<div class="stats-info">
										<p>
											Tháng ${month-4} <strong>${sum5} <small>/
													${Math.round(sum5*100/avg5t)}%</small></strong>
										</p>
										<div class="progress">
											<div class="progress-bar bg-info" role="progressbar"
												style="width: ${sum5*100/avg5t}%" aria-valuenow="22"
												aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-6 col-xl-4 d-flex">
						<div class="card flex-fill">
							<div class="card-body">
								<h4 class="card-title">Tổng các món ăn bán được nhiều nhất trong tháng</h4>
								<div class="statistics">
									<div class="row">
										<div class="col-md-6 col-6 text-center">
											<div class="stats-box mb-4">
												<p>Tổng số phần</p>
												<h3>${countF }</h3>
											</div>
										</div>
										<div class="col-md-6 col-6 text-center">
											<div class="stats-box mb-4">
												<p>Số món</p>
												<h3>5</h3>
											</div>
										</div>
									</div>
								</div>
								<div class="progress mb-4">
								<c:forEach var="u" items="${food}" varStatus="loop">
									
									<div class="progress-bar ${loop.index == 0 ? 'bg-purple' : (loop.index == 1 ? 'bg-warning' : (loop.index == 2 ? 'bg-success' : (loop.index == 3 ? 'bg-danger' : 'bg-info')))}" role="progressbar"
										style="width: ${u.countFood * 100 / countF}%" aria-valuenow="30" aria-valuemin="0"
										aria-valuemax="100">${Math.round(u.countFood * 100 / countF)}%</div>
									
									
									<!-- <div class="progress-bar bg-warning" role="progressbar"
										style="width: 22%" aria-valuenow="18" aria-valuemin="0"
										aria-valuemax="100">22%</div>
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 24%" aria-valuenow="12" aria-valuemin="0"
										aria-valuemax="100">24%</div>
									<div class="progress-bar bg-danger" role="progressbar"
										style="width: 26%" aria-valuenow="14" aria-valuemin="0"
										aria-valuemax="100">21%</div>
									<div class="progress-bar bg-info" role="progressbar"
										style="width: 10%" aria-valuenow="14" aria-valuemin="0"
										aria-valuemax="100">10%</div> -->
											</c:forEach>
								</div>
								<div>
									<c:forEach var="u" items="${food}" varStatus="loop">
										<p>
											<i class="fa fa-dot-circle-o ${loop.index == 0 ? 'text-purple' : (loop.index == 1 ? 'text-warning' : (loop.index == 2 ? 'text-success' : (loop.index == 3 ? 'text-danger' : 'text-info')))} mr-2"></i>${u.name }
											<span class="float-right">${u.countFood}</span>
										</p>
										<!-- <p>
										<i class="fa fa-dot-circle-o text-warning mr-2"></i>Inprogress
										Tasks <span class="float-right">115</span>
									</p>
									<p>
										<i class="fa fa-dot-circle-o text-success mr-2"></i>On Hold
										Tasks <span class="float-right">31</span>
									</p>
									<p>
										<i class="fa fa-dot-circle-o text-danger mr-2"></i>Pending
										Tasks <span class="float-right">47</span>
									</p>
									<p class="mb-0">
										<i class="fa fa-dot-circle-o text-info mr-2"></i>Review Tasks
										<span class="float-right">5</span>
									</p> -->
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-lg-6 col-xl-4 d-flex">
						<div class="card flex-fill">
							<div class="card-body">
								<h4 class="card-title">
									Số lượng nhân viên hoạt động <span
										class="badge bg-inverse-success ml-2">${countNV }</span>
								</h4>
								<c:forEach var="u" items="${nv}">
									<div class="leave-info-box">
										<div class="media align-items-center">
											<a href="profile.html" class="avatar"><img alt=""
												src="http://windows79.com/wp-content/uploads/2021/02/Thay-the-hinh-dai-dien-tai-khoan-nguoi-dung-mac.png"></a>
											<div class="media-body">
												<div class="text-sm my-0">${u.NAME}</div>
											</div>
										</div>
										<div class="row align-items-center mt-3">
											<div class="col-6">
												<h6 class="mb-0">SĐT: ${u.PHONE_NUMBER}</h6>
												<span class="text-sm text-muted">Quyền hạn: Nhân viên</span>
											</div>
											<div class="col-6 text-right">
												<span
													class="badge ${u.IS_ACTIVE ? 'bg-inverse-success' :'bg-inverse-danger'}">${u.IS_ACTIVE ? 'Hoạt động' :'Không hoạt động'}</span>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="load-more text-center">
									<a class="text-dark" href="user.htm">Xem thêm</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- <div class="row">
					<div class="col-md-6 d-flex">
						<div class="card card-table flex-fill">
							<div class="card-header">
								<h3 class="card-title mb-0">Invoices</h3>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-nowrap custom-table mb-0">
										<thead>
											<tr>
												<th>Invoice ID</th>
												<th>Client</th>
												<th>Due Date</th>
												<th>Total</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a href="invoice-view.html">#INV-0001</a></td>
												<td>
													<h2>
														<a href="#">Global Technologies</a>
													</h2>
												</td>
												<td>11 Mar 2019</td>
												<td>$380</td>
												<td><span class="badge bg-inverse-warning">Partially
														Paid</span></td>
											</tr>
											<tr>
												<td><a href="invoice-view.html">#INV-0002</a></td>
												<td>
													<h2>
														<a href="#">Delta Infotech</a>
													</h2>
												</td>
												<td>8 Feb 2019</td>
												<td>$500</td>
												<td><span class="badge bg-inverse-success">Paid</span>
												</td>
											</tr>
											<tr>
												<td><a href="invoice-view.html">#INV-0003</a></td>
												<td>
													<h2>
														<a href="#">Cream Inc</a>
													</h2>
												</td>
												<td>23 Jan 2019</td>
												<td>$60</td>
												<td><span class="badge bg-inverse-danger">Unpaid</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="card-footer">
								<a href="invoices.html">View all invoices</a>
							</div>
						</div>
					</div>
					<div class="col-md-6 d-flex">
						<div class="card card-table flex-fill">
							<div class="card-header">
								<h3 class="card-title mb-0">Payments</h3>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table custom-table table-nowrap mb-0">
										<thead>
											<tr>
												<th>Invoice ID</th>
												<th>Client</th>
												<th>Payment Type</th>
												<th>Paid Date</th>
												<th>Paid Amount</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a href="invoice-view.html">#INV-0001</a></td>
												<td>
													<h2>
														<a href="#">Global Technologies</a>
													</h2>
												</td>
												<td>Paypal</td>
												<td>11 Mar 2019</td>
												<td>$380</td>
											</tr>
											<tr>
												<td><a href="invoice-view.html">#INV-0002</a></td>
												<td>
													<h2>
														<a href="#">Delta Infotech</a>
													</h2>
												</td>
												<td>Paypal</td>
												<td>8 Feb 2019</td>
												<td>$500</td>
											</tr>
											<tr>
												<td><a href="invoice-view.html">#INV-0003</a></td>
												<td>
													<h2>
														<a href="#">Cream Inc</a>
													</h2>
												</td>
												<td>Paypal</td>
												<td>23 Jan 2019</td>
												<td>$60</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="card-footer">
								<a href="payments.html">View all payments</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 d-flex">
						<div class="card card-table flex-fill">
							<div class="card-header">
								<h3 class="card-title mb-0">Clients</h3>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table custom-table mb-0">
										<thead>
											<tr>
												<th>Name</th>
												<th>Email</th>
												<th>Status</th>
												<th class="text-right">Action</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<h2 class="table-avatar">
														<a href="#" class="avatar"><img alt=""
															src="assets/img/profiles/avatar-19.jpg"></a> <a
															href="client-profile.html">Barry Cuda <span>CEO</span></a>
													</h2>
												</td>
												<td><a href="/cdn-cgi/l/email-protection"
													class="__cf_email__"
													data-cfemail="9af8fbe8e8e3f9effefbdaffe2fbf7eaf6ffb4f9f5f7">[email&#160;protected]</a></td>
												<td>
													<div class="dropdown action-label">
														<a
															class="btn btn-white btn-sm btn-rounded dropdown-toggle"
															href="#" data-toggle="dropdown" aria-expanded="false">
															<i class="fa fa-dot-circle-o text-success"></i> Active
														</a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-success"></i> Active</a> <a
																class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-danger"></i> Inactive</a>
														</div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<h2 class="table-avatar">
														<a href="#" class="avatar"><img alt=""
															src="assets/img/profiles/avatar-19.jpg"></a> <a
															href="client-profile.html">Tressa Wexler <span>Manager</span></a>
													</h2>
												</td>
												<td><a href="/cdn-cgi/l/email-protection"
													class="__cf_email__"
													data-cfemail="98eceafdebebf9effde0f4fdead8fde0f9f5e8f4fdb6fbf7f5">[email&#160;protected]</a></td>
												<td>
													<div class="dropdown action-label">
														<a
															class="btn btn-white btn-sm btn-rounded dropdown-toggle"
															href="#" data-toggle="dropdown" aria-expanded="false">
															<i class="fa fa-dot-circle-o text-danger"></i> Inactive
														</a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-success"></i> Active</a> <a
																class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-danger"></i> Inactive</a>
														</div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<h2 class="table-avatar">
														<a href="client-profile.html" class="avatar"><img
															alt="" src="assets/img/profiles/avatar-07.jpg"></a> <a
															href="client-profile.html">Ruby Bartlett <span>CEO</span></a>
													</h2>
												</td>
												<td><a href="/cdn-cgi/l/email-protection"
													class="__cf_email__"
													data-cfemail="324047504b505340465e57464672574a535f425e571c515d5f">[email&#160;protected]</a></td>
												<td>
													<div class="dropdown action-label">
														<a
															class="btn btn-white btn-sm btn-rounded dropdown-toggle"
															href="#" data-toggle="dropdown" aria-expanded="false">
															<i class="fa fa-dot-circle-o text-danger"></i> Inactive
														</a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-success"></i> Active</a> <a
																class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-danger"></i> Inactive</a>
														</div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<h2 class="table-avatar">
														<a href="client-profile.html" class="avatar"><img
															alt="" src="assets/img/profiles/avatar-06.jpg"></a> <a
															href="client-profile.html"> Misty Tison <span>CEO</span></a>
													</h2>
												</td>
												<td><a href="/cdn-cgi/l/email-protection"
													class="__cf_email__"
													data-cfemail="a9c4c0daddd0ddc0dac6c7e9ccd1c8c4d9c5cc87cac6c4">[email&#160;protected]</a></td>
												<td>
													<div class="dropdown action-label">
														<a
															class="btn btn-white btn-sm btn-rounded dropdown-toggle"
															href="#" data-toggle="dropdown" aria-expanded="false">
															<i class="fa fa-dot-circle-o text-success"></i> Active
														</a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-success"></i> Active</a> <a
																class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-danger"></i> Inactive</a>
														</div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<h2 class="table-avatar">
														<a href="client-profile.html" class="avatar"><img
															alt="" src="assets/img/profiles/avatar-14.jpg"></a> <a
															href="client-profile.html"> Daniel Deacon <span>CEO</span></a>
													</h2>
												</td>
												<td><a href="/cdn-cgi/l/email-protection"
													class="__cf_email__"
													data-cfemail="b5d1d4dbdcd0d9d1d0d4d6dadbf5d0cdd4d8c5d9d09bd6dad8">[email&#160;protected]</a></td>
												<td>
													<div class="dropdown action-label">
														<a
															class="btn btn-white btn-sm btn-rounded dropdown-toggle"
															href="#" data-toggle="dropdown" aria-expanded="false">
															<i class="fa fa-dot-circle-o text-danger"></i> Inactive
														</a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-success"></i> Active</a> <a
																class="dropdown-item" href="#"><i
																class="fa fa-dot-circle-o text-danger"></i> Inactive</a>
														</div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="card-footer">
								<a href="clients.html">View all clients</a>
							</div>
						</div>
					</div>
					<div class="col-md-6 d-flex">
						<div class="card card-table flex-fill">
							<div class="card-header">
								<h3 class="card-title mb-0">Recent Projects</h3>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table custom-table mb-0">
										<thead>
											<tr>
												<th>Project Name</th>
												<th>Progress</th>
												<th class="text-right">Action</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<h2>
														<a href="project-view.html">Office Management</a>
													</h2> <small class="block text-ellipsis"> <span>1</span>
														<span class="text-muted">open tasks, </span> <span>9</span>
														<span class="text-muted">tasks completed</span>
												</small>
												</td>
												<td>
													<div class="progress progress-xs progress-striped">
														<div class="progress-bar" role="progressbar"
															data-toggle="tooltip" title="65%" style="width: 65%"></div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<h2>
														<a href="project-view.html">Project Management</a>
													</h2> <small class="block text-ellipsis"> <span>2</span>
														<span class="text-muted">open tasks, </span> <span>5</span>
														<span class="text-muted">tasks completed</span>
												</small>
												</td>
												<td>
													<div class="progress progress-xs progress-striped">
														<div class="progress-bar" role="progressbar"
															data-toggle="tooltip" title="15%" style="width: 15%"></div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<h2>
														<a href="project-view.html">Video Calling App</a>
													</h2> <small class="block text-ellipsis"> <span>3</span>
														<span class="text-muted">open tasks, </span> <span>3</span>
														<span class="text-muted">tasks completed</span>
												</small>
												</td>
												<td>
													<div class="progress progress-xs progress-striped">
														<div class="progress-bar" role="progressbar"
															data-toggle="tooltip" title="49%" style="width: 49%"></div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<h2>
														<a href="project-view.html">Hospital Administration</a>
													</h2> <small class="block text-ellipsis"> <span>12</span>
														<span class="text-muted">open tasks, </span> <span>4</span>
														<span class="text-muted">tasks completed</span>
												</small>
												</td>
												<td>
													<div class="progress progress-xs progress-striped">
														<div class="progress-bar" role="progressbar"
															data-toggle="tooltip" title="88%" style="width: 88%"></div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<h2>
														<a href="project-view.html">Digital Marketplace</a>
													</h2> <small class="block text-ellipsis"> <span>7</span>
														<span class="text-muted">open tasks, </span> <span>14</span>
														<span class="text-muted">tasks completed</span>
												</small>
												</td>
												<td>
													<div class="progress progress-xs progress-striped">
														<div class="progress-bar" role="progressbar"
															data-toggle="tooltip" title="100%" style="width: 100%"></div>
													</div>
												</td>
												<td class="text-right">
													<div class="dropdown dropdown-action">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="material-icons">more_vert</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-pencil m-r-5"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0)"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="card-footer">
								<a href="projects.html">View all projects</a>
							</div>
						</div>
					</div>
				</div>-->
			</div>

		</div>

	</div>


	<script data-cfasync="false"
		src="../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
	<script src=".././resources/assets/js/jquery-3.5.1.min.js"></script>
	<script src=".././resources/assets/js/popper.min.js"></script>
	<script src=".././resources/assets/js/bootstrap.min.js"></script>
	<script src=".././resources/assets/js/jquery.slimscroll.min.js"></script>
	<script src=".././resources/assets/plugins/morris/morris.min.js"></script>
	<script src=".././resources/assets/plugins/raphael/raphael.min.js"></script>
	<script src=".././resources/assets/js/chart.js"></script>
	<script src=".././resources/assets/js/app.js"></script>
</body>
</html>