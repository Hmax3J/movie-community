package com.my.movie.service;

import com.my.movie.domain.ReviewDto;

public interface ReviewService {

	ReviewDto getReviewDtoByMovieId(int movieId);
}
