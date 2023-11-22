package com.spring.solinsystem.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.solinsystem.dto.ContactDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.util.Criteria;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;
	// 회원가입

	@Override
	public void register(MemberDTO dto) throws Exception {
		sql.insert("MemberMapper.register", dto);
	}
	
	@Override
	public int idCheck(String input_id){
		return sql.selectOne("MemberMapper.idCheck", input_id);
	}
	
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception{
		return sql.selectOne("MemberMapper.login", dto);
	}
	
	@Override
	public MemberDTO idSearch(MemberDTO dto) throws Exception{
		return sql.selectOne("MemberMapper.idsearch",dto);
	}
	
	@Override
	public MemberDTO pwSearch(MemberDTO dto) throws Exception{
		return sql.selectOne("MemberMapper.pwsearch",dto);
	}
	
	@Override
	public MemberDTO getUserByUserId(String memberId) {
		return sql.selectOne("MemberMapper.getuser",memberId);
	}
	
	@Override
	public int adminlogin(MemberDTO dto) {
		return sql.selectOne("AdminMapper.adminlogin", dto);
	}
	
	@Override
	public int countMemberList() {
		return sql.selectOne("AdminMapper.countmember");
	}
	
	@Override
	public List<MemberDTO> getMemberList(Criteria cri){
		return sql.selectList("AdminMapper.getmember",cri);
	}
	
	@Override
	public List<MemberDTO> mbsearchService(MemberDTO dto){
		return sql.selectList("AdminMapper.mbsearchService",dto);
	}
	
	@Override
	public MemberDTO getmbContent(MemberDTO dto) {
		return sql.selectOne("AdminMapper.getmbContent", dto);
	}
	
	@Override
	public void deleteMember(String mb_id) {
		sql.delete("AdminMapper.deletemember", mb_id);
	}
	
	@Override
	public int getJanCount(String year) {
		return sql.selectOne("AdminMapper.getmJanCount",year);
	}@Override
	public int getFebCount(String year) {
		return sql.selectOne("AdminMapper.getmFebCount",year);
	}
	@Override
	public int getMarCount(String year) {
		return sql.selectOne("AdminMapper.getmMarCount",year);
	}
	@Override
	public int getAprCount(String year) {
		return sql.selectOne("AdminMapper.getmAprCount",year);
	}
	@Override
	public int getMayCount(String year) {
		return sql.selectOne("AdminMapper.getmMayCount",year);
	}
	@Override
	public int getJunCount(String year) {
		return sql.selectOne("AdminMapper.getmJunCount",year);
	}
	@Override
	public int getJulCount(String year) {
		return sql.selectOne("AdminMapper.getmJulCount",year);
	}
	@Override
	public int getAugCount(String year) {
		return sql.selectOne("AdminMapper.getmAugCount",year);
	}
	@Override
	public int getSepCount(String year) {
		return sql.selectOne("AdminMapper.getmSepCount",year);
	}
	@Override
	public int getOctCount(String year) {
		return sql.selectOne("AdminMapper.getmOctCount",year);
	}
	@Override
	public int getNovCount(String year) {
		return sql.selectOne("AdminMapper.getmNovCount",year);
	}
	@Override
	public int getDecCount(String year) {
		return sql.selectOne("AdminMapper.getmDecCount",year);
	}
	@Override
	public int getTotalMemCount(String year) {
		return sql.selectOne("AdminMapper.getTotalmember", year);
	}
	
}