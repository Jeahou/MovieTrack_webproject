package service;

import vo.MovieImg;
import vo.Movie;
import vo.MovieJ;

import java.util.ArrayList;

import dao.MovieIndex;

public class MoviepopModel {
	private MovieIndex dao;
	
	public MoviepopModel() {
		dao = new MovieIndex();
	}
	
	public MovieJ show(Movie m, MovieImg i) {
		return (MovieJ)dao.excepClose(0, m, i);
	}
	
	public ArrayList<MovieJ> showMovie(Movie m, MovieImg i) {
		return (ArrayList<MovieJ>)dao.excepClose(1, m, i);
	}
	
	public ArrayList<MovieJ> showLatest(Movie m, MovieImg i) {
		return (ArrayList<MovieJ>)dao.excepClose(2, m, i);
	}
	public ArrayList<MovieJ> showRank(Movie m, MovieImg i) {
		return (ArrayList<MovieJ>)dao.excepClose(3, m, i);
	}
	
}
