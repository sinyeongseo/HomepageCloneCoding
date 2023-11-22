package com.spring.solinsystem.dao;

import java.util.List;

import com.spring.solinsystem.dto.ContactDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.util.Criteria;

public interface ContactDAO {
	public void contact(ContactDTO dto)throws Exception;

	public List<ContactDTO> getContactList(Criteria cri);

	public int countContactList();

	public List<ContactDTO> ctsearchService(ContactDTO dto);

	public ContactDTO getctContent(ContactDTO dto);

	public void deleteContact(int ct_num);

	public List<ContactDTO> getcontact(MemberDTO dto);

	public void contactcheck(int ct_num);

	public void contactcheckno(int ct_num);

	public int getMemCount(String year);

	public int getNoCount(String year);

	public float getTotalConCount(String year);

	public List<ContactDTO> getcontactContent(MemberDTO dto);
}
