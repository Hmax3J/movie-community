package com.my.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.movie.dao.UserDao;
import com.my.movie.domain.User;
import com.my.movie.domain.UserDto;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public User loginValidate(User user) {
		return userDao.selectLoginUser(user);
	}

	@Override
	public User getUser(String userId) {
		return userDao.selectUser(userId);
	}

	@Override
	public int getWithDrawal(int userNum) {
		return userDao.selectWithDrawal(userNum);
	}

	@Override
	public int checkUserId(String userId) {
		return userDao.selectUserId(userId);
	}

	@Override
	public int checkUserNickname(String nickname) {
		return userDao.selectUserNickname(nickname);
	}

	@Override
	public int checkUserPhoneNum(String phoneNum) {
		return userDao.selectUserPhoneNum(phoneNum);
	}

	@Override
	public int checkUserEmail(String email) {
		return userDao.selectUserEmail(email);
	}

	@Override
	public int checkFixUserNickname(UserDto nickname) {
		return userDao.selectFixUserNickname(nickname);
	}

	@Override
	public int checkFixUserPhoneNum(UserDto phoneNum) {
		return userDao.selectFixUserPhoneNum(phoneNum);
	}

	@Override
	public int checkFixUserEmail(UserDto email) {
		return userDao.selectFixUserEmail(email);
	}

	@Override
	public List<String> getUserGenre(int userNum) {
		return userDao.selectUserGenre(userNum);
	}

	@Override
	public List<Integer> getGenreNum(int userNum) {
		return userDao.selectGenreNum(userNum);
	}

	@Override
	public void addUser(User user) {
		userDao.insertUser(user);
	}

	@Override
	//@Transactional
	public void addUserGenre(int userNum, int genreNum) {
		userDao.insertUserGenre(userNum, genreNum);
/*		try {
			// 데이터베이스 연결 및 트랜잭션 시작
			Connection connection = // 데이터베이스 연결 객체 생성
					connection.setAutoCommit(false); // 트랜잭션 시작
			// SQL 쿼리를 사용하여 사용자와 장르 간의 관계 추가
			String query = "INSERT INTO UserGenre (userNum, genreNum) VALUES (?, ?)";
			try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
				preparedStatement.setInt(1, userNum);
				preparedStatement.setInt(2, genreNum);
				preparedStatement.executeUpdate();
			}
			connection.commit(); // 트랜잭션 커밋
		} catch (SQLException e) {
			connection.rollback(); // 예외 발생 시 롤백
			e.printStackTrace(); // 예외 처리는 적절하게 수행
		} finally {
			connection.close(); // 데이터베이스 연결 종료
		} */
	}

	@Override
	public void addWithDrawal(int userNum) {
		userDao.insertWithDrawal(userNum);
	}

	@Override
	public int fixUser(User userData) {
		return userDao.updateUser(userData);
	}

	@Override
	public void delUserGenre(int userNum) {
		userDao.deleteUserGenre(userNum);
	}

	@Override
	public String findId(UserDto userDto) {
		return userDao.selectId(userDto);
	}
	
	@Override
	public String findPw(UserDto userDto) {
		return userDao.selectPw(userDto);
	}
	
	@Override
	public String findPw(String email, String userId) {
		return userDao.selectPw(email, userId);
	}
	
	@Override
	public void fixPw(User user) {
		userDao.updatePw(user);
	}

/*	@Override
	@Transactional
	public void addUserGenresLogic(String userId, List<Integer> genreNums) {
		User user = getUser(userId);
		int userNum = user.getUserNum();
		for (int genre : genreNums) {
			addUserGenre(userNum, genre);
		} // 비지니스 로직 추가
	} */
}