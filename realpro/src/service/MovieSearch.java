package service;
import vo.MovieJ;

import java.util.ArrayList;

import dao.Search;

public class MovieSearch {
	private Search dao;
	
	public MovieSearch() {
		dao = new Search();
	}
	
	public ArrayList<MovieJ> showSearch(String s){
		return (ArrayList<MovieJ>)dao.excepClose(0, s);
	}
}
