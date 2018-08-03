package vo;

public class MovieDetail {
	private int m_num;
	private int md_num;
	private String dir;
	private String act1;
	private String act2;
	private String act3;
	private String grd;
	private String rt;
	
	public MovieDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MovieDetail(int m_num, int md_num, String dir, String act1, String act2, String act3, String grd,
			String rt) {
		super();
		this.m_num = m_num;
		this.md_num = md_num;
		this.dir = dir;
		this.act1 = act1;
		this.act2 = act2;
		this.act3 = act3;
		this.grd = grd;
		this.rt = rt;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getMd_num() {
		return md_num;
	}

	public void setMd_num(int md_num) {
		this.md_num = md_num;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getAct1() {
		return act1;
	}

	public void setAct1(String act1) {
		this.act1 = act1;
	}

	public String getAct2() {
		return act2;
	}

	public void setAct2(String act2) {
		this.act2 = act2;
	}

	public String getAct3() {
		return act3;
	}

	public void setAct3(String act3) {
		this.act3 = act3;
	}

	public String getGrd() {
		return grd;
	}

	public void setGrd(String grd) {
		this.grd = grd;
	}

	public String getRt() {
		return rt;
	}

	public void setRt(String rt) {
		this.rt = rt;
	}
	
	
	
}
