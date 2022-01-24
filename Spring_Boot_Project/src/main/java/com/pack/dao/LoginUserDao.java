package com.pack.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.pack.model.ChangePassword;
import com.pack.model.LoginUser;

@Repository
public class LoginUserDao {

	@Autowired
	DataSource dataSource;

	public int check(LoginUser log) {
		JdbcTemplate obj = new JdbcTemplate(dataSource);

		String username = log.getLoginId();
		String password = log.getPassword();

		String usernameDB = "";
		String passwordDB = "";
		String perm = "";

		int check = 0;

		String sql = "select * from usersetup where status='Y'";

		SqlRowSet rs = obj.queryForRowSet(sql);

		while (rs.next()) {
			usernameDB = rs.getString("loginId");
			passwordDB = rs.getString("password");
			perm = rs.getString("perm");

			if (usernameDB.equals(username) && passwordDB.equals(password) && perm.equals("N")) {
				check = 1;
			} else if (usernameDB.equals(username) && passwordDB.equals(password) && perm.equals("Y")) {
				check = 2;

			}

		}
		return check;

	}

	public int insertPass(ChangePassword change) {

		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "update usersetup set password=?,perm=? where password=?";
		obj.update(sql, change.getPassword2(), "Y", change.getPassword1());
		System.out.println("changed");
		return 1;
	}

}
