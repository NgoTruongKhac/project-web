<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 


<div class="modal fade mt-5" id="changeEmail" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Đổi email</h1>

				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="changeEmail" method="post">
				<div class="modal-body">
					<div class="d-flex justify-content-center">
						<label class="me-2" for="">Email</label> <input type="email"
							size="30" name="newEmail" required="required">
					</div>
				</div>
				<div class="modal-footer">
					<button  type="submit" class="btn btn-primary">Thay
						đổi</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal fade mt-5" id="changePhone" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Đổi số điện
					thoại</h1>

				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="d-flex justify-content-center">
					<label class="me-2" for="">Số điện thoại</label> <input type="text"
						size="30">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Thay đổi</button>
			</div>
		</div>
	</div>
</div>