$(document).ready ->
  $('#q_country_eq').change ->
    $.getJSON "/search/regions?country=#{$("#q_country_eq").val()}", (data) ->
      fulfil_select("#q_region_eq", data)

    $.getJSON "/search/cities?country=#{$("#q_country_eq").val()}", (data) ->
      fulfil_select("#q_city_cont", data)

  $('#q_region_eq').change ->
    $.getJSON "/search/cities?region=#{$("#q_region_eq").val()}", (data) ->
      fulfil_select("#q_city_cont", data)

fulfil_select = (name, data) ->
  $(name).html "<option value=''></option>"
  $.each data, (key, val) ->
    item = $("<option value='#{val}'>#{val}</option>")
    item.appendTo $(name)
