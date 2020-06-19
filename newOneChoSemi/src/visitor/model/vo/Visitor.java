package visitor.model.vo;

import java.sql.Date;

public class Visitor {
	
	private String ip;
	private Date day;
	
	public Visitor() {
		super();
	}

	public Visitor(String ip, Date day) {
		super();
		this.ip = ip;
		this.day = day;
	}
	
	

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "Visitor [ip=" + ip + ", day=" + day + "]";
	}
	
	
	

}
