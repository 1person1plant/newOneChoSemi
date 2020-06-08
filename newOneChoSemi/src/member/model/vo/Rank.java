package member.model.vo;

import java.io.Serializable;

public class Rank implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8592860416098713805L;
	private String rankNo; 			// 등급 번호
	private String rankName; 		// 등급 이름
	private int rankPonintRat;	// 등급 적립율
	private int rankPonintCap;	// 등급별 포인트 사용한도
	private int rankPonintMIn;	// 등급 최소 구매 금액
	private int rankPonintMax;	// 등급 최대 구매 금액
	public Rank() {
	}
	public Rank(String rankNo, String rankName, int rankPonintRat, int rankPonintCap, int rankPonintMIn,
			int rankPonintMax) {
		this.rankNo = rankNo;
		this.rankName = rankName;
		this.rankPonintRat = rankPonintRat;
		this.rankPonintCap = rankPonintCap;
		this.rankPonintMIn = rankPonintMIn;
		this.rankPonintMax = rankPonintMax;
	}
	public String getRankNo() {
		return rankNo;
	}
	public void setRankNo(String rankNo) {
		this.rankNo = rankNo;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public int getRankPonintRat() {
		return rankPonintRat;
	}
	public void setRankPonintRat(int rankPonintRat) {
		this.rankPonintRat = rankPonintRat;
	}
	public int getRankPonintCap() {
		return rankPonintCap;
	}
	public void setRankPonintCap(int rankPonintCap) {
		this.rankPonintCap = rankPonintCap;
	}
	public int getRankPonintMIn() {
		return rankPonintMIn;
	}
	public void setRankPonintMIn(int rankPonintMIn) {
		this.rankPonintMIn = rankPonintMIn;
	}
	public int getRankPonintMax() {
		return rankPonintMax;
	}
	public void setRankPonintMax(int rankPonintMax) {
		this.rankPonintMax = rankPonintMax;
	}
	@Override
	public String toString() {
		return "Rank [rankNo=" + rankNo + ", rankName=" + rankName + ", rankPonintRat=" + rankPonintRat
				+ ", rankPonintCap=" + rankPonintCap + ", rankPonintMIn=" + rankPonintMIn + ", rankPonintMax="
				+ rankPonintMax + "]";
	}
	
}
