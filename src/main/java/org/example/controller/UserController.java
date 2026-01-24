package org.example.controller;

import org.example.domain.UserVO; // 혹은 domain.User
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class UserController {

    @Autowired
    private UserService userService;

    // 로그인 페이지 이동
    @GetMapping("/login")
    public String loginForm() {
        return "board/login"; // WEB-INF/views/user/login.jsp
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(@RequestParam String userId,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        UserVO user = userService.login(userId, password);

        if (user != null) {
            session.setAttribute("loginUser", user); // 세션에 유저 정보 저장
            return "redirect:/"; // 메인 페이지로 이동
        } else {
            model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "board/login"; // 다시 로그인 페이지로
        }
    }

    // 회원가입 페이지 이동
    @GetMapping("/register")
    public String registerForm() {
        return "board/register"; // WEB-INF/views/user/register.jsp
    }

    // 회원가입 처리
    @PostMapping("/register")
    public String register(UserVO user) {
        userService.register(user);
        return "redirect:/board/login"; // 가입 후 로그인 페이지로 이동
    }

    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/";
    }
}