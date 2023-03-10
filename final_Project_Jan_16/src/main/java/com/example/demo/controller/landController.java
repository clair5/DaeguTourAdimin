package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dto.landDTO;
import com.example.demo.service.landService;

@Controller
public class landController {

	@Autowired
	landService service;

	// 12.29 DB 테스트용 로직
	/*
	 * @RequestMapping("/landmark") public ModelAndView selectLand() throws
	 * Exception { List<landDTO> list = new ArrayList<landDTO>(); list =
	 * service.selectLand();
	 * 
	 * return new ModelAndView("selectLandmark", "list", list); }
	 */

	// 아래부터 2022. 12. 30 ~

	// DB에 저장된 랜드마크 조회
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/landmark")
	public String getLand(Principal principal, Model model) throws Exception {
		List<landDTO> list = service.getLand();
		model.addAttribute("list", list); 
		model.addAttribute("username", principal.getName()); // spring security에서 기본 제공하는 principal로 로그인된 username을 model에 담는다.
		return "landmark";
	} //landmark가 요청되면 getLand가 호출됨(만들어둔 listDTO 형태로 리스트를 가져오고 그 값을 model에 담아둠 
	
	
	// 랜드마크 등록
	
	@PreAuthorize("hasRole('USER')")
	  @RequestMapping(value = "/write")
	  public String write() throws Exception {
		  return "write";
	} //write.jsp 리턴해줌
	
	@PreAuthorize("hasRole('USER')")
	  @RequestMapping(value="/writeAction")
	  public String addLand(landDTO landDTO) throws Exception {
		  service.addLand(landDTO);
		  return "redirect:landmark";
	  } //write.jsp 내에 존재하는 폼은 writeAction submit되면 writeAction에 POST함
	 

	// 상세 조회
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/view")
	public String view(@RequestParam("la_nm") String la_nm, Model model) throws Exception {
		landDTO data = service.getLandOne(la_nm);
		model.addAttribute("data", data);
		return "view";
	} //landmark.jsp에서 제목 클릭하면 수행되는 메소드. idx를 파라미터로 받아서 받아온 idx 값에 해당하는 la_nm, la_dt_k 등을 model에 담아두고 view.jsp에 리턴 


	// 랜드마크 수정
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/landModifyForm")
	public String landModifyForm(@RequestParam("la_nm") String la_nm, Model model) throws Exception {
		landDTO data = service.getLandOne(la_nm);
		model.addAttribute("data", data);
		return "landModifyForm";
	} // view.jsp에서 수정누르면 landModifyForm으로 이동되고 마찬가지고 idx를 파라미터로 받아와서 해당하는 값 landModifyForm에 출력

	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/landModify", method = RequestMethod.POST)
	public String landModify(landDTO landDTO) throws Exception {
		service.landModify(landDTO);
		return "redirect:landmark";
	} //landModifyForm에서 수정완료하면 landModify로 POST되는데 xml에 설정해둔 Update구문 수행 후 redirect 옵션으로 페이지를 landmark로 바로 돌려줌

	// 랜드마크 삭제
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/landDelete")
	public String landDelete(@RequestParam("la_nm") String la_nm) throws Exception {
		service.landDelete(la_nm);
		return "redirect:landmark";
	} // 마찬가지로 view.jsp에서 삭제를 누르면 바로 Delete 구문 수행 
}
