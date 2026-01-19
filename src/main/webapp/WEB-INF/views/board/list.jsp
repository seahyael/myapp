<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>내 성경구절 목록</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        table { border-collapse: collapse; width: 90%; margin: 20px auto; }
        th, td { padding: 12px 8px; border: 1px solid #eee; text-align: center; }
        th { background-color: #f9fafb; font-weight: bold; color: #374151; }
        .favorite-btn { cursor: pointer; font-size: 1.2em; text-decoration: none; }
        .favorite-star { color: #fbbf24; } /* 노란색 별 */
        .empty-star { color: #d1d5db; }    /* 회색 별 */
    </style>
</head>
<body class="bg-gray-50 p-6">
<h2 class="text-2xl font-bold text-center my-8 text-gray-800">내 성경구절 목록</h2>

<table class="bg-white shadow-sm rounded-lg overflow-hidden">
    <thead>
    <tr>
        <th>책</th>
        <th>장</th>
        <th>절</th>
        <th style="width: 40%;">구절</th>
        <th>즐겨찾기</th>
        <th>추가된 시간</th>
        <th>관리</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="board" items="${list}">
        <tr class="hover:bg-gray-50">
            <td class="font-bold text-blue-600">
                <a href="view?id=${board.id}"><c:out value="${board.book}" /></a>
            </td>

            <td><c:out value="${board.chapter}" /></td>
            <td><c:out value="${board.verse}" /></td>

            <td style="text-align: left;"><c:out value="${board.text}" /></td>

            <td>
                <a href="toggleFavorite?id=${board.id}" class="favorite-btn">
                    <c:choose>
                        <c:when test="${board.favorite}">
                            <span class="favorite-star">★</span>
                        </c:when>
                        <c:otherwise>
                            <span class="empty-star">☆</span>
                        </c:otherwise>
                    </c:choose>
                </a>
            </td>

            <td><c:out value="${board.added_at}" /></td>

            <td>
                <button onclick="if(confirm('이 구절을 삭제하시겠습니까?')) location.href='delete?id=${board.id}';"
                        class="text-red-500 hover:underline text-sm">
                    삭제
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div style="text-align: center; margin-top: 30px;">
    <a href="main" class="px-6 py-2 bg-blue-500 text-white rounded-md font-bold hover:bg-blue-600">뽑기 페이지로 이동</a>
</div>
</body>
</html>