document.addEventListener('DOMContentLoaded', () => {
    const timeLeftElement = document.getElementById('time-left');
    const timeoutUrl = timeLeftElement.getAttribute('data-timeout-url');
    let timeLeft = parseInt(timeLeftElement.textContent, 10);

    function formatTime(seconds) {
        const minutes = Math.floor(seconds / 60);
        const secs = seconds % 60;
        return `${String(minutes).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
    }

    if (timeLeft > 0) {
        const timerInterval = setInterval(() => {
            timeLeft -= 1;
            timeLeftElement.textContent = formatTime(timeLeft);

            if (timeLeft <= 0) {
                clearInterval(timerInterval);
                window.location.href = timeoutUrl;
            }
        }, 1000);
    }
});