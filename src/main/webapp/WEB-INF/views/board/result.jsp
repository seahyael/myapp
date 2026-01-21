<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>오늘의 말씀 - 결과</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <style>
        .page-container {
            border: 2px solid #ffcfcf;
            border-radius: 1.5rem;
            overflow: hidden;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }
        /* 중앙 말씀 영역 그라데이션 및 테두리 */
        .section-middle {
            min-height: 350px;
            border-top: 2px solid #a7f3d0;
            border-bottom: 2px solid #a7f3d0;
            background: linear-gradient(to bottom, #ffffff, #f0fdf4);
        }
        .verse-text {
            word-break: keep-all; /* 단어 단위 줄바꿈으로 가독성 향상 */
        }
    </style>
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen p-4">

<div id="page2" class="page-container bg-white flex flex-col max-w-4xl w-full">

    <div class="flex justify-between items-center px-8 h-20 border-b border-gray-100 bg-white">
        <div class="flex items-center">
            <a href="main">
                <img src="${pageContext.request.contextPath}/resources/img/logo.png"
                     alt="로고"
                     class="h-10 md:h-12 w-auto object-contain">
            </a>
        </div>
        <div class="text-right">
            <h1 class="text-lg md:text-xl font-extrabold text-gray-800 tracking-tight">
                오늘의 <span class="text-blue-600">성경말씀</span>
            </h1>
        </div>
    </div>

    <div class="section-middle p-8 md:p-12 flex flex-col justify-center items-center relative">
        <div class="text-xl md:text-3xl font-serif text-center leading-relaxed text-gray-800 verse-text">
            <span class="text-4xl text-blue-200 font-serif">"</span>
            ${bible.text}
            <span class="text-4xl text-blue-200 font-serif">"</span>
        </div>

        <div class="mt-8 flex items-center gap-2">
            <span class="h-px w-8 bg-blue-200"></span>
            <div class="text-lg md:text-xl font-bold text-blue-600 bg-blue-50 px-4 py-1 rounded-full">
                ${bible.book} ${bible.chapter}:${bible.verse}
            </div>
            <span class="h-px w-8 bg-blue-200"></span>
        </div>
    </div>

    <div class="h-28 flex justify-center items-center gap-4 bg-white px-6">
        <form action="write" method="post" class="flex-1 max-w-[200px]">
            <input type="hidden" name="book" value="${bible.book}" />
            <input type="hidden" name="chapter" value="${bible.chapter}" />
            <input type="hidden" name="verse" value="${bible.verse}" />
            <input type="hidden" name="text" value="${bible.text}" />

            <button type="submit" class="w-full py-4 bg-blue-500 text-white font-bold rounded-2xl hover:bg-blue-600 shadow-md transition-all">
                내 리스트에 추가
            </button>
        </form>

        <button onclick="location.href='main'"
                class="flex-1 max-w-[200px] py-4 border-2 border-gray-200 text-gray-500 font-bold rounded-2xl hover:bg-gray-50 transition-all">
            다시 뽑기
        </button>
    </div>
</div>

</body>
</html>