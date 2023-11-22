package com.spring.solinsystem.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.solinsystem.dto.CommentDTO;
import com.spring.solinsystem.dto.MemberDTO;
import com.spring.solinsystem.dto.TableDTO;
import com.spring.solinsystem.util.Criteria;

@Repository
public class TableDAOImpl implements TableDAO{
	@Inject SqlSession sql;
	
	
	@Override
	public List<TableDTO> getList(Criteria cri) {
		return sql.selectList("TableMapper.getList",cri);
	}
	
	@Override
	public TableDTO getContent(TableDTO dto){
		return  sql.selectOne("TableMapper.getContent", dto);
	}
	
	@Override
	public void writeService(TableDTO dto) {
		sql.insert("TableMapper.writeService", dto);
	}
	
	@Override
	public int tbpwCheck(TableDTO dto) {
		return sql.selectOne("TableMapper.tbpwCheck", dto);
	}

	@Override
	public void deleteService(TableDTO dto) {
		sql.delete("TableMapper.deleteService", dto);
	}
	
	@Override
	public void editService(TableDTO dto) {
		sql.update("TableMapper.editService", dto);	
	}
	
	@Override
	public void likeService(TableDTO dto) {
		sql.update("TableMapper.likeService",dto);
	}
	
	@Override
	public void viewService(TableDTO dto) {
		sql.update("TableMapper.viewService", dto);
	}
	
	@Override
	public List<TableDTO> searchService(TableDTO dto) {
		return sql.selectList("TableMapper.searchService",dto);
	}
	
	@Override
	public int countTableList() {
		return sql.selectOne("TableMapper.countTableList");
	}
	
	@Override
	public int countNoticeList() {
		return sql.selectOne("AdminMapper.countnotice");
	}
	
	@Override
	public List<TableDTO> getNoticeList(Criteria cri){
		return sql.selectList("AdminMapper.getnotice",cri);
	}
	
	@Override
	public List<TableDTO> ntsearchService(TableDTO dto){
		return sql.selectList("AdminMapper.ntsearchService",dto);
	}
	
	@Override
	public TableDTO getntContent(TableDTO dto) {
		return sql.selectOne("AdminMapper.getntContent",dto);
	}
	
	@Override
	public List<TableDTO> getnotice(MemberDTO dto) {
		return sql.selectList("AdminMapper.getmbnotice",dto);
	}
	@Override
	public void deleteNotice(int nt_num) {
		sql.delete("AdminMapper.deleteNotice",nt_num);
	}
	
	@Override
	public void commentService(CommentDTO dto) {
		sql.insert("TableMapper.commentService", dto);
	}
	
	@Override
	public List<CommentDTO> getCommentList(CommentDTO dto) {
		return sql.selectList("TableMapper.getCommentList",dto);
	}
	
	@Override
	public int getComment(Criteria cri) {
		return sql.selectOne("TableMapper.getComment",cri);
	}
	
	@Override
	public void commentcount(TableDTO dto) {
		sql.update("TableMapper.commentcount", dto);
	}
	
	@Override
	public List<CommentDTO> getcoContent(CommentDTO dto) {
		return sql.selectList("AdminMapper.getcoContent",dto);
	}
	
	@Override
	public void deleteComment(int co_no) {
		sql.delete("AdminMapper.deleteComment",co_no);
	}
	@Override
	public int getJanCount(String year) {
		return sql.selectOne("AdminMapper.getJanCount",year);
	}@Override
	public int getFebCount(String year) {
		return sql.selectOne("AdminMapper.getFebCount", year);
	}
	@Override
	public int getMarCount(String year) {
		return sql.selectOne("AdminMapper.getMarCount", year);
	}
	@Override
	public int getAprCount(String year) {
		return sql.selectOne("AdminMapper.getAprCount", year);
	}
	@Override
	public int getMayCount(String year) {
		return sql.selectOne("AdminMapper.getMayCount", year);
	}
	@Override
	public int getJunCount(String year) {
		return sql.selectOne("AdminMapper.getJunCount", year);
	}
	@Override
	public int getJulCount(String year) {
		return sql.selectOne("AdminMapper.getJulCount", year);
	}
	@Override
	public int getAugCount(String year) {
		return sql.selectOne("AdminMapper.getAugCount", year);
	}
	@Override
	public int getSepCount(String year) {
		return sql.selectOne("AdminMapper.getSepCount", year);
	}
	@Override
	public int getOctCount(String year) {
		return sql.selectOne("AdminMapper.getOctCount", year);
	}
	@Override
	public int getNovCount(String year) {
		return sql.selectOne("AdminMapper.getNovCount", year);
	}
	@Override
	public int getDecCount(String year) {
		return sql.selectOne("AdminMapper.getDecCount", year);
	}
	@Override
	public int getTotalNotCount(String year) {
		return sql.selectOne("AdminMapper.getTotalNotCount",year);
	}
	@Override
	public int getTotalComCount(String year) {
		return sql.selectOne("AdminMapper.getTotalComCount",year);
	}
	@Override
	public List<CommentDTO> getcommentContent(MemberDTO dto) {
		return sql.selectList("AdminMapper.getcommentContent",dto);
	}
	@Override
	public List<TableDTO> gettableContent(MemberDTO dto) {
		return sql.selectList("AdminMapper.gettableContent",dto);
	}
	@Override
	public void noticeservice(TableDTO dto) {
		sql.insert("AdminMapper.noticeservice",dto);
	}
	@Override
	public MemberDTO gettablerole(String tb_writer) {
		return sql.selectOne("TableMapper.gettablerole",tb_writer);
	}
	@Override
	public TableDTO getwriter(TableDTO dto) {
		return sql.selectOne("TableMapper.getwriter",dto);
	}
}

