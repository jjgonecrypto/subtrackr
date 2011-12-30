$(document).ready ->
  $('#subscription_service').autocomplete({source: ( request, response ) ->
    $.ajax({
      url: "/services.json?term=" + $('#subscription_service').val(),
      dataType: "json",
      success: ( data ) ->
        response( $.map( data, (item) ->
          item.label = item.name
          item  
        ))
    })
  ,
  select: (event, ui) ->
    selectors = "<strong>Schemes:</strong>"  
    selectors += "<button index='#{ i }' class='schemeButton' id='scheme#{ i }Activate' type='button'>#{ if scheme.amount > 0 then scheme.amount else ''} #{ scheme.name }</button> " for scheme, i in ui.item.schemes
    $('#inlineSchemeChooser').html(selectors).show('slide')
    $('.schemeButton').click( () ->
      s = ui.item.schemes[$(this).attr('index')] 
      $('#subscription_amount').val(s.amount).effect('highlight',750)
      $('#subscription_frequency').val(s.frequency).effect('highlight',750)
      $('#subscription_offset').val(if s.offset == 0 then new Date().getDate() else s.offset).effect('highlight',750)
    )
    false
  })