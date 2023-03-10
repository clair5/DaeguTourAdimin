package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.example.demo.dto.landDTO;
import com.example.demo.mapper.landMapper;

@Service
public class landService {
	
	@Autowired
	private landMapper mapper;

	public List<landDTO> selectLand() throws Exception {
		return mapper.selectLand();
	}
	
	public List<landDTO> getLand() throws Exception {
		return mapper.getLand();
	}
	
	public void addLand(landDTO landDTO) throws Exception {
		mapper.addLand(landDTO);
	}
	public landDTO getLandOne(String la_nm) throws Exception {
		return mapper.getLandOne(la_nm);
	}
	public void landModifyForm(String la_nm) throws Exception {
		mapper.landModifyForm(la_nm);
	}
	public void landModify(landDTO landDTO) throws Exception {
		mapper.landModify(landDTO);
	}
	
	public void landDelete(String la_nm) throws Exception {
		mapper.landDelete(la_nm);
	}
	
	public void landSort() throws Exception {
		mapper.landSort();
	}
	
	public List<landDTO> getAddr() throws Exception {
		return mapper.getAddr();
	}
	

	
}
