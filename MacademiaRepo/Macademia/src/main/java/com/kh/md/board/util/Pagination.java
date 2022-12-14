package com.kh.md.board.util;

import com.kh.md.board.vo.PageVo;

public class Pagination {
	//PageVo 리턴
	public static PageVo getPageVo(int listCount, int currentPage, int pageLimit, int  boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageVo vo = new PageVo();
		vo.setListConut(listCount);
		vo.setCurrentPage(currentPage);
		vo.setPageLimit(pageLimit);
		vo.setBoardLimit(boardLimit);
		vo.setMaxPage(maxPage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		return vo;
	}
	
	public static PageVo calculate(int page, int size, Long count) {
		int maxPage = (int)Math.ceil((double)count / size);
		int startPage = (page -1) / size * size + 1;
		int endPage = startPage + size - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageVo vo = new PageVo();
		vo.setListConut(count.intValue());
		vo.setCurrentPage(page);
		vo.setPageLimit(size);
		vo.setBoardLimit(size);
		vo.setMaxPage(maxPage);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		return vo;
	}
}