package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.landDTO;
import com.example.demo.dto.storeDTO;
import com.example.demo.mapper.storeMapper;

@Service
public class storeService {

	@Autowired
	public storeMapper mapper;
	
	public List<storeDTO> selectStore() throws Exception {
		return mapper.selectStore();
	}
	
	public List<storeDTO> getStore() throws Exception {
		return mapper.getStore();
	}
	
	public void addStore(storeDTO storeDTO) throws Exception {
		mapper.addStore(storeDTO);
	}
	public storeDTO getStoreOne(String st_nm) throws Exception {
		return mapper.getStoreOne(st_nm);
	}
	public void storeModifyForm(String st_nm) throws Exception {
		mapper.storeModifyForm(st_nm);
	}
	public void storeModify(storeDTO storeDTO) throws Exception {
		mapper.storeModify(storeDTO);
	}
	
	public void storeDelete(String st_nm) throws Exception {
		mapper.storeDelete(st_nm);
	}
	
	public storeDTO getAlert(String st_nm) throws Exception {
		return mapper.getAlert(st_nm);
	}
	
}
