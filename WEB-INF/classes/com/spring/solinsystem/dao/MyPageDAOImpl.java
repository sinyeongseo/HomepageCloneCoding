package com.spring.solinsystem.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.solinsystem.dto.MemberDTO;
@Repository
public class MyPageDAOImpl implements MyPageDAO{
	@Inject SqlSession sql;
	
	@Override
	public void editService(MemberDTO dto) throws Exception{
		sql.update("MypageMapper.editservice",dto);
	}
	
	@Override
	public void deleteService(MemberDTO dto) throws Exception{
		sql.delete("MypageMapper.deleteservice",dto);
	}
	@Override
	public int pwCheck(String login_pw){
		return sql.selectOne("MypageMapper.pwCheck", login_pw);
	}
	@Override
	public void pweditService(MemberDTO dto) throws Exception{
		sql.update("MypageMapper.pweditservice",dto);
	}
	
	@Override
	public int updateProfile(Map<String,Object>map) {
		return sql.update("MypageMapper.updateProfile",map);
	}
	
	@Override 
	public String selectProfile(String mb_id) {
		return sql.selectOne("MypageMapper.selectProfile", mb_id);
	}
}
