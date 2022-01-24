package com.pack.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pack.model.Corp;

@Repository
public class CorpDao {

	@Autowired
	DataSource dataSource;

	public int insertCorp(Corp corp) {

		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "insert into corpsetup values(?,?,?,?,?)";
		obj.update(sql, corp.getCorpId(), corp.getCorpName(), corp.getCorpAddress(), corp.getCorpPhone(), "Y");
		System.out.println("inserted");
		return 1;
	}

	public List<Corp> viewAll() {
		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "SELECT * from corpsetup where status='Y'";
		List<Corp> corp = obj.query(sql, new BeanPropertyRowMapper<Corp>(Corp.class));
		return corp;
	}

	public Corp getCorpById(int id) {
		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "select * from corpsetup where corpId=?";

		Corp corp = obj.queryForObject(sql, new BeanPropertyRowMapper<Corp>(Corp.class), new Object[] { id });
		return corp;

	}

	public int modifyCorp(Corp corp) {

		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "update corpsetup set corpId=?,corpName=?,corpAddress=?,corpPhone=? where corpId=?";
		obj.update(sql, corp.getCorpId(), corp.getCorpName(), corp.getCorpAddress(), corp.getCorpPhone(),
				corp.getCorpId());
		return 1;
	}

	public int delete(int cid) {
		JdbcTemplate obj = new JdbcTemplate(dataSource);
		String sql = "update corpsetup set status='N' where corpId=?";
		String sql2 = "delete from usersetup where corpId=?";
		String sql3 = "delete from accsetup where corpId=?";
		obj.update(sql3, cid);
		obj.update(sql2, cid);
		obj.update(sql, cid);
		return 1;
	}

}
