<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>verification</title>
<%@ include file="components/allCss.jsp"%>
</head>
<body>
	<div class="d-flex justify-content-center mt-3">
		<div class="card bg-success-subtle"
			style="width: 250px; height: 310px; padding: 30px">
			<form action="verifyOTP" method="post">
				<div class="text-body-tertiary mb-2 text-center">
					<i> mã OTP đã gửi về SMS của bạn</i>
				</div>
				<div class="d-flex justify-content-center text-center">
					<div id="countdown" style="font-size: 25px; color: red"></div>
				</div>
				<div class="mb-3 text-center">
					<label class="form-label" style="font-size: 20px">Nhập mã
						OTP</label> <input type="text" class="form-control"
						name="verificationSMS" required="required" />
				</div>
				<div class="mb-3 d-flex justify-content-center">
					<button type="submit" class="btn btn-primary">Xác nhận</button>
				</div>
	             <script type="text/javascript" src="javaScript/timeoutVerify.js"></script>
			</form>
		</div>
	</div>

	<jsp:include page="components/alert.jsp"></jsp:include>

</body>
</html>