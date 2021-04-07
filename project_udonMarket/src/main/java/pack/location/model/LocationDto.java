package pack.location.model;

public class LocationDto {
	private String addr_no;
	private String user_id;
	private String GPS_set_date;
	private String GPS_latitude;
	private String GPS_longitude;
	private String user_addr;
	
	public String getAddr_no() {
		return addr_no;
	}
	public void setAddr_no(String addr_no) {
		this.addr_no = addr_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getGPS_set_date() {
		return GPS_set_date;
	}
	public void setGPS_set_date(String gPS_set_date) {
		GPS_set_date = gPS_set_date;
	}
	public String getGPS_latitude() {
		return GPS_latitude;
	}
	public void setGPS_latitude(String gPS_latitude) {
		GPS_latitude = gPS_latitude;
	}
	public String getGPS_longitude() {
		return GPS_longitude;
	}
	public void setGPS_longitude(String gPS_longitude) {
		GPS_longitude = gPS_longitude;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
}
