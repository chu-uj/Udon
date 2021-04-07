package pack.product.reply.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProductReplyImpl extends SqlSessionDaoSupport implements ProductReplyInter{

	@Autowired
	public ProductReplyImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public List<ProductReplyDto> list(int product_id) {
		return getSqlSession().selectList("reply.listReply", product_id);
	}

	@Override
	public void insert(ProductReplyDto dto) {
		getSqlSession().insert("reply.insertReply", dto);
	}

	@Override
	public void update(ProductReplyDto dto) {
		
	}

	@Override
	public boolean delete(int reply_no) {
		try {
			int result = getSqlSession().delete("reply.deleteOneReply", reply_no);
			if(result > 0) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println("delete err"+e);
			return false;
		}
	}

	@Override
	public int currentNum() {
		//insert시 번호 자동 증가를 위해 현재 레코드 중 가장 큰 번호 얻기.
		if(getSqlSession().selectOne("currentReplyNum") == null) {
			return 0;
		}else {
			return getSqlSession().selectOne("currentReplyNum");
		}
	}
}
