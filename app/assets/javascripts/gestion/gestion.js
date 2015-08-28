$(document).on('ready page:load', function () {
    if ($('#publicacion_categoria_id').val() != 17 ){
        $('#publicacion_serie, #publicacion_tipo_serie').prop('disabled', true);
    }

    $('#publicacion_categoria_id').on('change', function(){
       if($(this).val() == 17){
           $('#publicacion_serie, #publicacion_tipo_serie').prop('disabled', false);
       }else{
           $('#publicacion_serie, #publicacion_tipo_serie').prop('disabled', true);
       }
    });

    var model_id = $('#dropzone input').data('id');
    console.log(model_id);
    var controller_name = $('#dropzone input').data('controller');

    $('#dropzone').dropzone({
        url: '/library_upload/' + model_id + '/' + controller_name,
        paramName: 'archivo',
        maxFilesize: 10,
        uploadMultiple: false,
        acceptedFiles: '.jpg, .jpeg, .png, .gif',
        headers: {'X-CSRF-Token': $('head meta[name=csrf-token]').attr('content')},
        addRemoveLinks: true,
        dictDefaultMessage: 'Arrastre las imágenes hasta aquí o pulse para buscarlas',
        dictFallbackMessage: '',
        dictFallbackText: null,
        dictInvalidFileType: 'Archivo no válido. Las extensiones aceptadas son: .jpg, .jpeg, .png, .gif, .pdf, .doc, .docs, .odt, .xls, .xlsx, .csv y .txt ',
        dictFileTooBig: 'Archivo demasiado grande. El tamaño máximo es 10MB',
        dictResponseError: 'Error subiendo el archivo',
        dictRemoveFile: 'x',
        dictMaxFilesExceeded: 'El número máximo de archivos permitido es 10',
        init: function () {
            thisDropzone = this;

            thisDropzone.on("addedfile", function (file) {
                if (!file.type.match(/image.*/)) {
                    thisDropzone.emit('thumbnail', file, '/assets/libreria/archivo.png');
                }
            });

            // Procesa la subida del fichero
            $.get('/library_uploaded_files/' + model_id + '/' + controller_name, function (response) {
                $.each(response, function (key, value) {
                    var file = {name: value.name, size: value.size};

                    thisDropzone.options.addedfile.call(thisDropzone, file);
                    thisDropzone.options.thumbnail.call(thisDropzone, file, value.thumbnail);

                    file._removeLink.innerHTML = '<i class="fa fa-remove text-white"></i>';
                    file._removeLink.setAttribute('data-model-id', value.file_id);
                    file._removeLink.setAttribute('data-modelo', value.file_model);

                    file.previewElement.appendChild(Dropzone.createElement('<a class="dz-download fancybox btn btn-xs btn-success" href="' + value.path + '"><i class="fa fa-cloud-download text-white"></i></a>'));

                    file.previewElement.setAttribute('data-id', value.file_id);
                    file.previewElement.classList.add('dz-uploaded');
                    file.previewElement.querySelector('.dz-details').appendChild(Dropzone.createElement('<div class="overlay"></div><span class="fa fa-arrows"></span>'));

                    // Esto es necesario para que se inicialice bien el plugin y contabilice los elementos añadidos
                    thisDropzone.files.push(file);
                });
            });

            // Procesa la respuesta de la subida para meter al botón el id y el modelo y que funcione el botón de borrar
            thisDropzone.on('success', function (file, response) {
                file._removeLink.setAttribute('data-model-id', response.file_id);
                file._removeLink.setAttribute('data-modelo', response.file_model);
                file.previewElement.setAttribute('data-id', response.file_id);
                file.previewElement.classList.add("dz-success");
                file.previewElement.querySelector(".progress-bar").classList.add("progress-bar-success");
            });

            // Procesa el borrado del fichero
            thisDropzone.on('removedfile', function (file) {
                var file_id = file.previewTemplate.querySelector('.dz-remove').getAttribute('data-model-id');
                var file_modelo = file.previewTemplate.querySelector('.dz-remove').getAttribute('data-modelo');
                $.ajax({
                    type: 'DELETE',
                    url: '/library_destroy/' + file_id + '/' + file_modelo
                });
            });
        }
    });

    $('#dropzone').sortable({
        items: 'div.dz-image-preview:not(.dz-error)',
        cancel: 'div.dz-image-preview.dz-error',
        update: function (event, ui) {
            $.ajax({
                type: 'POST',
                url: '/library_sort/' + model_id + '/' + controller_name,
                data: 'ficheros=' + $('#dropzone').sortable('toArray', {attribute: 'data-id'})
            });
        }
    });

    $('#dropzone').popover({
        selector: '.glyphicon-warning-sign',
        trigger: 'hover',
        title: 'Error subiendo el archivo',
        placement: 'top',
        content: function () {
            return $(this).closest('.dz-details').find('.dz-error-message').text();
        },
        container: 'body'
    });
});