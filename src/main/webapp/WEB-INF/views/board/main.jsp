<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 성경 말씀</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="${pageContext.request.contextPath}/resources/common.js"></script>
    <style>
        /* 설계도 기반 포인트 컬러 및 미세 조정 */
        .page-container {
            border: 2px solid #ffcfcf;
            border-radius: 1.5rem;
            overflow: hidden;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }
        .section-middle {
            min-height: 300px;
            border-top: 2px solid #a7f3d0;
            border-bottom: 2px solid #a7f3d0;
            background: linear-gradient(to bottom, #ffffff, #f0fdf4);
        }
        .btn-custom {
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.2);
        }
    </style>
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen p-4">

<div class="max-w-4xl w-full">
    <div id="page1" class="page-container bg-white flex flex-col">

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
                <p class="text-[10px] text-gray-400 font-medium uppercase tracking-widest">Daily Bible Verse</p>
            </div>
        </div>

        <div class="section-middle p-8 text-center flex flex-col justify-center items-center">
            <div class="mb-6">
                <span class="bg-blue-50 text-blue-500 text-xs font-bold px-3 py-1 rounded-full uppercase tracking-wider mb-2 inline-block">
                    KST (한국 표준시)
                </span>
                <div id="currentDateTime" class="text-2xl md:text-3xl font-mono font-bold text-gray-700">
                </div>
            </div>

            <div class="relative group">
                <span class="absolute inset-x-0 bottom-1 h-4 bg-yellow-200 opacity-60 group-hover:h-6 transition-all"></span>
                <h2 class="relative text-2xl md:text-4xl font-black text-gray-900 leading-tight">
                    지금의 나에게 주시는 말씀
                </h2>
            </div>
        </div>

        <div class="h-28 flex justify-center items-center gap-4 bg-white px-6">
            <button onclick="location.href='result?type=date'"
                    class="btn-custom flex-1 max-w-[200px] py-4 border-2 border-blue-400 text-blue-600 font-bold rounded-2xl hover:bg-blue-50">
                날짜로 보기
            </button>
            <button onclick="location.href='result?type=time'"
                    class="btn-custom flex-1 max-w-[200px] py-4 bg-blue-500 border-2 border-blue-500 text-white font-bold rounded-2xl hover:bg-blue-600">
                시간으로 보기
            </button>
        </div>
    </div>

    <div class="mt-6 flex justify-center gap-6 text-sm text-gray-400 font-medium">
        <a href="list" class="hover:text-blue-500 transition-colors">내 리스트 보기</a>
    </div>
</div>