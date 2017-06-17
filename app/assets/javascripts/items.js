$(document).ready(function() {
  $('.select-submit').change(function() {
    $(this).closest('form').submit();
  })
})