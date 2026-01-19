<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 성경 말씀 - 메인</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* 설계도 기반 공통 레이아웃 스타일 */
        .page-container { min-height: 450px; border: 2px solid #ffcfcf; border-radius: 12px; overflow: hidden; }
        .section-1-4 { height: 60px; display: flex; align-items: center; justify-content: space-between; padding: 0 20px; border-bottom: 1px solid #eee; }
        .section-2 { min-height: 250px; display: flex; flex-direction: column; justify-content: center; align-items: center; border-bottom: 2px solid #a7f3d0; border-top: 2px solid #a7f3d0; background-color: #fff; }
        .section-3 { height: 80px; display: flex; justify-content: center; align-items: center; gap: 15px; background-color: #fff; }
    </style>
</head>
<body class="bg-gray-50 p-4 md:p-10">

<div class="max-w-4xl mx-auto">
    <div id="page1" class="page-container bg-white shadow-sm flex flex-col">

        <div class="section-1-4 flex justify-between items-center px-6 h-[80px] border-b border-gray-100 bg-white">
            <div class="text-xl font-extrabold text-gray-800 tracking-tight">
                오늘의 <span class="text-blue-600">성경말씀</span>
            </div>
        </div>

        <div class="section-2 p-6 text-center">
            <div id="currentDateTime" class="text-2xl font-bold text-blue-500 mb-4">
            </div>
            <div class="relative inline-block">
                <span class="absolute inset-x-0 bottom-1 h-3 bg-yellow-200 opacity-70"></span>
                <h2 class="relative text-3xl font-extrabold text-gray-800">지금의 나에게 주시는 말씀</h2>
            </div>
        </div>

        <div class="section-3">
            <button onclick="location.href='result?type=date'"
                    class="px-8 py-3 border-2 border-blue-400 text-blue-600 font-bold rounded-xl hover:bg-blue-50 transition-all">
                날짜로 보기
            </button>
            <button onclick="location.href='result?type=time'"
                    class="px-8 py-3 border-2 border-blue-400 text-blue-600 font-bold rounded-xl hover:bg-blue-50 transition-all">
                시간으로 보기
            </button>
        </div>
    </div>
</div>

<script>
    // 실시간 시각 업데이트 로직
    function updateClock() {
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const date = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');

        document.getElementById('currentDateTime').innerText =
            `\${year}년 \${month}월 \${date}일 \${hours}시 \${minutes}분`;
    }
    setInterval(updateClock, 1000);
    updateClock();
</script>
</body>
</html>