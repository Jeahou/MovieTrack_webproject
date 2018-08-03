package service;

import vo.Cus;
import dao.Login;


public class LoginModel {
	private Login dao;

	public LoginModel() {
		dao = new Login();
	}
	public Cus login(Cus sch) {
		return (Cus)dao.excepClose(0, sch);
	}
}
