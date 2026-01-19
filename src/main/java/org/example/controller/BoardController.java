package org.example.controller;

import org.example.mapper.BoardMapper;
import org.example.domain.BoardVO;

import org.example.service.RandomBible;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardMapper boardMapper;

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", boardMapper.getList());
        return "board/list";
    }

    @GetMapping("/main")
    public String mainPage() {
        return "board/main";
    }

    @Autowired
    private RandomBible randomBible;

    @GetMapping(value = "/api/bible", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String getBibleVerse(@RequestParam("chapter") int chapter, @RequestParam("verse") int verse) {
        return randomBible.findVerse(chapter, verse);
    }

    @PostMapping("/write")
    public String write(BoardVO board) {
        boardMapper.insert(board);
        return "redirect:/board/list";
    }

    @GetMapping("/view")
    public String view(@RequestParam int id, Model model) {
        model.addAttribute("board", boardMapper.get(id));
        return "board/view";
    }

    @GetMapping("/edit")
    public String edit_form(@RequestParam int id, Model model) {
        model.addAttribute("board", boardMapper.get(id));
        return "board/edit";
    }

    @PostMapping("/edit")
    public String update(BoardVO board) {
        boardMapper.update(board);
        return "redirect:/board/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam int id) {
        boardMapper.delete(id);
        return "redirect:/board/list";
    }
}
