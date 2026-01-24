<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<h1>메인 페이지</h1>

<c:choose>
    <c:when test="${not empty username}">
        <p>${username}님 (${role}) 환영합니다.</p>
        <a href="logout">로그아웃</a>
        <a href="list">게시판</a>
    </c:when>
    <c:otherwise>
        <a href="login">로그인</a>
        <a href="register">회원가입</a>
    </c:otherwise>
</c:choose>