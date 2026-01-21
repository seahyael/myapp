<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 성경구절 목록</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <style>
        .page-container { border: 2px solid #ffcfcf; border-radius: 1.5rem; overflow: hidden; }
        .table-header { background-color: #f0fdf4; border-bottom: 2px solid #a7f3d0; }
    </style>
</head>
<body class="bg-gray-50 flex flex-col items-center p-4 md:p-10">

<div class="max-w-6xl w-full page-container bg-white shadow-lg flex flex-col">

    <div class="flex justify-between items-center px-8 h-20 border-b border-gray-100">
        <div class="flex items-center">
            <a href="main">
                <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고" class="h-10 md:h-12 w-auto">
            </a>
        </div>
        <div class="text-right">
            <h1 class="text-lg md:text-xl font-extrabold text-gray-800 uppercase">My <span class="text-blue-600">Library</span></h1>
        </div>
    </div>

    <div class="p-6 bg-gray-50 flex flex-wrap gap-3 items-center justify-between border-b border-gray-100">
        <div class="flex gap-2">
            <a href="list" class="px-4 py-2 bg-white border border-gray-200 rounded-full text-sm font-bold text-gray-600 hover:bg-gray-100 transition-all">전체보기</a>
            <a href="list?favoriteOnly=true" class="px-4 py-2 bg-yellow-400 text-white rounded-full text-sm font-bold shadow-sm hover:bg-yellow-500 transition-all">★ 즐겨찾기만</a>
        </div>
        <div class="text-sm text-gray-400 font-medium">
            책 이름을 누르면 해당 구절만 모아볼 수 있습니다.
        </div>
    </div>

    <div class="overflow-x-auto">
        <table class="w-full border-collapse">
            <thead>
            <tr class="table-header">
                <th class="p-4 text-sm font-bold text-gray-700">책</th>
                <th class="p-4 text-sm font-bold text-gray-700">장:절</th>
                <th class="p-4 text-sm font-bold text-gray-700 text-left" style="width: 45%;">말씀</th>
                <th class="p-4 text-sm font-bold text-gray-700">즐겨찾기</th>
                <th class="p-4 text-sm font-bold text-gray-700">저장일</th>
                <th class="p-4 text-sm font-bold text-gray-700">관리</th>
            </tr>
            </thead>
            <tbody class="divide-y divide-gray-100">
            <c:forEach var="board" items="${list}">
                <tr class="hover:bg-blue-50/50 transition-colors">
                    <td class="p-4 text-center">
                        <a href="list?book=${board.book}" class="text-blue-600 font-extrabold hover:underline">
                            <c:out value="${board.book}" />
                        </a>
                    </td>
                    <td class="p-4 text-center text-gray-500 font-medium">
                            ${board.chapter}:${board.verse}
                    </td>
                    <td class="p-4 text-gray-800 leading-relaxed text-sm italic">
                        "<c:out value="${board.text}" />"
                    </td>
                    <td class="p-4 text-center">
                        <a href="javascript:toggleFavorite(${board.id})" class="text-2xl transition-transform hover:scale-125 inline-block">
                            <c:choose>
                                <c:when test="${board.favorite}">
                                    <span class="text-yellow-400">★</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-200 hover:text-gray-300">☆</span>
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </td>
                    <td class="p-4 text-center text-xs text-gray-400">
                            <%-- added_at이 "2026-01-19" 형태일 때 에러 방지 처리 --%>
                        <fmt:parseDate value="${board.added_at}" pattern="yyyy-MM-dd" var="pDate" />
                        <fmt:formatDate value="${pDate}" pattern="yy.MM.dd" />
                    </td>
                    <td class="p-4 text-center">
                        <button onclick="confirmDelete(${board.id})" class="px-3 py-1 text-xs font-bold text-red-400 border border-red-100 rounded-md hover:bg-red-500 hover:text-white transition-all">
                            삭제
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="mt-8 flex gap-4">
    <a href="main" class="px-8 py-3 bg-white border-2 border-blue-400 text-blue-500 rounded-2xl font-bold hover:bg-blue-50 transition-all shadow-sm">
        말씀 뽑으러 가기
    </a>
</div>

</body>
</html>