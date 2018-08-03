package vo;

public class MovieJ {
	private int num;
	private String name;
	private String avi;
	private String pop;
	private String date;
	private String type;
	private String dir;
	private String act1;
	private String act2;
	private String act3;
	private String grd;
	private String rt;
	private int pri;
	
	
	public MovieJ() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MovieJ(int num, String name, String pop) {
		super();
		this.num = num;
		this.name = name;
		this.pop = pop;
	}

	public MovieJ(String name, String pop) {
		super();
		this.name = name;
		this.pop = pop;
	}
	
	
	public MovieJ(String name, String pop, String date, String type, String dir, String act1, String act2, String act3,
			String grd, int pri,  String rt) {
		super();
		this.name = name;
		this.pop = pop;
		this.date = date;
		this.type = type;
		this.dir = dir;
		this.act1 = act1;
		this.act2 = act2;
		this.act3 = act3;
		this.grd = grd;
		this.rt = rt;
		this.pri = pri;
	}
	
	
	public MovieJ(String name, String avi, String pop, String date, String type, String dir, String act1, String act2,
			String act3, String grd,  int pri, String rt) {
		super();
		this.name = name;
		this.avi = avi;
		this.pop = pop;
		this.date = date;
		this.type = type;
		this.dir = dir;
		this.act1 = act1;
		this.act2 = act2;
		this.act3 = act3;
		this.grd = grd;
		this.rt = rt;
		this.pri = pri;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPop() {
		return pop;
	}
	public void setPop(String pop) {
		this.pop = pop;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public int getPri() {
		return pri;
	}
	public void setPri(int pri) {
		this.pri = pri;
	}
	public String getRt() {
		return rt;
	}
	public void setRt(String rt) {
		this.rt = rt;
	}
	public String getAvi() {
		return avi;
	}
	public void setAvi(String avi) {
		this.avi = avi;
	}
	
	
	
	
}
