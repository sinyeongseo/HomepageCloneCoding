package com.spring.solinsystem.table;

import java.util.List;

import com.spring.solinsystem.dto.CommentDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.dto.TableDTO;
import com.spring.solinsystem.util.Criteria;

public interface TableService {

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

	void commentService(CommentDTO dto);

	List<CommentDTO> getCommentList(CommentDTO dto);

	int getComment(Criteria cri);

	void commentcount(TableDTO dto);

	MemberDTO gettablerole(String tb_writer);

	TableDTO getwriter(TableDTO dto);
}
