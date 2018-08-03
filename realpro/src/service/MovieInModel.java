package service;

import dao.MovieIn;
import vo.Movie;
import vo.MovieJ;
import vo.Review;
import vo.MovieImg;

public class MovieInModel {
	private MovieIn dao;
	
	public MovieInModel() {
		dao = new MovieIn();
	}
	
	public MovieJ show(Movie m) {
		return (MovieJ)dao.excepClose(0, m);
	}
	
	public MovieImg showImg(Movie m) {
		return (MovieImg)dao.excepClose(1, m);
	}
	
	public Review showStar(Movie m) {
		return (Review)dao.excepClose(2, m);
	}
}
