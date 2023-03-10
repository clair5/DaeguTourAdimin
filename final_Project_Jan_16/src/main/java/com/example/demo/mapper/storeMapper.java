package com.example.demo.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.dto.landDTO;
import com.example.demo.dto.storeDTO;

@Repository("storeMapper")
public interface storeMapper {
	public List<storeDTO> selectStore() throws Exception;
	
	public List<storeDTO> getStore() throws Exception;
	
	public void addStore(storeDTO storeDTO) throws Exception;
	
	public storeDTO getStoreOne(String st_nm) throws Exception;
	
	public void storeModifyForm(String st_nm) throws Exception;
	
	public void storeModify(storeDTO storeDTO) throws Exception;
	
	public void storeDelete(String st_nm) throws Exception;
	
	public storeDTO getAlert(String st_nm) throws Exception;
	
}
