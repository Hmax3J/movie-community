package com.my.movie.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.movie.dao.map.ReviewMap;
import com.my.movie.domain.Review;
import com.my.movie.domain.request.CreateReviewRequest;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private ReviewMap reviewMap;

	@Override
	public void insertReview(CreateReviewRequest req) {
		reviewMap.insertReview(req);
	}

	@Override
	public List<Review> selectReviewByMovieId(int movieId, int startIndex, int rowCount) {
		return toAnonymousUserId(reviewMap.selectReviewByMovieId(movieId, startIndex, rowCount));
	}
	
	private List<Review> toAnonymousUserId(List<Review> reviews) {
		for (Review review : reviews) {
			String userId = review.getUserId();
			StringBuilder builder = new StringBuilder();
			builder.append(userId.subSequence(0, 3));

			for (int i = 0; i < userId.length() - 3; i++) {
				builder.append("*");
			}
			review.setUserId(builder.toString());
		}
		
		return reviews;
	}

	@Override
	public void deleteReview(int reviewId) {
		reviewMap.deleteReview(reviewId);
	}
}
