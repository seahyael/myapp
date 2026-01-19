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
            <div class="text-sm text-gray-400 mb-1">KST (한국 표준시)</div>
            <div id="currentDateTime" class="text-2xl font-bold text-blue-500 mb-4"></div>
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
    function updateClock() {
        // 1. 현재 브라우저의 UTC 시간 구하기
        const now = new Date();
        const utc = now.getTime() + (now.getTimezoneOffset() * 60000);

        // 2. UTC 시간에 한국 시간(9시간 = 32400000ms) 더하기
        const koreaTimeDiff = 9 * 60 * 60 * 1000;
        const korNow = new Date(utc + koreaTimeDiff);

        // 3. 날짜 및 시간 데이터 추출
        const year = korNow.getFullYear();
        const month = String(korNow.getMonth() + 1).padStart(2, '0');
        const date = String(korNow.getDate()).padStart(2, '0');
        const hours = String(korNow.getHours()).padStart(2, '0');
        const minutes = String(korNow.getMinutes()).padStart(2, '0');
        const seconds = String(korNow.getSeconds()).padStart(2, '0');

        // 4. 화면 출력 (초까지 넣으면 더 생동감이 있습니다)
        document.getElementById('currentDateTime').innerText =
            `\${year}년 \${month}월 \${date}일 \${hours}시 \${minutes}분 \${seconds}초`;
    }

    // 1초마다 업데이트
    setInterval(updateClock, 1000);
    updateClock(); // 초기 실행
</script>
</body>
</html>