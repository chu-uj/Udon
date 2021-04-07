package pack.blame.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BlameDao extends SqlSessionDaoSupport{
	public BlameDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	public List<BlameDto> getBlameList(){
		List<BlameDto> list = getSqlSession().selectList("selectBlameList");
		return list;
	}
	public BlameDto blameOne(String blame_id) {
		BlameDto dto = getSqlSession().selectOne("selectBlameone", blame_id);
		return dto;
	}
	
	public List<BlameDto> blamePageList(String page) { //페이지 처리 메소드
		List<BlameDto> list = getSqlSession().selectList("selectBlameList");
		List<BlameDto> pageList = new ArrayList<BlameDto>();
		int start = (Integer.parseInt(page)-1)*10;
		int end = Integer.parseInt(page)*10;
		if(end>list.size()) {
			end = list.size();
		}
			for(int i=0; i<end-start; i++) {
				pageList.add(i, list.get(start+i));
			}
		return pageList;
	}
	
	public List<BlameDto> search(BlameBean bean, String page){
		List<BlameDto> list = getSqlSession().selectList("searchBlame", bean);
		
		/*
		 * if(list.isEmpty()==false) { List<BlameDto> pageList = new
		 * ArrayList<BlameDto>(); int start = (Integer.parseInt(page)-1)*10; int end =
		 * Integer.parseInt(page)*10; if(end>list.size()) { end = list.size(); } for(int
		 * i=0; i<end-start; i++) { pageList.add(i, list.get(start+i)); }
		 * 
		 * return pageList; }else { return null; }
		 */
		return list;
		
	}
	
	public boolean insertBlame(BlameBean bean) {
		int result = getSqlSession().insert("insertBlame", bean);
		
		if(result!=0) {
			return true;
		}else {
			return false;
		}
	}
	public BlameDto getMaxBoard() {
		return getSqlSession().selectOne("getMaxBoard");
	}
	
	public boolean updateBlame(BlameBean bean) {
		int result = getSqlSession().update("updateBlame", bean);
		if(result!=0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean deleteBlame(String blame_id) {
		int result = getSqlSession().delete("deleteBlame", blame_id);
		
		if(result!=0) {
			return true;
		}else {
			return false;
		}
	}
}
