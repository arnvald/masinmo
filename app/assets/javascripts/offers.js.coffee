$(document).ready ->
  $('#tabslinks a').click ->
    $('.tab').addClass "hidden" 
    current = $(this).attr "href"
    $(current).removeClass "hidden"
    return
