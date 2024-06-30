document.addEventListener('turbolinks:load', function() {
  let number = document.querySelector('.question-number');
  let count = document.querySelector('.questions-count');

  if (number && count) {
    let questionNumber = number.dataset.progressBar;
    let questionsCount = count.dataset.progressBar;

    // creating the <progress></progress> element
    let progressBar = document.createElement('progress');
    progressBar.value = questionNumber;
    progressBar.max = questionsCount;

    // adding the progress bar to the form
    let addToForm = document.getElementById('test-progress');
    if (addToForm) {
      addToForm.appendChild(progressBar);
    }
  }
});
