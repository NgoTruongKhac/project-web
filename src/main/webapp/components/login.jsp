<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="modal fade mt-5" id="login" tabindex="-1"
	aria-labelledby="loginModalLabel" aria-hidden="true">
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
					<div>
						<form action="login" method="post">
							
							<div class="d-flex justify-content-center mb-2"
								style="margin-top: -10px">
								<h3>Đăng Nhập</h3>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Email/Số điện thoại </label> <input
									type="text" class="form-control" name="emailOrPhone"
									required="required" size="32"
									value="${param.emailOrPhone != null ? param.emailOrPhone : ''}" />
							</div>
							<div class="mb-3">
								<label class="form-label">Mật khẩu</label> <input
									type="password" class="form-control" name="pass"
									required="required" />
							</div>

							<div class="mt-4 d-flex flex-column">
								<button type="submit" class="btn btn-primary">Đăng Nhập
								</button>
								<span class="mt-2 align-self-center">bạn chưa có tài
									khoản ?<a href="#" data-bs-toggle="modal" data-bs-target="#register" type="button">Đăng ký</a>
								</span> <span class="mt-2 align-self-center">bạn quên mật khẩu ?<a
									href="forgotPass.jsp">quên mật khẩu</a>
								</span>
							</div>
							<div class="mt-3 d-flex flex-column">
								<a href="loginWithSMS.jsp" class="btn btn-primary"> <i
									class="bi bi-telephone-fill"></i> đăng nhập với SMS
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




