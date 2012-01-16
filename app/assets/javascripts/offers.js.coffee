$(document).ready ->
  $('#tabslinks a').click ->
    $('.tab').addClass "hidden" 
    current = $(this).attr "href"
    $(current).removeClass "hidden"
    return

  $('.subscribe_offer').click ->
    offer_id = $(this).attr("id").match(/\d+/)
    $.post("/offers/#{offer_id}/subscribe")
