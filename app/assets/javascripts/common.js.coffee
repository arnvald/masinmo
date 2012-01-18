$(document).ready ->
  $('#q_country_eq').change ->
    $.getJSON "/search/regions?country=#{$("#q_country_eq").val()}", (data) ->
      fulfil_select("#q_region_eq", data)

    $.getJSON "/search/cities?country=#{$("#q_country_eq").val()}", (data) ->
      fulfil_select("#q_city_cont", data)

  $('#q_region_eq').change ->
    $.getJSON "/search/cities?region=#{$("#q_region_eq").val()}", (data) ->
      fulfil_select("#q_city_cont", data)

  $('#q_kind_eq').change ->
    $.getJSON "search/price_ranges?kind=#{$("#q_kind_eq").val()}", (data) ->
      fulfil_select("#choose_price", data)

  $('#choose_price').change ->
    values = $('#choose_price option:selected').text().split('-')
    $("#q_price_gteq").val(values[0])
    $("#q_price_lteq").val(values[1])

  $('#choose_bathrooms').change ->
    MIN_GT_VAL = 4
    fulfil_rooms_select('bathrooms', MIN_GT_VAL)

  $('#choose_rooms').change ->
    MIN_GT_VAL = 5
    fulfil_rooms_select('rooms', MIN_GT_VAL)

fulfil_rooms_select = (kind, min_gt_val) ->
  value = $("#choose_#{kind} option:selected").val()
  if value.match(/[^0-9]/)
    $("#q_#{kind}_eq").val('')
    $("#q_#{kind}_gt").val(min_gt_val)
  else
    $("#q_#{kind}_eq").val(value)
    $("#q_#{kind}_gt").val('')

fulfil_select = (name, data) ->
  $(name).html "<option value=''></option>"
  $.each data, (key, val) ->
    item = $("<option value='#{val}'>#{val}</option>")
    item.appendTo $(name)
