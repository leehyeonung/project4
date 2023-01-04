package com.ezen.book.service;

import java.util.List;

import com.ezen.book.domain.CommentVO;

public interface CommentService {

	int register(CommentVO cvo);

	int modify(CommentVO cvo);

	List<CommentVO> getList(int bno);

}
