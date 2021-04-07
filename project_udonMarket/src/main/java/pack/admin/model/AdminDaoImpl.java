package pack.admin.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.blame.model.BlameBean;
import pack.blame.model.BlameDto;
import pack.product.model.ProductDto;

@Repository
public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDaoInter{
	
	@Autowired
	public AdminDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Override
	public AdminDto getLoginInfo(String user_id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectAdminLoginData", user_id);
	}
	
	@Override
	public boolean deleteUser(String user_id) {
		int re = getSqlSession().delete("deleteUser", user_id);
		if(re>0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public boolean deleteProduct(String product_id) {
		//System.out.println(product_id);
		int re = getSqlSession().delete("deleteProduct", product_id);//�����ϸ� 1�� �ȴ�.
		if(re>0) {
			return true;
		}else {
			return false;
		}
	}
	/*
	@Override
	public boolean deleteBlame(String blame_id) {
		int re = getSqlSession().delete("deleteBlame", blame_id);	//�����ϸ� 1�� �ȴ�.
		if(re>0) {
			return true;
		}else {
			return false;
		}
	}
	*/
	
	//warnlist
	@Override
	public List<ProductDto> getWarnList() {
		
	return getSqlSession().selectList("selectWarnAll");
	}

	//banlist
	@Override
	public List<BanDto> getBanList() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectBanAll");
	}
	
	public BanDto getMaxBoard() {
		return getSqlSession().selectOne("getMaxbanId");
	}
	
	public boolean insertBan(BanBean bean) {
		int result = getSqlSession().insert("insertBan", bean);
		
		if(result!=0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteBan(String ban_id) {
		int re = getSqlSession().delete("deleteBan", ban_id);	//�����ϸ� 1�� �ȴ�.
		if(re>0) {
			return true;
		}else {
			return false;
		}
	}
	

}
