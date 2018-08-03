package vo;

public class MovieImg {
	private int m_num;
	private int mi_num;
	private String pop;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	
	public MovieImg(int m_num, int mi_num, String pop, String img1, String img2, String img3, String img4,
			String img5) {
		super();
		this.m_num = m_num;
		this.mi_num = mi_num;
		this.pop = pop;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.img5 = img5;
	}
	
	

	public MovieImg(int m_num) {
		super();
		this.m_num = m_num;
	}



	public MovieImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getMi_num() {
		return mi_num;
	}

	public void setMi_num(int mi_num) {
		this.mi_num = mi_num;
	}

	public String getPop() {
		return pop;
	}

	public void setPop(String pop) {
		this.pop = pop;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public String getImg5() {
		return img5;
	}

	public void setImg5(String img5) {
		this.img5 = img5;
	}
	
	
	
}
