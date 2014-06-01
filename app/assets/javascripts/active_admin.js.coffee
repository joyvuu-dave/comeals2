#= require active_admin/base
#= require moment



$( ->
  # Add day of week to dates on Meal index page
  $('td.col-date').each( (index) ->
    if $(this).text()
      $(this).text(moment($(this).text()).format('ddd, MMM D YYYY'))
  )


  # Add day of week to dates on Bill index page
  $('td.col-meal').each( (index) ->
    if $(this).text()
      $(this).text(moment($(this).text()).format('ddd, MMM D YYYY'))
  )


  # Add day of week to options on Bill edit page
  $('#bill_meal_id option').each( (index) ->
    if $(this).text()
      $(this).text(moment($(this).text()).format('ddd, MMM D YYYY'))
  )



  # Bring name field into focus when adding a new unit
  if window.location.pathname == '/units/new'
    $('#unit_name').focus()


  # Bring name field into focus when adding a new resident
  if window.location.pathname == '/residents/new'
    $('#resident_name').focus()
)
