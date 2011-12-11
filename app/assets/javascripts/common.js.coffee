$(document).ready ->
  $('#q_country_eq').change ->
    $.getJSON "/search/regions?country=#{$("#q_country_eq").val()}", (data) ->
      fulfil_select("#q_region_eq", data)

    $.getJSON "/search/cities?country=#{$("#q_country_eq").val()}", (data) ->
      fulfil_select("#q_city_cont", data)

  $('#q_region_eq').change ->
    $.getJSON "/search/cities?region=#{$("#q_region_eq").val()}", (data) ->
      fulfil_select("#q_city_cont", data)

  $('#choose_price').change ->
    values = $('#choose_price option:selected').text().split('-')
    $("#q_price_gt").val(values[0])
    $("#q_price_lt").val(values[1])

fulfil_select = (name, data) ->
  $(name).html "<option value=''></option>"
  $.each data, (key, val) ->
    item = $("<option value='#{val}'>#{val}</option>")
    item.appendTo $(name)
