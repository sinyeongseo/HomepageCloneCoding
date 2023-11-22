package com.spring.solinsystem.contact;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.solinsystem.dao.ContactDAO;
import com.spring.solinsystem.dto.ContactDTO;

@Service
public class ContactServiceImpl implements ContactService {
	@Inject 
	ContactDAO dao;
	
	@Override
	public void contact(ContactDTO dto)throws Exception{
		dao.contact(dto);
	}
}
