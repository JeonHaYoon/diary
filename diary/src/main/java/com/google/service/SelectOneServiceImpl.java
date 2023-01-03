package com.google.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.Criteria;
import com.google.domain.SelectOneAttachDTO;
import com.google.domain.SelectOneVO;
import com.google.domain.SelectVoteVO;
import com.google.mapper.SelectOneAttachMapper;
import com.google.mapper.SelectOneMapper;
import com.google.mapper.SelectVoteMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SelectOneServiceImpl implements SelectOneService{

	private SelectOneMapper mapper;
	private SelectOneAttachMapper attachMapper;
	private SelectVoteMapper voteMapper;
	
	@Transactional
	@Override
	public void register(SelectOneVO vo) {
		mapper.insert(vo);
		
	
		
	}

	@Transactional
	@Override
	public SelectOneVO read(long select_pk) {
		mapper.updateHit(select_pk);  //조회수증가
		return mapper.read(select_pk);
	}

	@Override
	public List<SelectOneVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getListTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListTotal(cri);
	}

	@Override
	public void modify(SelectOneVO vo) {
		mapper.update(vo);
		
		//첨부파일 테이블내용 삭제
		attachMapper.deleteAll(vo.getSelect_pk());
		
		//첨부파일 있으면 등록
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		vo.getAttachList().forEach(attach -> {
			attach.setSelect_pk(vo.getSelect_pk());
			attachMapper.insert(attach);
		});
		
	}
	
	@Transactional
	@Override
	public boolean remove(long select_pk) {
		
		attachMapper.deleteAll(select_pk);
		
		return mapper.delete(select_pk) == 1;
		
		//mapper.delete(select_pk);
		
	}

	@Override
	public List<SelectOneAttachDTO> getAttachList(Long select_pk) {
		return attachMapper.findByPk(select_pk);
	}

	@Override
	public int Votecheck(SelectVoteVO vo) {
		// TODO Auto-generated method stub
		return voteMapper.Votecheck(vo);
		}

}
