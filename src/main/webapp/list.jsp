<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>내 성경구절 목록</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { padding: 8px 12px; border: 1px solid #ccc; }
        th { background-color: #f0f0f0; }
        a { text-decoration: none; color: #0366d6; }
    </style>
</head>
<body>
<h2 style="text-align: center;">내 성경구절 목록</h2>

<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>책</th>
        <th>장</th>
        <th>절</th>
        <th>구절</th>
        <th>즐겨찾기</th>
        <th>추가된 시간</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="board" items="${list}">
        <tr>
            <td><c:out value="${board.id}" /></td>
            <td>
                <a href="view?id=${board.id}">
                    <c:out value="${board.title}" />
                </a>
            </td>
            <td><c:out value="${board.writer}" />123</td>
            <td><fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div style="text-align: center; margin-top: 20px;">
    <a href="write">글쓰기</a>
</div>
</body>
</html>