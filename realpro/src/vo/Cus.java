package vo;

public class Cus {
	private int c_num;
	private String id;
	private String pass;
	private String name;
	private String nikname;
	private String gender;
	private String birth;
	private String phonenum;
	private int point;
	private String grade;
	
	
	
	public Cus(String id, String pass, String name) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
	}

	public Cus(String id, int point) {
		super();
		this.id = id;
		this.point = point;
	}

	public Cus(String id, String pass, String name, String nikname, String gender, String birth, String phonenum) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.nikname = nikname;
		this.gender = gender;
		this.birth = birth;
		this.phonenum = phonenum;
	}

	public Cus(int c_num, String id, String pass, String name, String nikname, String gender, String birth,
			String phonenum) {
		super();
		this.c_num = c_num;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.nikname = nikname;
		this.gender = gender;
		this.birth = birth;
		this.phonenum = phonenum;
	}

	public Cus() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Cus(String id) {
		super();
		this.id = id;
	}
	
	public Cus(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNikname() {
		return nikname;
	}

	public void setNikname(String nikname) {
		this.nikname = nikname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int i) {
		this.point = i;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
	
	
	
	
	
	
}
