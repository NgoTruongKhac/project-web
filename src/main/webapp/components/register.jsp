<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="modal fade mt-5" id="register" tabindex="-1"
	aria-labelledby="registerModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="max-width: fit-content; margin: auto">
		<div class="modal-content">
			<div class="modal-header"
				style="background-color: transparent; border: none; box-shadow: none;">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<!-- Thêm phần này -->
			<div class="modal-body">
			<div class="d-flex justify-content-center">
				<div style="width: 340px">
					<form action="register" method="post">
						<div class="d-flex justify-content-center mb-3"
							style="margin-top: -15px">
							<h3>Đăng Ký</h3>
						</div>
						<c:if test="${not empty param.error}">
								<p class="alert alert-danger text-center" style="font-size: 12px"><i class="bi bi-x-circle-fill me-2"></i>${param.error}</p>
							</c:if>
						<div class="row mb-2">
							<div class="col-5">
								<label class="form-label">Tên</label> <input type="text"
									class="form-control" name="firstName" required="required"
									value="${param.firstName != null ? param.firstName : ''}" />
							</div>
							<div class="col-7">
								<label class="form-label">Họ</label> <input type="text"
									class="form-control" name="lastName" required="required"
									value="${param.lastName != null ? param.lastName : ''}" />
							</div>
						</div>
						<div class="mb-2">
							<label class="form-label">Email/Số điện thoại</label> <input
								type="text" class="form-control" name="emailOrPhone"
								required="required"
								value="${param.emailOrPhone != null ? param.emailOrPhone : ''}" />
						</div>
						<div class="mb-2">
							<label class="form-label">Mật khẩu</label> <input type="password"
								class="form-control" name="pass" required="required" />
						</div>
						<div class="mb-4">
							<label class="form-label">Nhập lại mật khẩu </label> <input
								type="password" class="form-control" name="confirmPass"
								required="required" />
						</div>
						<div class="mb-2 d-flex flex-column justify-content-between">
							<button type="submit" class="btn btn-primary mb-2">Đăng
								ký</button>
							<span class="align-self-center">bạn
								đã có tài khoản ?<a href="#" data-bs-toggle="modal" data-bs-target="#login" type="button">Đăng
									nhập</a>
							</span>
						</div>
					</form>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>



