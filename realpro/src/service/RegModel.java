package service;

import vo.Cus;
import dao.Reg;

public class RegModel {
	private Reg dao;
	
	public RegModel() {
		dao = new Reg();
	}
	public boolean checkid(Cus ins) {
		return (boolean)dao.excepClose(0, ins);
	}
	
	public Cus reg(Cus ins) {
		return (Cus)dao.excepClose(1, ins);
	}
}
