package service;

import dao.Point;
import vo.Cus;

public class PointModel {
    private Point dao;

    public PointModel(){ 
    	dao = new Point(); 
    	}

   public Cus UpdatePoint(Cus point){ 
	   return (Cus)dao.excepClose(0, point); 
	   }

}
