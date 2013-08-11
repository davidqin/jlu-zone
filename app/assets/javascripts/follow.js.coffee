$ ->
    $('#follow_button').live 'ajax:success', (evt, data, status, xhr) ->
        $('#follow_button').hide()
        $('#unfollow_button').show()

    $('#unfollow_button').live 'ajax:success', (evt, data, status, xhr) ->
        $('#unfollow_button').hide()
        $('#follow_button').show()

    $('#follow_button').live 'ajax:error', (evt, xhr, status, error) ->
        alert "error"