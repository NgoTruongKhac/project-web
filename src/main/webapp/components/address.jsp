<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal fade mt-3" id="address" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Thêm Địa
					Chỉ</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="addAddress" method="post">
				<div class="modal-body">


					<div>

						<div class="mb-3">
							<label for="" class="form-label">Tên địa chỉ</label> <input
								type="text" class="form-control" name="nameAddress"
								required="required">
						</div>
						<select class="form-select form-select-sm mb-4" id="city"
							name="province">
							<option value="" selected>Chọn tỉnh thành</option>
						</select> <select class="form-select form-select-sm mb-4" id="district"
							name="district">
							<option value="" selected>Chọn quận huyện</option>
						</select> <select class="form-select form-select-sm mb-4" id="ward"
							name="ward">
							<option value="" selected>Chọn phường xã</option>
						</select>
						<div class="mb-4">
							<label class="form-label" for="">Số nhà/Tên đường</label> <input
								class="form-control" type="text" name="street"
								required="required">
						</div>
						<div class="mb-2">
							<label class="form-check-label" for="">Đặt làm địa chỉ
								mặc định</label> <input class="form-check-input" type="checkbox" name="isDefault">
						</div>

					</div>


				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Thêm</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
	var citis = document.getElementById("city");
var districts = document.getElementById("district");
var wards = document.getElementById("ward");
var Parameter = {
  url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json", 
  method: "GET", 
  responseType: "application/json", 
};
var promise = axios(Parameter);
promise.then(function (result) {
  renderCity(result.data);
});

function renderCity(data) {
  for (const x of data) {
	  citis.options[citis.options.length] = new Option(x.Name, x.Name);
  }
  citis.onchange = function () {
    district.length = 1;
    ward.length = 1;
    if(this.value != ""){
      const result = data.filter(n => n.Name === this.value);

      for (const k of result[0].Districts) {
    	  district.options[district.options.length] = new Option(k.Name, k.Name);
      }
    }
  };
  district.onchange = function () {
    ward.length = 1;
    const dataCity = data.filter((n) => n.Name === citis.value);
    if (this.value != "") {
      const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards;

      for (const w of dataWards) {
    	  wards.options[wards.options.length] = new Option(w.Name, w.Name);
      }
    }
  };
}
	</script>