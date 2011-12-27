$(document).ready ->
  $('#subscription_service').autocomplete({source: "/services.json", select: (event, ui) -> 
    alert(ui)
  })