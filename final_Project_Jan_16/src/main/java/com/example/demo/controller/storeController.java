package com.example.demo.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dto.landDTO;
import com.example.demo.dto.storeDTO;
import com.example.demo.service.storeService;

@Controller
public class storeController {

	@Autowired
	storeService service;

	// DB에 저장된 가게 조회
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/store")
	public String getStore(Principal principal, Model model) throws Exception {
		List<storeDTO> list = service.getStore();
		model.addAttribute("list", list);
		model.addAttribute("username", principal.getName());
		return "store";
	} // store가 요청되면 getStore가 호출됨(만들어둔 storeDTO 형태로 리스트를 가져오고 그 값을 model에 담아둠

	// 랜드마크 등록
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/writeStore")
	public String writeStore() throws Exception {
		return "writeStore";
	} // writeStore.jsp 리턴해줌

	/*
	 * @RequestMapping(value = "/alert") public String alert(@RequestParam("st_nm")
	 * String st_nm, HttpServletRequest req, Model model) throws Exception {
	 * storeDTO data = service.getAlert(st_nm); model.addAttribute("data", data);
	 * req.setAttribute("msg", "등록 완료"); req.setAttribute("url",
	 * "/writeStoreAction"); return "alert"; }
	 */
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/writeStoreAction")
	public String addStore(storeDTO storeDTO) throws Exception {
		service.addStore(storeDTO);
		return "redirect:store";
	} // writeStore.jsp 내에 존재하는 폼은 writeStoreAction submit되면 writeStoreAction에 POST함

	// 상세 조회
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/viewStore")
	public String view(@RequestParam("st_nm") String st_nm, Model model) throws Exception {
		storeDTO data = service.getStoreOne(st_nm);
		model.addAttribute("data", data);
		return "viewStore";
	} // store.jsp에서 제목 클릭하면 수행되는 메소드. st_nm를 파라미터로 받아서 받아온 st_nm 값에 해당하는 st_nm, st_dt
		// 등을 model에 담아두고 view.jsp에 리턴

	// 랜드마크 수정
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/storeModifyForm")
	public String storeModifyForm(@RequestParam("st_nm") String st_nm, Model model) throws Exception {
		storeDTO data = service.getStoreOne(st_nm);
		model.addAttribute("data", data);
		return "storeModifyForm";
	} // view.jsp에서 수정누르면 storeModifyForm으로 이동되고 마찬가지고 st_nm을 파라미터로 받아와서 해당하는 값
		// storeModifyForm에 출력

	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/storeModify", method = RequestMethod.POST)
	public String storeModify(storeDTO storeDTO) throws Exception {
		service.storeModify(storeDTO);
		return "redirect:store";
	} // storeModifyForm에서 수정완료하면 storeModify로 POST되는데 xml에 설정해둔 Update구문 수행 후
		// redirect 옵션으로 페이지를 store로 바로 돌려줌

	// 랜드마크 삭제
	@PreAuthorize("hasRole('USER')")
	@RequestMapping(value = "/storeDelete")
	public String storeDelete(@RequestParam("st_nm") String st_nm) throws Exception {
		service.storeDelete(st_nm);
		return "redirect:store";
	} // 마찬가지로 view.jsp에서 삭제를 누르면 바로 Delete 구문 수행

}
