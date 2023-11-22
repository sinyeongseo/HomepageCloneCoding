package com.spring.solinsystem.table;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.solinsystem.dao.TableDAO;
import com.spring.solinsystem.dto.CommentDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.dto.TableDTO;
import com.spring.solinsystem.util.Criteria;

@Service
public class TableServiceImpl implements TableService{
	@Inject
	TableDAO dao;
	
	@Override
	public List<TableDTO> getList(Criteria cri){
		return dao.getList(cri);
	}
	
	@Override
	public TableDTO getContent(TableDTO dto){
		System.out.println("서비스");
		TableDTO list= dao.getContent(dto);
		System.out.println(list);
		return list;
	}

	@Override
	public void writeService(TableDTO dto) {
		dao.writeService(dto);
	}
	
	@Override 
	public int tbpwCheck(TableDTO dto) {
		return dao.tbpwCheck(dto);
	}
	
	@Override
	public void deleteService(TableDTO dto) {
		dao.deleteService(dto);
	}
	
	@Override
	public void editService(TableDTO dto) {
		dao.editService(dto);
	}
	
	@Override
	public void likeService(TableDTO dto) {
		dao.likeService(dto);
	}
	
	@Override
	public void viewService(TableDTO dto) {
		dao.viewService(dto);
	}
	
	@Override
	public List<TableDTO> searchService(TableDTO dto){
		return dao.searchService(dto);
	}
	
	@Override
	public int countTableList() {
		return dao.countTableList();
	}
	
	@Override
	public void commentService(CommentDTO dto) {
		dao.commentService(dto);
	}
	
	@Override 
	public List<CommentDTO> getCommentList(CommentDTO dto){
		return dao.getCommentList(dto);
	}
	
	@Override
	public int getComment(Criteria cri) {
		return dao.getComment(cri);
	}
	
	@Override
	public void commentcount(TableDTO dto) {
		dao.commentcount(dto);
	}
	
	@Override
	public MemberDTO gettablerole(String tb_writer) {
		return dao.gettablerole(tb_writer);
	}
	
	@Override
	public TableDTO getwriter(TableDTO dto) {
		return dao.getwriter(dto);
	}
}
