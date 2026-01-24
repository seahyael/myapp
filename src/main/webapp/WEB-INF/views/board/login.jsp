<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 - My Library</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .page-container { border: 2px solid #ffcfcf; border-radius: 1.5rem; }
    </style>
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen p-4">

<div class="max-w-md w-full page-container bg-white shadow-lg p-8">
    <div class="text-center mb-8">
        <h1 class="text-2xl font-extrabold text-gray-800 uppercase">My <span class="text-blue-600">Library</span></h1>
        <p class="text-gray-400 text-sm mt-2 font-medium">서비스 이용을 위해 로그인해주세요.</p>
    </div>

    <form action="${pageContext.request.contextPath}/board/login" method="post" class="space-y-6">
        <div>
            <label class="block text-sm font-bold text-gray-600 mb-2">아이디</label>
            <input type="text" name="userId" required
                   class="w-full px-4 py-3 border border-gray-100 rounded-xl bg-gray-50 focus:outline-none focus:ring-2 focus:ring-blue-400 transition-all">
        </div>
        <div>
            <label class="block text-sm font-bold text-gray-600 mb-2">비밀번호</label>
            <input type="password" name="password" required
                   class="w-full px-4 py-3 border border-gray-100 rounded-xl bg-gray-50 focus:outline-none focus:ring-2 focus:ring-blue-400 transition-all">
        </div>

        <button type="submit"
                class="w-full py-4 bg-blue-500 text-white rounded-2xl font-bold hover:bg-blue-600 transition-all shadow-md">
            로그인하기
        </button>
    </form>

    <div class="mt-8 pt-6 border-t border-gray-100 text-center">
        <span class="text-sm text-gray-400">계정이 없으신가요?</span>
        <a href="${pageContext.request.contextPath}/board/register" class="ml-2 text-sm font-bold text-blue-500 hover:underline">회원가입</a>
    </div>
</div>

</body>
</html>