package entity;

public class Address {
	
	private int addressId;
	private String nameAddress;
	private String province;
	private String district;
	private String ward;
	private String street;
	private boolean isDefault;
	public Address(String nameAddress,String province, String district, String ward, String street, boolean isDefault) {
		this.nameAddress=nameAddress;
		this.province = province;
		this.district = district;
		this.ward = ward;
		this.street = street;
		this.isDefault=isDefault;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getWard() {
		return ward;
	}
	public void setWard(String ward) {
		this.ward = ward;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getNameAddress() {
		return nameAddress;
	}
	public void setNameAddress(String nameAddress) {
		this.nameAddress = nameAddress;
	}
	public boolean getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(boolean isDefault) {
		this.isDefault = isDefault;
	}
	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", nameAddress=" + nameAddress + ", province=" + province
				+ ", district=" + district + ", ward=" + ward + ", street=" + street + ", isDefault=" + isDefault + "]";
	}
	
	
	

}
