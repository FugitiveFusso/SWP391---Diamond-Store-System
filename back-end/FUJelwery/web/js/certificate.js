document.addEventListener('DOMContentLoaded', function () {
  var dropdownBtns = document.querySelectorAll('.dropdown-btn');

  dropdownBtns.forEach(function(btn) {
    var dropdownContent = btn.nextElementSibling;
    var arrowIcon = btn.querySelector('i');

    btn.addEventListener('click', function () {
      dropdownContent.classList.toggle('show');
      arrowIcon.classList.toggle('fa-angle-down');
      arrowIcon.classList.toggle('fa-angle-up');
    });
  });
});
