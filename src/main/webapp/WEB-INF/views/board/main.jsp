<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 p-8">
<h1 class="text-3xl font-bold mb-4 text-blue-600">오늘의 성경 구절</h1>

<div class="flex gap-4 mb-4">
    <button id="btnDate" class="px-4 py-2 bg-blue-500 text-white rounded">오늘 날짜 구절</button>
    <button id="btnTime" class="px-4 py-2 bg-blue-500 text-white rounded">현재 시간 구절</button>
</div>

<div id="resultContainer">
    <p id="verseDisplay" class="text-xl font-semibold text-gray-800"></p>
</div>

<script>
    const display = document.getElementById('verseDisplay');
    const btnDate = document.getElementById('btnDate');
    const btnTime = document.getElementById('btnTime');

    async function fetchVerseFromServer(ch, v) {
        display.innerText = "말씀을 가져오는 중...";

        // 1. 현재 주소창의 경로를 기반으로 API 주소를 생성 (가장 안전함)
        // 만약 접속 주소가 http://localhost:8080/board/main 이라면
        // /board/api/bible 로 요청을 보냅니다.
        const url = "api/bible?chapter=" + ch + "&verse=" + v;

        console.log("요청 시도 URL:", url);

        try {
            const response = await fetch(url);

            if (!response.ok) {
                // 404 에러가 나면 여기서 잡힙니다.
                throw new Error("서버 응답 오류 (상태코드: " + response.status + ")");
            }

            const result = await response.text();
            display.innerText = result;
        } catch (error) {
            console.error("에러 발생:", error);
            display.innerText = "에러: " + error.message + " (콘솔 확인 필요)";
        }
    }

    btnDate.addEventListener('click', () => {
        const today = new Date();
        fetchVerseFromServer(today.getMonth() + 1, today.getDate());
    });

    btnTime.addEventListener('click', () => {
        const now = new Date();
        fetchVerseFromServer(now.getHours(), now.getMinutes());
    });
</script>
</body>
</html>