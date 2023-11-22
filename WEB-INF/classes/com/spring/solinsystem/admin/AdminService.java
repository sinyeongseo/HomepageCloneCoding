package com.spring.solinsystem.admin;

import java.util.List;

import com.spring.solinsystem.dto.CommentDTO;
import com.spring.solinsystem.dto.ContactDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.dto.TableDTO;
import com.spring.solinsystem.util.Criteria;

public interface AdminService {

	int adminlogin(MemberDTO dto);

	int countMemberList();

	List<MemberDTO> getMemberList(Criteria cri);

	int countContactList();

	List<ContactDTO> getContactList(Criteria cri);

	int countNoticeList();

	List<TableDTO> getNoticeList(Criteria cri);
	
	List<MemberDTO> mbsearchService(MemberDTO dto);

	List<ContactDTO> ctsearchService(ContactDTO dto);

	List<TableDTO> ntsearchService(TableDTO dto);

	MemberDTO getmbContent(MemberDTO dto);

	void deleteMember(String mb_id);

	ContactDTO getctContent(ContactDTO dto);

	void deleteContact(int ct_num);
	
	TableDTO getntContent(TableDTO dto);

	void deleteNotice(int tb_num);

	List<CommentDTO> getcoContent(CommentDTO ct);

	void deleteComment(int co_no);

	void contactcheck(int ct_num);

	void contactcheckno(int ct_num);

	int getOctCount(String year);

	int getNovCount(String year);

	int getJanCount(String year);

	int getFebCount(String year);

	int getMarCount(String year);

	int getAprCount(String year);

	int getMayCount(String year);

	int getJunCount(String year);

	int getAugCount(String year);

	int getSepCount(String year);

	int getDecCount(String year);

	int getJulCount(String year);

	int getMemCount(String year);

	int getNoCount(String year);
	
	int getmOctCount(String year);

	int getmNovCount(String year);

	int getmJanCount(String year);

	int getmFebCount(String year);

	int getmMarCount(String year);

	int getmAprCount(String year);

	int getmMayCount(String year);

	int getmJunCount(String year);

	int getmAugCount(String year);

	int getmSepCount(String year);

	int getmDecCount(String year);

	int getmJulCount(String year);

	int getmMemCount(String year);

	int getmNoCount(String year);

	int getTotalMemCount(String year);

	int getTotalNotCount(String year);

	float getTotalConCount(String year);

	int getTotalComCount(String year);

	List<CommentDTO> getcommentContent(MemberDTO dto);

	List<ContactDTO> getcontactContent(MemberDTO dto);

	List<TableDTO> gettableContent(MemberDTO dto);

	void noticeservice(TableDTO dto);
	

}
