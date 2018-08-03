package vo;

public class Movie {
	private int m_num;
	private String mname;
	private String mdate;
	private String preshow;
	private int pri;
	private String type;
	
	public Movie() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Movie(int m_num, String mname, String mdate, String preshow, int pri, String type) {
		super();
		this.m_num = m_num;
		this.mname = mname;
		this.mdate = mdate;
		this.preshow = preshow;
		this.pri = pri;
		this.type = type;
	}

	public Movie(int m_num) {
		super();
		this.m_num = m_num;
	}

	public Movie(int m_num, String mname, String type) {
		super();
		this.m_num = m_num;
		this.mname = mname;
		this.type = type;
	}

	public Movie(int m_num, String mname) {
		super();
		this.m_num = m_num;
		this.mname = mname;
	}

	public Movie(String type) {
		super();
		this.type = type;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public String getPreshow() {
		return preshow;
	}

	public void setPreshow(String preshow) {
		this.preshow = preshow;
	}

	public int getPri() {
		return pri;
	}

	public void setPri(int pri) {
		this.pri = pri;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
