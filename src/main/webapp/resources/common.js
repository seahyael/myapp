/**
 * 성경 구절 뽑기 공통 스크립트
 */
document.addEventListener('DOMContentLoaded', function() {

    // 1. 한국 표준시 시계 로직 (메인 페이지 전용)
    const clockElement = document.getElementById('currentDateTime');
    if (clockElement) {
        function updateClock() {
            const now = new Date();
            const utc = now.getTime() + (now.getTimezoneOffset() * 60000);
            const koreaTimeDiff = 9 * 60 * 60 * 1000;
            const korNow = new Date(utc + koreaTimeDiff);

            const year = korNow.getFullYear();
            const month = String(korNow.getMonth() + 1).padStart(2, '0');
            const date = String(korNow.getDate()).padStart(2, '0');
            const hours = String(korNow.getHours()).padStart(2, '0');
            const minutes = String(korNow.getMinutes()).padStart(2, '0');
            const seconds = String(korNow.getSeconds()).padStart(2, '0');

            // 디자인에 맞춘 포맷: YYYY.MM.DD HH:mm:ss
            clockElement.innerText = `${year}.${month}.${date} ${hours}:${minutes}:${seconds}`;
        }
        setInterval(updateClock, 1000);
        updateClock();
    }
});

/**
 * 구절 삭제 확인
 */
function confirmDelete(id) {
    if (confirm('말씀을 목록에서 삭제하시겠습니까?')) {
        location.href = 'delete?id=' + id;
    }
}

/**
 * 즐겨찾기 상태 변경
 */
function toggleFavorite(id) {
    location.href = 'toggleFavorite?id=' + id;
}