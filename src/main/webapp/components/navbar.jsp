<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container mt-3 mb-2">
	<div class=row>

		<div class="col-md-3 mb-2">
			<a href="index.jsp" class="text-decoration-none"><img
				src="images/laptopStore.png"
				style="width: 160px; "></a>
		</div>
		<div class="col-md-6">

			<form class="d-flex" role="search">
				<div class="w-75">
					<input class="form-control me-2 " type="search"
						placeholder="Tìm kiếm" aria-label="Search">
				</div>
				<button class="ms-2 btn btn-success " style="font-size: 13px;"
					type="submit">Tìm kiếm</button>
			</form>

		</div>
		<div class="col-md-3 d-flex justify-content-evenly">


			<c:if test="${not empty User}">

				<div class="dropdown">
					<button id="accountIcon" type="button"
						class="d-flex align-items-center btn btn-primary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false" style="height: 45px">
						<i class="bi bi-person"></i> ${User.firstName}
					</button>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="userInfo"><i
								class="bi bi-person-vcard me-2"></i>Xem thông tin</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="bi bi-cart2 me-2"></i>Xem giỏ hàng</a></li>
						<li><a class="dropdown-item" href="forgotPass.jsp"><i
								class="bi bi-pencil-square me-2"></i>Đổi mật khẩu</a></li>
						<li><button class="dropdown-item" onclick="confirmLogout()"><i
								class="bi bi-box-arrow-right me-2"></i>Đăng xuất</button></li>
					</ul>
				</div>

				<script type="text/javascript" src="javaScript/alertLogout.js">
					
				</script>
			</c:if>

			<c:if test="${empty User}">
				<button data-bs-toggle="modal" data-bs-target="#login" type="button"
					class="btn btn-primary d-flex align-items-center" style="height: 45px">
					<i class="bi bi-person"></i> Đăng Nhập
				</button>
				<%@include file="login.jsp"%>
			</c:if>

			<button data-bs-toggle="modal" data-bs-target="#register"
				type="button" type="button"
				class="btn btn-primary d-flex align-items-center" style="height: 45px">
				<i class="bi bi-person-plus me-1"></i> Đăng ký
			</button>
			<%@include file="register.jsp"%>

		</div>

	</div>


</div>

<nav class="navbar navbar-expand-lg bg-info">
	<div class="container-fluid">

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-text">Danh Mục</span> <span
				class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#"><i class="fa-solid fa-house"></i>
						Trang Chủ</a></li>
				<li class="nav-item"><a class="nav-link active" href="#"><i
						class="fa-solid fa-laptop"></i> Laptop Văn Phòng</a></li>
				<li class="nav-item"><a class="nav-link active" href="#"><i
						class="fa-solid fa-gamepad"></i> Laptop Gamming</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i
						class="bi bi-tags-fill"></i> Thương Hiệu </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Asus</a></li>
						<li><a class="dropdown-item" href="#">Lenovo</a></li>
						<li><a class="dropdown-item" href="#">Dell</a></li>
						<li><a class="dropdown-item" href="#">Acer</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i
						class='bx bxs-devices'></i> Phụ Kiện</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#"><i
								class='bx bx-mouse-alt'></i> chuột</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="fa-regular fa-keyboard"></i> bàn phím</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="fa-solid fa-headphones"></i> tai nghe</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="bi bi-usb-drive"></i> USB</a></li>
					</ul></li>

			</ul>

		</div>
	</div>
</nav>

<c:set var="type" value="${requestScope.type}" />
<c:set var="error" value="${requestScope.error}" />

<c:if test="${type == 'error'}">
	<c:if test="${error=='login'}">
		<script type="text/javascript">
			// Đảm bảo trang đã tải xong trước khi mở modal
			document.addEventListener("DOMContentLoaded", function() {
				new bootstrap.Modal(document.getElementById('login')).show();
			});
		</script>
	</c:if>
	<c:if test="${error=='register'}">
		<script type="text/javascript">
			// Đảm bảo trang đã tải xong trước khi mở modal
			document
					.addEventListener("DOMContentLoaded",
							function() {
								new bootstrap.Modal(document
										.getElementById('register')).show();
							});
		</script>
	</c:if>
</c:if>