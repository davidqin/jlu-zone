$ ->
    JCROP_TARGET = $('#jcrop_target')
    JCROP_PREVIEW = $('#preview')
    INPUT = $('#avatar_file_input')

    WIDTH = 0
    HEIGHT = 0

    jcrop_api = undefined
    IMG_TAG = undefined

    INPUT.change ->
        file = this.files?[0]

        if not file
            return
        else
            cleanJcrop()

        reader = new FileReader()
        reader.onload = readerOnload

        reader.readAsDataURL(file)

    readerOnload = (e) ->
        image = new Image()
        image.src = e.target.result

        IMG_TAG = $('<img>')

        image.onload = ->
            JCROP_PREVIEW.attr('src', this.src)

            JCROP_TARGET.append(IMG_TAG)

            IMG_TAG.css(
                width: this.width,
                height: this.height
            ).attr('src', this.src)

            IMG_TAG.attr('src', this.src).Jcrop
                aspectRatio: 1,
                setSelect:   [ 100, 100, 200, 200 ],
                boxWidth: 400,
                boxHeight: 400,
                onChange: showPreview,
                onSelect: showPreview,
                ->
                    jcrop_api = @
                    window.jcrop_api = @

            WIDTH = IMG_TAG.width()
            HEIGHT = IMG_TAG.height()

    cleanJcrop = ->
        IMG_TAG?.remove?()
        jcrop_api?.destroy?()


    showPreview = (coords) ->
        rx = 100 / coords.w;
        ry = 100 / coords.h;

        JCROP_PREVIEW.css(
            width: Math.round(rx * WIDTH) + 'px',
            height: Math.round(ry * HEIGHT) + 'px',
            marginLeft: '-' + Math.round(rx * coords.x) + 'px',
            marginTop: '-' + Math.round(ry * coords.y) + 'px'
        )

        $('#x1').val(coords.x);
        $('#y1').val(coords.y);
        $('#x2').val(coords.x2);
        $('#y2').val(coords.y2);