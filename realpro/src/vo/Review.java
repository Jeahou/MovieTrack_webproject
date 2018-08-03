package vo;

public class Review {
	private String name;
	private int c_num;
	private int m_num;
	private int r_num;
	private String title;
	private String content;
	private String date;
	private int star;
	
	public Review(String name, int c_num, int m_num, int r_num, String title, String content, String date, int star) {
		super();
		this.name = name;
		this.c_num = c_num;
		this.m_num = m_num;
		this.r_num = r_num;
		this.title = title;
		this.content = content;
		this.date = date;
		this.star = star;
	}

	public Review(String name, int m_num, String title, String content, int star) {
		super();
		this.name = name;
		this.m_num = m_num;
		this.title = title;
		this.content = content;
		this.star = star;
	}

	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(int m_num) {
		super();
		this.m_num = m_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}
	
	
	
	
	
}
