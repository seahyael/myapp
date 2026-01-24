package org.example.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();

        if (session.getAttribute("loginUser") == null) {
            // 알림창을 띄우고 로그인 페이지로 이동시키는 스크립트 작성
            response.setContentType("text/html; charset=UTF-8");
            java.io.PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인 후 이용 가능합니다.');");
            out.println("location.href='" + request.getContextPath() + "/board/login';");
            out.println("</script>");
            out.flush();
            out.close();

            return false; // 컨트롤러로 요청이 가지 않도록 차단
        }
        return true; // 로그인 되어 있으면 통과
    }
}