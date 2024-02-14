package com.my.movie.dao;

import java.util.List;

import com.my.movie.domain.Review;
import com.my.movie.domain.request.CreateReviewRequest;

public interface ReviewDao {
	
	void insertReview(CreateReviewRequest req);
	
	List<Review> selectReviewByMovieId(int movieId, int startIndex, int rowCount);

	void deleteReview(int reviewId);
	
}
