"use client";

import { useState } from "react";
import bibleJson from './bible.json';
const bibleData = bibleJson.verses || [];
import { Button } from "../components/ui/button";

console.log("bibleData:", bibleData);
console.log("Array.isArray(bibleData):", Array.isArray(bibleData));


export default function Main() {
  const [verse, setVerse] = useState("");
  const [loading, setLoading] = useState(false);

  // 특정 장/절에 해당하는 구절 찾기
  function findVerse(chapterNum, verseNum) {
    const chapterNumber = Number(chapterNum);
    const verseNumber = Number(verseNum);
    if (isNaN(chapterNumber) || isNaN(verseNumber)) return null;

    // 해당 장/절에 맞는 모든 구절
    const allCandidates = bibleData.filter(
      (v) => Number(v.chapter) === chapterNumber && Number(v.verse) === verseNumber
    );

    if (allCandidates.length === 0) return null;

    // 그 구절이 있는 책 중 하나를 랜덤으로 선택
    const randomBook = allCandidates[Math.floor(Math.random() * allCandidates.length)];

    return `${randomBook.book_name} ${randomBook.chapter}:${randomBook.verse} — ${randomBook.text}`;
  }

  // 날짜 기반 구절 (월 → chapter, 일 → verse)
  function getVerseByDate(month, day) {
    return findVerse(month, day) || "해당 구절 없음";
  }

  // 시간 기반 구절 (시 → chapter, 분 → verse)
  function getVerseByTime(hour, min) {
    return findVerse(hour, min) || "해당 구절 없음";
  }

  // 버튼 핸들러
  function handleDateVerse() {
    setLoading(true);
    setTimeout(() => {
      const today = new Date();
      setVerse(getVerseByDate(today.getMonth() + 1, today.getDate()));
      setLoading(false);
    }, 0);
  }

  function handleTimeVerse() {
    setLoading(true);
    setTimeout(() => {
      const now = new Date();
      setVerse(getVerseByTime(now.getHours(), now.getMinutes()));
      setLoading(false);
    }, 0);
  }

  return (
    <main className="p-8">
      <h1 className="text-3xl font-bold mb-4 text-blue-600">오늘의 성경 구절</h1>

      <div className="flex gap-4 mb-4">
        <Button onClick={handleDateVerse} disabled={loading}>
          오늘 날짜 구절
        </Button>
        <Button onClick={handleTimeVerse} disabled={loading}>
          현재 시간 구절
        </Button>
      </div>

      {loading ? (
        <p>불러오는 중…</p>
      ) : (
        verse && <p className="text-xl font-semibold text-gray-800">{verse}</p>
      )}
    </main>
  );
}
