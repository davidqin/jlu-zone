$ ->
    $('#new_reply').live 'ajax:success', (evt, data, status, xhr) ->
        $('#no-reply').hide()
        $(this).find('textarea').val('')
        $(xhr.responseText).hide().appendTo($('#replies')).fadeIn('slow')

    $('#new_reply').live 'ajax:error', (evt, xhr, status, error) ->
        alert "error"

    # 回复
    $('.reply .at').live 'click', (event) ->
      event.preventDefault()
      $textarea = $('#new_reply textarea');
      $textarea.focus().val($textarea.val() + '@' + $(this).data('user-name') + ' ' + '#' + $(this).data('reply-floor') + '楼 ')

    # 去某楼层
    $("a.at_floor").live 'click', (event) ->
      event.preventDefault()
      floor = $(this).data('reply-floor')
      $("#replies .reply").removeClass("light")
      $ ("#reply"+floor).addClass("light");

