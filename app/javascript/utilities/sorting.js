document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')

  control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
  var table = document.querySelector('table')

  var rows = table.querySelectorAll('tr')
  console.log(rows)
}