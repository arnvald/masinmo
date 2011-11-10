#root = exports ? this
#
#class root.Offers
#  
#  SELECTORS = 
#    container: "#offers"
#
#  PATHS =
#    index: "/offers"
#    edit: "/offers/offer_id/edit"
#
#  constructor: ->
#    @offers = request()
#
#  draw: ->
#    for offer in @offers
#      offerElement = createElement offer
#      drawSingle offer, offerElement
#
#  request = ->
#    result = $.ajax 
#      url : PATHS.index
#      dataType: "json"
#      async: false
#
#    $.parseJSON result.responseText
#
#  createElement = (offer) ->
#    $("<div />", id: "offer-" + offer.id)
#
#  drawSingle = (offer, offerElement) =>
#    $span = $("<span />")
#    $span.append(offer.summary)
#    offerElement.append($span)
#    $(SELECTORS.container).append offerElement


$(document).ready ->
  $('#tabslinks a').click ->
    $('.tab').addClass "hidden" 
    current = $(this).attr "href"
    $(current).removeClass "hidden"
    return
