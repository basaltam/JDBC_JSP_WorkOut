let typedText = document.querySelector(".typed-text");
let cursor = document.querySelector(".cursor");

let textArray = ["오운완",
    "당신의", "운동 일지", "오당운!"]

let typingDelay = 200; //타이핑 딜레이
let erasingDelay = 100; // 지우기 딜레이
let newTextDelay = 1000; //현텍스트 다음 텍스트 사이의 딜레이


let textArrayIndex = 0;//현재 텍스트 배열 인덱스
let charIndex =  0; //지우기 중인, 현재 텍스트 인덱스

//타이핑 효과 함수
function type() {
    // 현재 타이핑 중인 텍스트의 인덱스가 해당 텍스트의 길이보다 작은 경우
    if (charIndex < textArray[textArrayIndex].length) {
        // 커서가 타이핑 중인 상태가 아니면 "typing" 클래스를 추가하여 깜빡임 효과를 적용합니다.
        if(!cursor.classList.contains(".typing"))cursor.classList.add(".typing");

        // 타이핑 중인 텍스트를 한 글자씩 출력합니다.
        typedText.textContent += textArray[textArrayIndex][charIndex];
        charIndex++; // 다음 글자 인덱스로 이동
        setTimeout(type, typingDelay); // 일정 딜레이 후 다음 글자 타이핑
    } else {
        // 타이핑이 완료된 경우 "typing" 클래스를 제거하여 커서 깜빡임 효과를 중지합니다.
        cursor.classList.remove("typing");
        setTimeout(erase, newTextDelay); // newTextDelay 시간 후 지우기 효과 시작
    }
}

function erase() {
    // 현재 지우기 중인 텍스트의 인덱스가 0보다 큰 경우
    if (charIndex > 0) {
        // 커서가 타이핑 중인 상태가 아니면 "typing" 클래스를 추가하여 깜빡임 효과를 적용합니다.
        if (!cursor.classList.contains("typing")) cursor.classList.add("typing");

        // 타이핑 중인 텍스트를 한 글자씩 지웁니다.
        typedText.textContent = textArray[textArrayIndex].substring(0, charIndex - 1);
        charIndex--; // 이전 글자 인덱스로 이동
        setTimeout(erase, erasingDelay); // 일정 딜레이 후 다음 글자 지우기
    } else {
        // 지우기가 완료된 경우 "typing" 클래스를 제거하여 커서 깜빡임 효과를 중지합니다.
        cursor.classList.remove("typing");

        // 다음 텍스트 배열의 인덱스로 이동하고, 배열 범위를 벗어나면 다시 처음으로 돌아갑니다.
        textArrayIndex = (textArrayIndex + 1) % textArray.length;

        // 일정 딜레이 후 다음 타이핑 효과를 시작합니다.
        setTimeout(type, typingDelay + 1100);
    }
}

// 페이지가 로드되면 (DOMContentLoaded 이벤트 발생 시), 텍스트 타이핑 효과를 시작합니다.
document.addEventListener("DOMContentLoaded", function () {
    setTimeout(type, newTextDelay + 250);
});