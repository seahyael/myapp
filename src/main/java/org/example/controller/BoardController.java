package org.example.controller;

import org.example.mapper.BoardMapper;
import org.example.domain.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


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

    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
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
