package pack.location.model;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import pack.location.controller.LocationBean;

public interface LocationAnnoInter {
	@Insert("insert into addr values(#{addr_no}, #{user_id}, #{GPS_set_date}, #{GPS_latitude}, #{GPS_longitude}, #{user_addr})")
	public int insert_location(LocationBean bean);
	
	@Delete("delete from addr where user_id = #{user_id}")
	public int delete_location(String user_id);
	
	@Select("select count(*) from addr")
	public int location_currentNum();
}