<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Laptop Store</title>

<%@ include file="components/allCss.jsp"%>


</head>
<body>

	<jsp:include page="components/navbar.jsp"></jsp:include>
	
	 <div class="d-flex justify-content-center">
      <div style="border: solid; padding: 20px; border-radius: 10px; margin-top: 120px" class="shadow-lg bg-warning-subtle">
        <div class="d-flex justify-content-center mb-3" style="font-size: 22px">
          <b>Đăng Nhập với SMS</b>
        </div>
        <div class="mb-3">
          <label class="form-label">Số điện thoại</label>
          <input
            type="text"
            class="form-control"
            name="phoneNumber"
            required="required"
          />
        </div>
        <div class="mb-3 d-flex justify-content-center">
          <button class="btn btn-primary" type="submit">Gửi qua SMS</button>
        </div>
      </div>
    </div>
	
	
	
	
	
	

     <jsp:include page="components/alert.jsp"></jsp:include>
     

</body>

</html>