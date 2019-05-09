package com.chart;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.ChartVO;

@Repository
public class ChartDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ChartDao.class);
	public List<ChartVO> chartList(String mem_id) {
		logger.info("chartList 호출");
		List<ChartVO> chartVO = sqlSessionTemplate.selectList("chartList",mem_id);
		return chartVO;
	}
	public void ChartIns(ChartVO chartVO) {
		logger.info("ChartIns 호출");
		sqlSessionTemplate.insert("chartIns", chartVO);
	}
	public void ChartDel(String no) {
		logger.info("ChartDel 호출");
		sqlSessionTemplate.delete("ChartDel",no);
	}
	public void chartUpd(ChartVO chartVO) {
		logger.info("chartUpd 호출");
		sqlSessionTemplate.update("ChartUpd",chartVO);	
	}
	public ChartVO chartDetail(String no) {
		logger.info("chartDetail 호출");
		ChartVO chartVO = sqlSessionTemplate.selectOne("chartDetail",no);
		return chartVO;
	}
	//카드에서 차트 선택하면 차트복제 테이블에 새 데이터 생성하기
	public void chartCopy(ChartVO chartVO) {
		logger.info("chartCopy 호출");
		sqlSessionTemplate.insert("chartDuplicate", chartVO);
	}
	public List<ChartVO> cardAttach(ChartVO chartVO_1) {
		logger.info("cardAttach 호출");
		List<ChartVO> chartVO = sqlSessionTemplate.selectList("cardAttach",chartVO_1);
		return chartVO;
	}
}
