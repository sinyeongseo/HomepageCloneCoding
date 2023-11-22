package com.spring.solinsystem.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.solinsystem.dto.ContactDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.dto.TableDTO;
import com.spring.solinsystem.util.Criteria;

public interface MemberDAO {
	public MemberDTO login(MemberDTO dto) throws Exception;
	
	public void register(MemberDTO dto) throws Exception;

	public int idCheck(String input_id);
	
	public MemberDTO idSearch(MemberDTO dto) throws Exception;
	
	public MemberDTO pwSearch(MemberDTO dto) throws Exception;

	public MemberDTO getUserByUserId(String memberId);

	public int adminlogin(MemberDTO dto);

	public int countMemberList();

	public List<MemberDTO> getMemberList(Criteria cri);

	public List<MemberDTO> mbsearchService(MemberDTO dto);

	public MemberDTO getmbContent(MemberDTO dto);
	
	public void deleteMember(String mb_id);

	int getJanCount(String year);

	int getFebCount(String year);

	int getMarCount(String year);

	int getAprCount(String year);

	int getMayCount(String year);

	int getJunCount(String year);

	int getJulCount(String year);

	int getAugCount(String year);

	int getSepCount(String year);

	int getOctCount(String year);

	int getNovCount(String year);

	int getDecCount(String year);

	public int getTotalMemCount(String year);
	
}

