$(document).ready(function() {
  $('#add-item-button').click(function() {
    $('#popup').show();
    $('#popup').css('opacity', '1');
  })
  
  $('.close').click(function() {
    $('#popup').hide();
    $('#popup').css('opacity', '0');
  })
  
  $(document.body).on('change', '#item_category', function() {
    var option = $(this).val()
    
    function showOption(value) {
      $('.status-select').children('option[value="' + value + '"]').show();
    }
    
    switch(option) {
      case 'Book':
      case 'Article':
        $('.status-select').children().hide();
        showOption('To Read');
        showOption('Read');
        break;
      case 'Movie':
      case 'TV Show':
      case 'Video':
      case 'Documentary':
        $('.status-select').children().hide();
        showOption('To Watch');
        showOption('Watched');
        break;
      case 'Game':
        $('.status-select').children().hide();
        showOption('To Play');
        showOption('Played');
        break;
      case 'Song':
        $('.status-select').children().hide();
        showOption('To Listen');
        showOption('Listened');
        break;
      default:
        $('.status-select').children().show();
    }
    
    $('.status').show();
  })
  
  $('#add-item-next').click(function() {
    $('.required-fields').hide();
    $('.optional-fields').show();
  })
})