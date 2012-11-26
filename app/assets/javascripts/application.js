// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-fileupload

var fileUploadErrors = {
    maxFileSize:'File is too big',
    minFileSize:'File is too small',
    acceptFileTypes:'File type not allowed',
    maxNumberOfFiles:'Max number of files exceeded',
    uploadedBytes:'Uploaded bytes exceed file size',
    emptyResult:'Empty file upload result'
};

function initializeUploaderWithFiles(show_download, file_types) {
    var accept_exp = new RegExp("(\.|\/)(" + file_types + ")$", "i");

    $('#fileupload').fileupload();
    $('#fileupload').fileupload('option', {
        maxFileSize:5000000,
        acceptFileTypes:accept_exp,
        process:[
            {
                action:'load',
                maxFileSize:20000000 // 20MB
            },
            {
                action:'save'
            }
        ]
    });

    // Load existing files:
    $.getJSON($('#fileupload').prop('action'), function (files) {
        var fu = $('#fileupload').data('fileupload'), template;
        fu._adjustMaxNumberOfFiles(-files.length);
        if (show_download == true)
            template = fu._renderDownload(files).appendTo($('#fileupload .files'));
        // Force reflow:
        fu._reflow = fu._transition && template.length && template[0].offsetWidth;
        template.addClass('in');
        $('#loading').remove();
    });
}