<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입 - My Library</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .page-container { border: 2px solid #ffcfcf; border-radius: 1.5rem; }
    </style>
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen p-4">

<div class="max-w-md w-full page-container bg-white shadow-lg p-8">
    <div class="mb-8">
        <h1 class="text-2xl font-extrabold text-gray-800 uppercase text-center">Join <span class="text-blue-600">Us</span></h1>
        <p class="text-gray-400 text-sm mt-2 font-medium text-center">새로운 시작을 함께하세요.</p>
    </div>

    <form action="${pageContext.request.contextPath}/board/register" method="post" class="space-y-5">
        <div>
            <label class="block text-sm font-bold text-gray-600 mb-2">사용할 아이디</label>
            <input type="text" name="username" required placeholder="영문/숫자 조합"
                   class="w-full px-4 py-3 border border-gray-100 rounded-xl bg-gray-50 focus:outline-none focus:ring-2 focus:ring-blue-400 transition-all">
        </div>
        <div>
            <label class="block text-sm font-bold text-gray-600 mb-2">비밀번호</label>
            <input type="password" name="password" required
                   class="w-full px-4 py-3 border border-gray-100 rounded-xl bg-gray-50 focus:outline-none focus:ring-2 focus:ring-blue-400 transition-all">
        </div>
        <div>
            <label class="block text-sm font-bold text-gray-600 mb-2">역할 (Role)</label>
            <select name="role" class="w-full px-4 py-3 border border-gray-100 rounded-xl bg-gray-50 focus:outline-none focus:ring-2 focus:ring-blue-400 transition-all">
                <option value="USER">일반 사용자</option>
                <option value="ADMIN">관리자</option>
            </select>
        </div>

        <button type="submit"
                class="w-full py-4 bg-yellow-400 text-white rounded-2xl font-bold hover:bg-yellow-500 transition-all shadow-md mt-4">
            가입 완료
        </button>
    </form>

    <div class="mt-6 text-center">
        <a href="${pageContext.request.contextPath}/board/login" class="text-sm font-bold text-gray-400 hover:text-gray-600 transition-colors">
            이전으로 돌아가기
        </a>
    </div>
</div>

</body>
</html>