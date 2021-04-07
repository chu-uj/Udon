package pack.blame.model;

public class BlameDto {
	private String blame_id, product_id,user_id,declaration_detail,declaration_reason,blame_date, currentBoard;

	public String getCurrentBoard() {
		return currentBoard;
	}

	public void setCurrentBoard(String currentBoard) {
		this.currentBoard = currentBoard;
	}

	public String getBlame_id() {
		return blame_id;
	}

	public void setBlame_id(String blame_id) {
		this.blame_id = blame_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getDeclaration_detail() {
		return declaration_detail;
	}

	public void setDeclaration_detail(String declaration_detail) {
		this.declaration_detail = declaration_detail;
	}

	public String getDeclaration_reason() {
		return declaration_reason;
	}

	public void setDeclaration_reason(String declaration_reason) {
		this.declaration_reason = declaration_reason;
	}

	public String getBlame_date() {
		return blame_date;
	}

	public void setBlame_date(String blame_date) {
		this.blame_date = blame_date;
	}
}
