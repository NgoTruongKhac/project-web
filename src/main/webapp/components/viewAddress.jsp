<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty ListAddress}">
	<c:forEach var="address" items="${ListAddress}">
		<div class="row d-flex justify-content-center mt-1 mb-1">
			<button
				class="col-11 h-100 pt-2 pb-2 btn btn-outline-success d-flex justify-content-evenly align-items-center"
				style="font-size: 16px;" data-bs-toggle="modal"
				data-bs-target="#viewAddress${address.addressId}">${address.nameAddress}<c:if
					test="${address.isDefault}">
					<span>|</span>
					<span style="color: red; font-size: 15px;">mặc định</span>
				</c:if>
			</button>
		</div>

		<div class="modal fade mt-5" id="viewAddress${address.addressId}"
			tabindex="-1" aria-labelledby="exampleModalLabel${address.addressId}"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5"
							id="exampleModalLabel${address.addressId}">${address.nameAddress}</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>
							Tỉnh/Thành Phố:<span class="text-primary"
								style="font-size: 18px; margin-left: 10px;">${address.province}</span>
						<p>
						<p>
							Quận/Huyện: <span class="text-primary"
								style="font-size: 18px; margin-left: 10px;">${address.district}</span>
						</p>
						<p>
							Phường/Xã: <span class="text-primary"
								style="font-size: 18px; margin-left: 10px;">${address.ward}</span>
						</p>
						<p>
							Số Nhà/Tên Đường: <span class="text-primary"
								style="font-size: 18px; margin-left: 10px;">${address.street}</span>
						</p>
					</div>
					<div class="modal-footer">


						<button type="button" class="btn btn-primary">thay đổi</button>
						<button type="button" class="btn btn-primary">xoá</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>
