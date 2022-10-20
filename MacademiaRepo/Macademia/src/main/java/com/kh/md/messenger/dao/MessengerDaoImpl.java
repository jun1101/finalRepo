package com.kh.md.messenger.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.vo.MsgNoticeVo;

@Repository
public class MessengerDaoImpl implements MessengerDao{

	//공지톡 게시글 ( 입력 )
	@Override
	public int insertNotice(SqlSessionTemplate sst, MsgNoticeVo noticeVo) {
		return sst.insert("messengerMapper.insertNotice", noticeVo);
	}
	
	
	//공지톡 게시글 ( 메인 화면 )
	@Override
	public List<MsgNoticeVo> selectNoticeAll(SqlSessionTemplate sst, PageVo pvo) {
		
		//페이징 처리
		int offset = pvo.getCurrentCount()-1 * pvo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pvo.getBoardLimit());
		
		return sst.selectList("messengerMapper.selectNoticeAll",null,rb);
	}

	//공지톡 게시글 ( 상세 화면 )
	@Override
	public MsgNoticeVo selectOneByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("messengerMapper.selectOneByNo",no);
	}

	//공지톡 게시글 ( 조회 수 증가 )
	@Override
	public int increaseHit(SqlSessionTemplate sst, String no) {
		return sst.update("messengerMapper.increaseHit", no);
	}


	//공지톡 게시글 ( 수정 화면 )
	@Override
	public MsgNoticeVo selectEditByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("messengerMapper.selectEditByNo", no);
	}

	//공지톡 게시글 ( 수정 처리 )
	@Override
	public int updateEdit(SqlSessionTemplate sst, MsgNoticeVo noticeVo) {
		return sst.update("messengerMapper.updateEdit", noticeVo);
	}


	//공지톡 게시글 ( 삭제 처리 )
	@Override
	public int updateDelete(SqlSessionTemplate sst, String no) {
		return sst.update("messengerMapper.updateDelete", no);
	}

	//공지톡 게시글 ( 게시글 총 수 )
	@Override
	public int selectTotalCnt(SqlSessionTemplate sst) {
		return sst.selectOne("messengerMapper.selectTotalCnt");
	}

	
	
	
}//class