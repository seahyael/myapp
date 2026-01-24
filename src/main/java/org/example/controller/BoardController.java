package org.example.controller;

import org.example.mapper.BoardMapper;
import org.example.domain.BoardVO;

import org.example.service.RandomBible;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardMapper boardMapper;

    @GetMapping("/list")
    public String list(
            @RequestParam(value = "book", required = false) String book,
            @RequestParam(value = "favoriteOnly", required = false) Boolean favoriteOnly,
            Model model) {

        List<BoardVO> list;

        if (favoriteOnly != null && favoriteOnly) {
            list = boardMapper.getFavoriteList(); // 즐겨찾기 쿼리
        } else if (book != null && !book.isEmpty()) {
            list = boardMapper.getListByBook(book); // 책별 필터 쿼리
        } else {
            list = boardMapper.getList(); // 전체 리스트
        }

        model.addAttribute("list", list);
        return "board/list";
    }

    @Autowired
    private RandomBible randomBible;

    // Page 1: 메인 뽑기 화면
    @GetMapping(value = "/main", produces = "text/plain;charset=UTF-8")
    public String mainPage() {
       return "board/main";
    }

    @GetMapping("/result")
    public String resultPage(@RequestParam("type") String type, Model model) {
        int ch, v;
        java.util.Calendar cal = java.util.Calendar.getInstance();
        if ("date".equals(type)) {
            ch = cal.get(java.util.Calendar.MONTH) + 1;
            v = cal.get(java.util.Calendar.DAY_OF_MONTH);
        } else {
            ch = cal.get(java.util.Calendar.HOUR_OF_DAY);
            v = cal.get(java.util.Calendar.MINUTE);
        }

        // VO 객체로 받기
        BoardVO bibleVO = randomBible.findVerseVO(ch, v);

        model.addAttribute("bible", bibleVO); // bible이라는 이름으로 객체 전달
        return "board/result";
    }

    @PostMapping("/write")
    public String write(BoardVO board) {
        // LocalDate는 DB에서 sysdate 등으로 처리하지 않을 경우 여기서 설정
        board.setAdded_at(java.time.LocalDate.now());
        boardMapper.insert(board);
        return "redirect:/board/list";
    }

    @GetMapping("/toggleFavorite")
    public String toggleFavorite(@RequestParam("id") int id) {
        // 1. 기존 데이터를 가져옴
        BoardVO board = boardMapper.get(id);

        // 2. 상태를 반전시킴 (!true = false, !false = true)
        board.setFavorite(!board.isFavorite());

        // 3. 업데이트 수행
        boardMapper.update(board);

        return "redirect:/board/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam int id) {
        boardMapper.delete(id);
        return "redirect:/board/list";
    }
}
