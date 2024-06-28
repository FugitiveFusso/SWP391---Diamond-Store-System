var steps = ["Purchased", "Verified", "Shipping", "Delivered"];

function updateProgressBar(status) {
    var progressBar = document.querySelector(".progress-bar");
    var progressBarBefore = document.querySelector(".progress-bar::before");
    var stepIndex = steps.indexOf(status) + 1;
    var percentage = ((stepIndex - 1) / (steps.length - 1)) * 100;

    if (stepIndex > 1) {
        progressBar.style.display = "block";
        document.documentElement.style.setProperty('--progress-width', percentage + '%');
    } else {
        progressBar.style.display = "block";
    }

    var stepElements = document.getElementsByClassName("step");
    for (var i = 0; i < stepElements.length; i++) {
        stepElements[i].classList.remove("step-active");
        if (i < stepIndex) {
            stepElements[i].classList.add("step-active");
        }
    }
}

window.onload = function () {
    // Initially set the progress bar based on the current status
    var statusElement = document.getElementById("status");
    var status = statusElement.innerHTML.trim();
    if (steps.includes(status)) {
        updateProgressBar(status);
    } else {
        console.log("Invalid status: " + status);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const steps = document.querySelectorAll('.step');
    const progressBar = document.querySelector('.progress-bar::before');

    function updateProgress(currentStep) {
        steps.forEach((step, index) => {
            if (index < currentStep) {
                step.classList.add('step-active');
            } else {
                step.classList.remove('step-active');
            }
        });
        const progressWidth = (currentStep / (steps.length - 1)) * 100;
        progressBar.style.width = `${progressWidth}%`;
    }

    // Example to update progress to step 2 (Verified)
    updateProgress(2);
});