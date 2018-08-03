package service;

import java.util.ArrayList;

import dao.MovieReview;
import vo.Review;

public class ReviewModel {
	private MovieReview dao;
	
	public ReviewModel() {
		dao = new MovieReview();
	}
	public ArrayList<Review> showReview(Review r) {
		return (ArrayList<Review>)dao.excepClose(0, r);
	}
	
	public void insertReview(Review r) {
		dao.excepClose(1, r);
	}
}
