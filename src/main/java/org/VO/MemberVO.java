package org.VO;

public class MemberVO {
	private int member_num;
	/**
	 * @return the member_num
	 */
	public int getMember_num() {
		return member_num;
	}

	/**
	 * @param member_num the member_num to set
	 */
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	private String id;
	private String passwd;
	private String nickname;
	private String server;
	private String passwdcheck;
	private int post_count;

	public String getPasswdcheck() {
		return passwdcheck;
	}

	public void setPasswdcheck(String passwdcheck) {
		this.passwdcheck = passwdcheck;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public int getPost_count() {
		return post_count;
	}

	public void setPost_count(int post_count) {
		this.post_count = post_count;
	}

	@Override
	public String toString() {
		return "회원 id : " + id + ", 닉네임 : " + nickname + ", 서버 : " + server + ", 작성한 게시글 : " + post_count;
	}

}
