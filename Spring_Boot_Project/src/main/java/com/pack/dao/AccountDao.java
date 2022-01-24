package com.pack.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pack.model.Account;

@Repository
public class AccountDao {

	@Autowired
	DataSource dataSource;

	public int insertAccount(Account account) {

		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "insert into accsetup values(?,?,?,?,?,?,?)";
		obj.update(sql, account.getAccNumber(), account.getAccName(), account.getAccBranch(), account.getAccCurrency(),
				account.getAccBalance(), account.getCorpId(), "Y");
		System.out.println("inserted");
		return 1;
	}

	public List<Account> viewAll() {
		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "SELECT * from accsetup where status='Y'";
		List<Account> account = obj.query(sql, new BeanPropertyRowMapper<Account>(Account.class));
		return account;
	}

	public int delete(String id) {
		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "update accsetup set status='N' where accNumber=?";
		obj.update(sql, id);
		return 1;
	}

}
