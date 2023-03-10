package com.example.demo.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.dto.landDTO;

@Repository("landMapper")
public interface landMapper {
	public List<landDTO> selectLand() throws Exception;
	
	public List<landDTO> getLand() throws Exception;
	
	public void addLand(landDTO landDTO) throws Exception;
	
	public landDTO getLandOne(String la_nm) throws Exception;
	
	public void landModifyForm(String la_nm) throws Exception;
	
	public void landModify(landDTO landDTO) throws Exception;
	
	public void landDelete(String la_nm) throws Exception;
	
	public void landSort() throws Exception;
	
	public  List<landDTO> getAddr() throws Exception;
	

}
