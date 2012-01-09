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
    selectors += "<button data-index='#{ i }' class='scheme-button' id='scheme#{ i }-activate' type='button'>#{ if scheme.amount > 0 then scheme.amount else ''} #{ scheme.name }</button> " for scheme, i in ui.item.schemes
    $('#inline-scheme-chooser').html(selectors).show('slide')
    $('.scheme-button').click( () ->
      s = ui.item.schemes[$(this).data('index')] 
      $('#subscription_amount').val(s.amount).effect('highlight',750)
      $('#subscription_frequency').val(s.frequency).effect('highlight',750)

      offset = s.offset
      if offset is 0
        offset = switch s.frequency
          when "weekly"
            if new Date().getDay() is 0 then 7 
            else new Date().getDay() 
          when "yearly" 
            Math.ceil((new Date().getTime() - new Date(new Date().getFullYear(), 0, 1).getTime()) / (999 * 3600 * 24))
          else new Date().getDate()
        
      $('#subscription_offset').val(offset).effect('highlight',750)
    )
    false
  })