package com.google.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.Criteria;
import com.google.domain.ReplyPageDTO;
import com.google.domain.ReplyVO;
import com.google.mapper.ReplyMapper;
import com.google.mapper.SelectOneMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private SelectOneMapper selMapper;

	//댓글추가하므로 replyCnt 가 +1
	//보드 replyCnt 업데이트 된 후에 댓글 insert가 되어야함. 그래서 SelectOneMapper를 가져와야한다.
	@Transactional
	@Override
	public int insert(ReplyVO vo) {
		selMapper.updateReplyCnt(vo.getSelect_pk(),1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO read(long rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public ReplyPageDTO getListWithPaging(Criteria cri, long select_pk) {
		log.info("replyList"+select_pk);
		return new ReplyPageDTO(
				mapper.getCountByPk(select_pk)
				,mapper.getListWithPaging(cri, select_pk));
	}
	
	//댓글삭제하면 게시글의 replyCnt가 -1이 됨
	@Transactional
	@Override
	public int delete(long rno) {
		ReplyVO vo = mapper.read(rno);
		selMapper.updateReplyCnt(vo.getSelect_pk(), -1);
		return mapper.delete(rno);
	}


	

}
