package com.spring.solinsystem.dao;

import java.util.List;

import com.spring.solinsystem.dto.CommentDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.dto.TableDTO;
import com.spring.solinsystem.util.Criteria;

public interface TableDAO {

	List<TableDTO> getList(Criteria cri);
	

	TableDTO getContent(TableDTO dto);
	
	void writeService(TableDTO dto);

	int tbpwCheck(TableDTO dto);
	
	void deleteService(TableDTO dto);
	
	void editService(TableDTO dto);
	
	void likeService(TableDTO dto);
	
	void viewService(TableDTO dto);

	List<TableDTO> searchService(TableDTO dto);

	int countTableList();

	List<TableDTO> getNoticeList(Criteria cri);

	int countNoticeList();

	List<TableDTO> ntsearchService(TableDTO dto);

	TableDTO getntContent(TableDTO dto);


	List<TableDTO> getnotice(MemberDTO dto);

	void deleteNotice(int nt_num);

	void commentService(CommentDTO dto);

	List<CommentDTO> getCommentList(CommentDTO dto);


	int getComment(Criteria cri);


	void commentcount(TableDTO dto);


	List<CommentDTO> getcoContent(CommentDTO ct);


	void deleteComment(int co_no);


	int getOctCount(String year);


	int getNovCount(String year);


	int getJanCount(String year);


	int getFebCount(String year);


	int getAprCount(String year);


	int getMarCount(String year);


	int getMayCount(String year);


	int getJunCount(String year);


	int getAugCount(String year);


	int getSepCount(String year);


	int getDecCount(String year);


	int getJulCount(String year);


	int getTotalNotCount(String year);


	int getTotalComCount(String year);


	List<CommentDTO> getcommentContent(MemberDTO dto);


	List<TableDTO> gettableContent(MemberDTO dto);


	void noticeservice(TableDTO dto);


	MemberDTO gettablerole(String tb_writer);


	TableDTO getwriter(TableDTO dto);
}
