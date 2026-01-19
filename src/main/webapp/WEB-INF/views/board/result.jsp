<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .page-container { min-height: 450px; border: 2px solid #ffcfcf; border-radius: 12px; overflow: hidden; }
        .section-2 { min-height: 250px; display: flex; flex-direction: column; justify-content: center; align-items: center; border-top: 2px solid #a7f3d0; border-bottom: 2px solid #a7f3d0; }
        .section-3 { height: 80px; display: flex; justify-content: center; align-items: center; gap: 15px; }
    </style>
</head>
<body class="bg-gray-50 p-4 md:p-10">
<div id="page2" class="page-container bg-white flex flex-col max-w-5xl mx-auto shadow-lg">
    <div class="flex justify-between items-center border-b px-5 h-[60px]">
        <div class="text-xl font-extrabold text-gray-800 tracking-tight">
            오늘의 <span class="text-blue-600">성경말씀</span>
        </div>
    </div>

    <div class="section-2 p-8 relative">
        <div class="text-2xl font-serif text-center leading-relaxed text-gray-800">
            "${bible.text}" </div>
        <div class="mt-4 text-lg font-bold text-blue-600">
            ${bible.book} ${bible.chapter}:${bible.verse}
        </div>
    </div>

    <div class="section-3">
        <form action="write" method="post">
            <input type="hidden" name="book" value="${bible.book}" />
            <input type="hidden" name="chapter" value="${bible.chapter}" />
            <input type="hidden" name="verse" value="${bible.verse}" />
            <input type="hidden" name="text" value="${bible.text}" />

            <button type="submit" class="px-6 py-2 bg-blue-400 text-white rounded-md font-bold">
                내 리스트에 추가
            </button>
        </form>
        <button onclick="location.href='main'" class="px-6 py-2 border border-gray-300 rounded-md">다시 뽑기</button>
    </div>
</div>
</body>
</html>