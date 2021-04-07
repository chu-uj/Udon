package pack.user.model;

import java.util.List;

import pack.user.controller.UserBean;

public interface UserDaoInter {
	int check_id(String user_id);//중복아이디 검사
	boolean join_user(UserBean bean); // 가입하기 
	UserDto getLoginInfo(String user_id); //조인포인트 대상
	List<MyPageDto> getUserInfo(String user_id);//유저가 등록한 상품정보 불러오기
	List<MyPageDto> getUserBoard(String user_id);//유저가 등록한 게시물 불러오기
	List<MyPageDto> getUserData(String user_id);//user 정보 불러오기
	List<UserDto> getUserList(); //전체 유저리스트 조회
	int userDataUpdate(UserBean bean);//유저정보 업데이트
	MyPageDto userBoardCount(String user_id);
}
