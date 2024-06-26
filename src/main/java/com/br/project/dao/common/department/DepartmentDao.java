package com.br.project.dao.common.department;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.project.dto.common.GroupDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DepartmentDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	
	/**
	 * @param map : [그룹코드]
	 * @return : 조회된 부서 리스트
	 */
	public List<GroupDto> selectDepartmentList(Map<String, String> map){
		return sqlSessionTemplate.selectList("departmentMapper.selectDepartmentList", map);
	}
	public List<Map<String, Object>> selectTeam() {
		return sqlSessionTemplate.selectList("departmentMapper.selectTeam");
	}
	
	/* ================================================= "가림" 구역 start ================================================= */
	/**
	 * @param params : [상위코드 그룹코드], [하위코드 그룹코드], [하위코드 코드]
	 * @return : [상위코드 그룹코드], [상위코드 코드명], [상위코드 코드명] 정보가 담긴 그룹객체
	 */
	public GroupDto selectUppderCode(HashMap<String, Object> params) {
		return sqlSessionTemplate.selectOne("departmentMapper.selectUppderCode", params);
	}

	/* ================================================= "가림" 구역 end ================================================= */
	
	/* ================================================= "기웅" 구역 start ================================================= */
	
	/* ================================================= "기웅" 구역 end ================================================= */
}
