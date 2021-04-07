package pack.product.reply.model;

import java.util.List;

public interface ProductReplyInter {
	// 댓글 목록
    public List<ProductReplyDto> list(int product_id);
    // 댓글 입력
    public void insert(ProductReplyDto dto);
    // 댓글 수정
    public void update(ProductReplyDto dto);
    // 댓글 삭제
    public boolean delete(int reply_no);
    // 댓글 번호 증가용
	public int currentNum();
}
