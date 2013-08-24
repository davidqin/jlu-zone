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

window.fileUploadErrors =
    "maxFileSize": "文件不能超过10M",
    "minFileSize": "文件太小了",
    "Filetype not allowed": "无效文件类型",
    "Maximum number of files exceeded": "最多只能有5个文件",
    "uploadedBytes": "Uploaded bytes exceed file size",
    "emptyResult": "Empty file upload result"

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
        $(this).parents('.panel').remove()

    $('#delete_print_item').live 'ajax:error', (evt, xhr, status, error) ->
        alert "error"

    $('.print_format_edit form').live 'ajax:success', (evt, data, status, xhr) ->
        $(this).parents('.panel-heading').find('.print_format_show > span').html(data.format)
        $(this).parents('.panel-heading').find('.print_format_edit').hide()
        $(this).parents('.panel-heading').find('.print_format_show').show()

    $('.print_format_edit form').live 'ajax:error', (evt, xhr, status, error) ->
        alert "error"

    $('.edit_print_format').live 'click', (event) ->
        event.preventDefault()
        $(this).parents('.panel-heading').find('.print_format_edit').show()
        $(this).parents('.panel-heading').find('.print_format_show').hide()

    $('.print_format_edit .cancel_edit').live 'click', (event) ->
        event.preventDefault()
        $(this).parents('.panel-heading').find('.print_format_edit').hide()
        $(this).parents('.panel-heading').find('.print_format_show').show()

    $('#print_deadline').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        autoclose: true,
        todayHighlight: true,
        language: 'zh-CN',
        startDate: '+0d',
        endDate: '+5d'
    });

    $('.select-print-scope').live 'change', (event) ->
        if $(this).val() == "all"
            $(this).parents('.print_format_edit').find('.input-print-scope').attr('readonly', 'readonly')
            $(this).parents('.print_format_edit').find('.input-print-scope:eq(0)').val(1)
            $(this).parents('.print_format_edit').find('.input-print-scope:eq(1)').val(0)
        else if $(this).val() == "customizing"
            $(this).parents('.print_format_edit').find('.input-print-scope').removeAttr('readonly')
