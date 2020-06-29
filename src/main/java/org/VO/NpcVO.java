package org.VO;

public class NpcVO {
	private String NPC_name;
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	private String writer;
	public String getNPC_name() {
		return NPC_name;
	}
	public void setNPC_name(String nPC_name) {
		NPC_name = nPC_name;
	}
	public String getNomal() {
		return nomal;
	}
	public void setNomal(String nomal) {
		this.nomal = nomal;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getFriendship() {
		return friendship;
	}
	public void setFriendship(String friendship) {
		this.friendship = friendship;
	}
	public String getTurst() {
		return turst;
	}
	public void setTurst(String turst) {
		this.turst = turst;
	}
	public String getNPC_region() {
		return NPC_region;
	}
	public void setNPC_region(String nPC_region) {
		NPC_region = nPC_region;
	}
	private String nomal;
	private String interest;
	private String friendship;
	private String turst;
	private String NPC_region;
	

}
