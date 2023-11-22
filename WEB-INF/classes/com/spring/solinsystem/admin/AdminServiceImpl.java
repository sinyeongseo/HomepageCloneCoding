package com.spring.solinsystem.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.solinsystem.dao.ContactDAO;
import com.spring.solinsystem.dao.MemberDAO;
import com.spring.solinsystem.dao.TableDAO;
import com.spring.solinsystem.dto.CommentDTO;
import com.spring.solinsystem.dto.ContactDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.dto.TableDTO;
import com.spring.solinsystem.util.Criteria;

@Service
public class AdminServiceImpl implements AdminService{
	@Inject MemberDAO memberdao;
	@Inject ContactDAO contactdao;
	@Inject TableDAO tabledao;
	
	
	public int adminlogin(MemberDTO dto) {
		return  memberdao.adminlogin(dto);
	}
	
	@Override
	public List<MemberDTO> getMemberList(Criteria cri){
		return  memberdao.getMemberList(cri);
	}
	
	@Override
	public int countMemberList() {
		return  memberdao.countMemberList();
	}
	
	@Override
	public List<ContactDTO> getContactList(Criteria cri){
		return contactdao.getContactList(cri);
	}
	
	@Override
	public int countContactList() {
		return contactdao.countContactList();
	}
	
	@Override
	public void noticeservice(TableDTO dto) {
		tabledao.noticeservice(dto);
	}
	@Override
	public List<TableDTO> getNoticeList(Criteria cri){
		return tabledao.getNoticeList(cri);
	}
	
	@Override
	public int countNoticeList() {
		return tabledao.countNoticeList();
	}
	
	@Override
	public List<MemberDTO> mbsearchService(MemberDTO dto){
		return memberdao.mbsearchService(dto);
	}
	
	@Override
	public List<ContactDTO> ctsearchService(ContactDTO dto){
		return contactdao.ctsearchService(dto);
	}
	
	@Override
	public List<TableDTO> ntsearchService(TableDTO dto){
		return tabledao.ntsearchService(dto);
	}
	
	@Override
	public MemberDTO getmbContent(MemberDTO dto) {
		return memberdao.getmbContent(dto);
	}
	@Override
	public List<CommentDTO> getcommentContent(MemberDTO dto) {
		return tabledao.getcommentContent(dto);
	}
	@Override
	public List<ContactDTO> getcontactContent(MemberDTO dto) {
		return contactdao.getcontactContent(dto);
	}
	@Override
	public List<TableDTO> gettableContent(MemberDTO dto) {
		return tabledao.gettableContent(dto);
	}
	@Override
	public void deleteMember(String mb_id) {
		memberdao.deleteMember(mb_id);
	}
	
	@Override
	public ContactDTO getctContent(ContactDTO dto) {
		return contactdao.getctContent(dto);
	}
	
	@Override
	public void deleteContact(int ct_num) {
		contactdao.deleteContact(ct_num);
	}
	
	@Override
	public TableDTO getntContent(TableDTO dto) {
		return tabledao.getntContent(dto);
	}
	
	@Override
	public void deleteNotice(int nt_num) {
		tabledao.deleteNotice(nt_num);
	}
	
	@Override
	public List<CommentDTO> getcoContent(CommentDTO ct) {
		return tabledao.getcoContent(ct);
	}
	
	@Override
	public void deleteComment(int co_no) {
		tabledao.deleteComment(co_no);
	}
	
	@Override
	public void contactcheck(int ct_num) {
		contactdao.contactcheck(ct_num);
	}
	@Override
	public void contactcheckno(int ct_num) {
		contactdao.contactcheckno(ct_num);
	}
	
	
	
	
	@Override
	public int getTotalMemCount(String year) {
		return memberdao.getTotalMemCount(year);
	}
	@Override
	public int getTotalNotCount(String year) {
		return tabledao.getTotalNotCount(year);
	}
	@Override
	public float getTotalConCount(String year) {
		return contactdao.getTotalConCount(year);
	}
	@Override
	public int getTotalComCount(String year) {
		return tabledao.getTotalComCount(year);
	}
	
	
	
	@Override
	public int getJanCount(String year) {
		return tabledao.getJanCount(year);
	}
	@Override
	public int getFebCount(String year) {
		return tabledao.getFebCount(year);
	}
	@Override
	public int getMarCount(String year) {
		return tabledao.getMarCount(year);
	}
	@Override
	public int getAprCount(String year) {
		return tabledao.getAprCount(year);
	}
	@Override
	public int getMayCount(String year) {
		return tabledao.getMayCount(year);
	}
	@Override
	public int getJunCount(String year) {
		return tabledao.getJunCount(year);
	}
	@Override
	public int getJulCount(String year) {
		return tabledao.getJulCount(year);
	}
	@Override
	public int getAugCount(String year) {
		return tabledao.getAugCount(year);
	}
	@Override
	public int getSepCount(String year) {
		return tabledao.getSepCount(year);
	}
	@Override
	public int getOctCount(String year) {
		return tabledao.getOctCount(year);
	}
	
	@Override
	public int getNovCount(String year) {
		return tabledao.getNovCount(year);
	}
	@Override
	public int getDecCount(String year) {
		return tabledao.getDecCount(year);
	}
	
	
	
	
	@Override
	public int getmJunCount(String year) {
		return memberdao.getJunCount(year);
	}
	@Override
	public int getmJulCount(String year) {
		return memberdao.getJulCount(year);
	}
	@Override
	public int getmAugCount(String year) {
		return memberdao.getAugCount(year);
	}
	@Override
	public int getmSepCount(String year) {
		return memberdao.getSepCount(year);
	}
	@Override
	public int getmOctCount(String year) {
		return memberdao.getOctCount(year);
	}
	@Override
	public int getmNovCount(String year) {
		return memberdao.getNovCount(year);
	}
	@Override
	public int getmDecCount(String year) {
		return memberdao.getDecCount(year);
	}
	@Override
	public int getmMemCount(String year) {
		return contactdao.getMemCount(year);
	}
	@Override
	public int getmNoCount(String year) {
		return contactdao.getNoCount(year);
	}
	@Override
	public int getmJanCount(String year) {
		return memberdao.getJanCount(year);
	}
	@Override
	public int getmFebCount(String year) {
		return memberdao.getFebCount(year);
	}
	@Override
	public int getmMarCount(String year) {
		return memberdao.getMarCount(year);
	}
	@Override
	public int getmAprCount(String year) {
		return memberdao.getAprCount(year);
	}
	@Override
	public int getmMayCount(String year) {
		return memberdao.getMayCount(year);
	}
	
	
	
	
	@Override
	public int getMemCount(String year) {
		return contactdao.getMemCount(year);
	}
	@Override
	public int getNoCount(String year) {
		return contactdao.getNoCount(year);
	}
	
}
