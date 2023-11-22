package com.spring.solinsystem.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.solinsystem.dto.ContactDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.util.Criteria;

@Repository
public class ContactDAOImpl implements ContactDAO {
	@Inject 
	SqlSession sql;
	
	@Override
	public void contact(ContactDTO dto)throws Exception{
		sql.insert("ContactMapper.contact",dto);
	}
	
	@Override
	public int countContactList() {
		return sql.selectOne("AdminMapper.countcontact");
	}
	
	@Override
	public List<ContactDTO> getContactList(Criteria cri){
		return sql.selectList("AdminMapper.getcontact",cri);
	}
	
	@Override
	public List<ContactDTO> ctsearchService(ContactDTO dto){
		return sql.selectList("AdminMapper.ctsearchService", dto);
	}
	
	@Override
	public ContactDTO getctContent(ContactDTO dto) {
	    return sql.selectOne("AdminMapper.getctContent",dto);
	}
	
	@Override
	public void deleteContact(int ct_num) {
		sql.delete("AdminMapper.deleteContact",ct_num);
	}
	
	@Override
	public List<ContactDTO> getcontact(MemberDTO dto) {
		return sql.selectList("AdminMapper.getmbcontact", dto);
	}
	
	@Override
	public void contactcheck(int ct_num) {
		sql.update("AdminMapper.contactcheck",ct_num);
	}
	@Override
	public void contactcheckno(int ct_num) {
		sql.update("AdminMapper.contactcheckno",ct_num);
	}
	
	@Override
	public int getMemCount(String year) {
		return sql.selectOne("AdminMapper.getmemcount",year);
	}
	
	@Override
	public int getNoCount(String year) {
		return sql.selectOne("AdminMapper.getnocount",year);
	}
	
	@Override
	public float getTotalConCount(String year) {
		return sql.selectOne("AdminMapper.getTotalcontact", year);
	}
	
	@Override
	public List<ContactDTO> getcontactContent(MemberDTO dto) {
		return sql.selectList("AdminMapper.getcontactContent",dto);
	}
}
