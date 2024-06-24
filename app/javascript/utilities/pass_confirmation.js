document.addEventListener('turbolinks:load', function() {
  let password = document.querySelector('#password input');
  let passwordConfirmation = document.querySelector('#password_confirmation input');
  
  if (password && passwordConfirmation) {
    password.addEventListener('input', validatePassword);
    passwordConfirmation.addEventListener('input', validatePassword);
  }

  function validatePassword() {
    let icon = document.querySelector('#password_confirmation .icon');
    if (!icon) {
      icon = document.createElement('span');
      icon.classList.add('icon');
      document.querySelector('#password_confirmation').appendChild(icon);
    }

    if (passwordConfirmation.value === '') {
      icon.textContent = '';
    } else if (password.value === passwordConfirmation.value) {
      icon.textContent = '✓';
      icon.style.color = 'green';
    } else {
      icon.textContent = '✗';
      icon.style.color = 'red';
    }
  }
});
