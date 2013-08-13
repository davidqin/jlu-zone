$ ->
    get_template = ->
        $("#print_form .template").clone()

    button = $("#print_form #add_button")

    button.click ->
        template = get_template().removeClass('hide').removeClass('template')
        print_item_index = new RegExp("new_print_item_index", "g")

        timeStamp = new Date().getTime()
        index = "#{timeStamp}"

        template.html(template.html().replace(print_item_index, index))
        $('#print_items').append(template)

    $('#add_print_item').live 'ajax:success', (evt, data, status, xhr) ->
        $('#print_items').append(xhr.responseText)

    $('#add_print_item').live 'ajax:error', (evt, xhr, status, error) ->
        alert "error"

    $('#delete_print_item').live 'ajax:success', (evt, data, status, xhr) ->
        $(this).parents('.print_item').remove()

    $('#delete_print_item').live 'ajax:error', (evt, xhr, status, error) ->
        alert "error"

    $('.print_format_edit form').live 'ajax:success', (evt, data, status, xhr) ->
        $(this).parents('.print_item').find('.print_format_show span').html(data.format)
        $(this).parents('.print_item').find('.print_format_edit').hide()
        $(this).parents('.print_item').find('.print_format_show').show()

    $('.print_format_edit form').live 'ajax:error', (evt, xhr, status, error) ->
        alert "error"

    $('.edit_print_format').live 'click', (event) ->
        event.preventDefault()
        $(this).parents('.print_item').find('.print_format_edit').show()
        $(this).parents('.print_item').find('.print_format_show').hide()

    $('.print_format_edit .cancel_edit').live 'click', (event) ->
        event.preventDefault()
        $(this).parents('.print_item').find('.print_format_edit').hide()
        $(this).parents('.print_item').find('.print_format_show').show()


