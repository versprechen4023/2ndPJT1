<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>모달 창 위치 설정 및 부모 창 클릭 닫기 예제</title>
    <style>
        .modal {
            display: none;
            position: absolute;
            background-color: #fff;
            border: 1px solid #000;
            padding: 10px;
            z-index: 1;
        }
    </style>
</head>
<body id = "closebutton">
    <h1>모달 창 위치 설정 및 외부 클릭 닫기 예제</h1>

    <!-- 클릭할 요소 -->
    <button id="openModalButton">모달 열기</button>
    <br>
    <br>
    <!-- <button id="closebutton">모달 닫기</button> -->

    <!-- 모달 다이얼로그 -->
    <div id="myModal" class="modal">
        <span id="closeModalButton" style="cursor: pointer;">닫기</span>
        <h2>모달 창</h2>
        <p>모달 내용이 여기에 표시됩니다.</p>
    </div>

    <script>
        const openModalButton = document.getElementById("openModalButton");
        const myModal = document.getElementById("myModal");
        const closeModalButton = document.getElementById("closeModalButton");
        const closebutton = document.getElementById("closebutton");

        openModalButton.addEventListener("click", function (e) {
            myModal.style.display = "block";

            const clickX = e.clientX;
            const clickY = e.clientY;

            myModal.style.left = clickX + "px";
            myModal.style.top = clickY + "px";
        });

        closeModalButton.addEventListener("click", function () {
            myModal.style.display = "none";
        });

        // 모달 외부를 클릭했을 때 모달 닫기
        window.addEventListener("click", function (e) {
            if (e.target === closebutton) {
                myModal.style.display = "none";
            }
        });
    </script>
</body>
</html>
    