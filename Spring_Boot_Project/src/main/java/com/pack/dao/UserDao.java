package com.pack.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pack.model.User;

@Repository
public class UserDao {

	@Autowired
	DataSource dataSource;

	public int insertUser(User user) {

		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "insert into usersetup values(?,?,?,?,?,?,?,?)";
		obj.update(sql, user.getLoginId(), user.getPassword(), user.getDepartment(), user.getUserAddress(),
				user.getUserPhone(), user.getCorpId(), "Y", "N");
		System.out.println("inserted");
		return 1;
	}

	public List<User> viewAll() {
		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "SELECT * from usersetup where status='Y'";
		List<User> user = obj.query(sql, new BeanPropertyRowMapper<User>(User.class));
		return user;
	}

	public User getUserById(String id) {
		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "select * from usersetup where loginId=?";

		User user = obj.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), new Object[] { id });
		return user;

	}

	public int modifyUser(User user) {

		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "update usersetup set corpId=?,password=?,department=?,userAddress=?,userPhone=? where loginId=?";
		obj.update(sql, user.getCorpId(), user.getPassword(), user.getDepartment(), user.getUserAddress(),
				user.getUserPhone(), user.getLoginId());
		return 1;
	}

	public int delete(String id) {
		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "update usersetup set status='N' where loginId=?";
		obj.update(sql, id);
		return 1;
	}

}
