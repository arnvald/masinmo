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

  $('#choose_bathrooms').change ->
    MIN_GT_VAL = 3
    value = $('#choose_bathrooms option:selected').val()
    if value >= MIN_GT_VAL
      $('#q_bathrooms_eq').val('')
      $('#q_bathrooms_gteq').val(value)
    else
      $('#q_bathrooms_eq').val(value)
      $('#q_bathrooms_gteq').val('')

fulfil_select = (name, data) ->
  $(name).html "<option value=''></option>"
  $.each data, (key, val) ->
    item = $("<option value='#{val}'>#{val}</option>")
    item.appendTo $(name)
