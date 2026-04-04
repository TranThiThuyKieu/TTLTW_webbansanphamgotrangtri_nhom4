    function startCountdowns() {
    const cards = document.querySelectorAll('.sale-card[data-countdown]');

    cards.forEach(card => {
    const countdownDate = new Date(card.getAttribute('data-countdown')).getTime();
    const timerContainer = card.querySelector('.countdown-boxes');

    const x = setInterval(function() {
    const now = new Date().getTime();
    const distance = countdownDate - now;

    if (distance < 0) {
    clearInterval(x);
    timerContainer.innerHTML = "HẾT HẠN";
    return;
}

    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    let dayHtml = days > 0 ? `<span class="box">${days < 10 ? '0'+days : days}</span> : ` : "";

    timerContainer.innerHTML = dayHtml +
    `<span class="box">${hours < 10 ? '0'+hours : hours}</span> : ` +
    `<span class="box">${minutes < 10 ? '0'+minutes : minutes}</span> : ` +
    `<span class="box">${seconds < 10 ? '0'+seconds : seconds}</span>`;
}, 1000);
});
}

    document.addEventListener('DOMContentLoaded', startCountdowns);