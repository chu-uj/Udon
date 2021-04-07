package pack.wish.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.wish.controller.WishBean;

@Repository
public class WishDaoImpl extends SqlSessionDaoSupport implements WishDaoInter{
	
	@Autowired
	public WishDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public ArrayList<String> select_all_wishlist(String user_id) {
		return (ArrayList)getSqlSession().selectList("select_all_wishlist", user_id);
	}

	@Override
	public int wishlist_totalCnt(String user_id) {
		return getSqlSession().selectOne("select_totalCnt_wishlist", user_id);
	}

	@Override
	public ArrayList<WishDto> select_userProduct_wishlist(WishBean bean) {
		return (ArrayList)getSqlSession().selectList("select_userProduct_wishlist", bean);
	}

	@Override
	public boolean delete_wishlist(WishBean bean) {
		int result = 0;
		try {
			result = getSqlSession().delete("delete_wishlist", bean);
			if(result > 0) {
				return true;
			}
			return false;
		} catch (Exception e) {
			System.out.println("delete_wishlist err "+e);
			return false;
		}
	}

	@Override
	public boolean insert_wishlist(WishBean bean) {
		int result = 0;
		try {
			result = getSqlSession().insert("insert_wishlist", bean);
			if(result > 0) {
				return true;
			}
			return false;
		} catch (Exception e) {
			System.out.println("insert_wishlist err "+e);
			return false;
		}
	}
	
	@Override
	public int select_currentNum_wishlist() {
		//insert시 번호 자동 증가를 위해 현재 레코드 중 가장 큰 번호 얻기.
		if(getSqlSession().selectOne("select_currentNum_wishlist") == null) {
			return 0;
		}else {
			return getSqlSession().selectOne("select_currentNum_wishlist");
		}
	}
}
