package pack.user.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Repository;

import pack.user.controller.UserBean;

@Repository
public class UserImpl extends SqlSessionDaoSupport implements UserDaoInter {

	@Autowired
	public UserImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	
	@Override
	public UserDto getLoginInfo(String user_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectLoginData", user_id);
	}


	@Override
	public int check_id(String user_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("check_id", user_id);
	}


	@Override
	public boolean join_user(UserBean bean) {
		int re=getSqlSession().insert("join_user", bean);
		if(re>0)
			return true;
		else
			return false;
	}


	@Override
	public List<MyPageDto> getUserInfo(String user_id) {
		List<MyPageDto> list = getSqlSession().selectList("selectUserInfo", user_id);
		return list;
	}


	@Override
	public List<MyPageDto> getUserBoard(String user_id) {
		List<MyPageDto> list = getSqlSession().selectList("selectUserBoard", user_id);
		return list;
	}
	@Override
	public List<UserDto> getUserList() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectUserAll");
	}


	@Override
	public List<MyPageDto> getUserData(String user_id) {
		List<MyPageDto> list = getSqlSession().selectList("getUserData", user_id);
		return list;
	}


	@Override
	public int userDataUpdate(UserBean bean) {
		
		int result = getSqlSession().update("userDataUpdate", bean);
		return result;
	}


	@Override
	public MyPageDto userBoardCount(String user_id) {
		MyPageDto dto = getSqlSession().selectOne("userBoardCount", user_id);
		return dto;
	}


}
