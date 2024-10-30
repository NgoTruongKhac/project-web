<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User Information</title>
<link rel="stylesheet" href="components/avatar.css">

<%@ include file="components/allCss.jsp"%>


</head>
<body>

	<jsp:include page="components/navbar.jsp"></jsp:include>


	<div class="container rounded bg-white mt-1 mb-1">
		<div class="row">

			<div class="col-md-3 border-right me-1"
				style="border-radius: 5px; box-shadow: 0px 1px 1px 1px black;">
				<div
					class="d-flex flex-column align-items-center text-center p-3 py-5">
					<div class="avatar-picker">
						<img class="rounded-circle mt-5" width="180px"
							src="${User.avatar == null ? 'images/blank_avatar.png' : User.avatar}"
							alt="Avatar" class="avatar" id="selected-avatar">
					</div>
					<%@ include file="components/selectAvatar.jsp"%>



					<span class="font-weight-bold mt-2" style="font-size: 20px">${User.lastName}
						${User.firstName}</span>
				</div>
			</div>
			<div class="col-md-5 border-right"
				style="padding-left: 60px; padding-right: 60px; width: 540px; border-radius: 5px; box-shadow: 0px 1px 1px 1px black;">
				<div class="p-3 py-5">

					<div class="d-flex justify-content-center align-items-center mb-3">
						<h3 class="text-right">
							<i class="bi bi-person-vcard-fill me-2"></i>Thông Tin Tài Khoản
						</h3>
					</div>
					<form action="updateUserInfo" method="post">
						<input type="hidden" name="avatarSrc" id="avatarSrc"
							value="${User.avatar != null ? User.avatar : 'images/blank_avatar.png'}">
						<div class="row mt-2">
							<div class="col-md-6">
								<label class="labels">Tên</label><input type="text"
									class="form-control" name="firstName" value="${User.firstName}">
							</div>
							<div class="col-md-6">
								<label class="labels">Họ</label><input type="text"
									class="form-control" name="lastName" value="${User.lastName}">
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-md-14 mt-2">
								<label class="labels">Email</label>

								<div class="d-flex flex-row" style="height: 35px;">
									<input type="text" class="form-control" name="email"
										value="${User.email}" readonly="readonly"> <a
										data-bs-toggle="modal" data-bs-target="#changeEmail"
										class="d-flex align-items-center btn btn-primary btn-sm"
										style="min-width: 75px; margin-left: 5px;">Thay đổi</a>
								</div>

							</div>

							<div class="col-md-12 mt-2">
								<label class="labels">Số điện thoại</label>
								<div class="d-flex flex-row" style="height: 35px;">
									<input type="text" class="form-control" name="phoneNumber"
										value="${User.phoneNumber}" readonly="readonly"> <a
										data-bs-toggle="modal" data-bs-target="#changePhone"
										class="d-flex align-items-center btn btn-primary btn-sm"
										style="min-width: 75px; margin-left: 5px;">Thay đổi</a>
								</div>

							</div>
							<div class="col-md-12 form-check mt-2">
								<label class="labels">Giới tính</label>
								<div class="row mt-2">
									<div class="col form-check">
										<input class="form-check-input" type="radio" name="sex"
											id="male" value="Nam"
											${User.sex != null and User.sex == 'Nam' ? 'checked' : ''}>
										<label class="form-check-label" for="male"> Nam </label>
									</div>
									<div class="col form-check">
										<input class="form-check-input" type="radio" name="sex"
											id="female" value="Nữ"
											${User.sex != null and User.sex == 'Nữ' ? 'checked' : ''}>
										<label class="form-check-label" for="female"> Nữ </label>
									</div>
								</div>

							</div>
							<div class="col-md-12 mt-2">
								<label class="labels">Ngày sinh</label><input type="date"
									class="form-control" name="birthday"
									value="<fmt:formatDate value='${User.birthday}' pattern='yyyy-MM-dd'/>"
									required="required">
							</div>

						</div>

						<div class="mt-3 text-center">
							<button class="btn btn-primary profile-button" type="submit">Lưu
								thông tin</button>
						</div>

					</form>



				</div>
			</div>
			<div class="col-md-3 ms-1"
				style="width:; border-radius: 5px; box-shadow: 0px 1px 1px 1px black;">
				<div class="p-3 py-5">
					<div class="d-flex justify-content-between">
						<h4>
							<i class="bi bi-geo-alt-fill me-1"></i>Địa Chỉ
						</h4>
						<a data-bs-toggle="modal" data-bs-target="#address"
							class="btn btn-primary" style="font-size: 14px;">+Thêm địa
							chỉ</a>

					</div>
					<%@ include file="components/address.jsp"%>
					<hr>
					<%@ include file="components/viewAddress.jsp"%>

				</div>
			</div>
		</div>
	</div>
	<%@ include file="components/changeEmailOrPhone.jsp"%>
	<jsp:include page="components/alert.jsp"></jsp:include>

</body>

</html>