$(document).ready ->
  $('#tabslinks a').click ->
    $('.tab').addClass "hidden" 
    current = $(this).attr "href"
    $(current).removeClass "hidden"
    return

  #TODO: refactor this shit
  $('#q_country_eq').change ->
    $.getJSON "/search/regions?country=#{$("#q_country_eq").val()}", (data) ->
      $("#q_region_eq").html "<option value=''></option>"
      $.each data, (key, region) ->
        item = $("<option value='#{region}'>#{region}</option>")
        item.appendTo $("#q_region_eq")

    $.getJSON "/search/cities?country=#{$("#q_country_eq").val()}", (data) ->
      $("#q_city_cont").html "<option value=''></option>"
      $.each data, (key, city) ->
        item = $("<option value='#{city}'>#{city}</option>")
        item.appendTo $("#q_city_cont")

  $('#q_region_eq').change ->
    $.getJSON "/search/cities?region=#{$("#q_region_eq").val()}", (data) ->
      $("#q_city_cont").html "<option value=''></option>"
      $.each data, (key, city) ->
        item = $("<option value='#{city}'>#{city}</option>")
        item.appendTo $("#q_city_cont")
