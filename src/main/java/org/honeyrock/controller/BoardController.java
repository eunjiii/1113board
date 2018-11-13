package org.honeyrock.controller;

import org.honeyrock.domain.BoardVO;
import org.honeyrock.domain.PageParam;
import org.honeyrock.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@GetMapping("/list")
	public void getListAll(Model model, @ModelAttribute("pageObj") PageParam pageParam) {
		
		pageParam.setTotal(service.getTotal());
		model.addAttribute("list", service.getListAll(pageParam));
		
	}
	
	@GetMapping("/register")
	public void registerGET(BoardVO board) {
		
	}
	
	@PostMapping("/register")
	public String registerPOST(BoardVO board, RedirectAttributes rttr) {
	
		rttr.addFlashAttribute("result", service.register(board)==1?"SUCCESS":"FAIL");
		return "redirect:/board/list";
		
	}
	
	@GetMapping({"/read","/modify"})
	public void readGET(BoardVO board, Model model, @ModelAttribute("pageObj") PageParam pageParam) {
		
		model.addAttribute("board", service.read(pageParam));
	}
	
	@PostMapping("/delete")
	public String deletePOST(BoardVO board, RedirectAttributes rttr) {
		
	
		rttr.addFlashAttribute("result", service.delete(board)==1?"SUCCESS":"FAIL");
		return "redirect:/board/list";
	}
	
	@PostMapping("/modify")
	public String modifyPOST( BoardVO board, PageParam pageParam, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("result", service.modify(board)==1?"SUCCESS":"FAIL");
		return pageParam.getLink("redirect:/board/list");
	}
	
	
}
