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

});