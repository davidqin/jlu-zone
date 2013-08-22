initialize_print_item_file_uploader = (form) ->
    # Initialize the jQuery File Upload widget:

    form.fileupload
        acceptFileTypes: /(\.|\/)(ods|doc|pdf|ppt|pptx|txt|exl|html)$/i
        maxFileSize: 10000000 # 10M
        autoUpload: true
        maxNumberOfFiles: 5

    # Load existing files:
    $.getJSON form.prop('action'), (files) ->
        fu = form.data('blueimpFileupload')

        fu._adjustMaxNumberOfFiles(-files.length)

        template = fu._renderDownload(files).appendTo(form.find('.files'))

        # Force reflow:
        fu._reflow = fu._transition && template.length && template[0].offsetWidth
        template.addClass('in')
        $('#loading').remove()
$ ->
    # 初始化 /prints/123 中已有items的uploader

    $('.fileupload').each (i, element) ->
        initialize_print_item_file_uploader($(element))

    $('#add_print_item').live 'ajax:success', (evt, data, status, xhr) ->
        print_item = $(data)
        initialize_print_item_file_uploader(print_item.find('.fileupload'))
        $('#print_items').append(print_item)

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
