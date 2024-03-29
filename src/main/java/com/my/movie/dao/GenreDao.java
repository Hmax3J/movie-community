package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Genre;
import com.my.movie.domain.GenreDto;
import com.my.movie.domain.Movie;
import com.my.movie.domain.User;

public interface GenreDao {
	List<String> searchGenre(int movieNum);
	List<Movie> searchMovieByGenre(String genreName);
	List<Genre> selectAll();
	List<GenreDto> selectGenre();
	List<String> selectCheckGenre();
	void insertGenre(String genreName);
	void addUserGenre(User user, List<String> genres);
	void addMovieGenre(Movie movie, List<String> genres);
}