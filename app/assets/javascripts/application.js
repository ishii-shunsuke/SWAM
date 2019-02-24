// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require cocoon

$(function() {
    $('#formTag input[type=radio]').change( function() {
        $('#formTag').attr('action', `/order/confirmation/${this.value}`);
    });
})

$(function(){
    $('.filled-btn').mouseover(function(){
        $(this).parents('#background-1980').animate({'opacity': '1'}, 150);
    });

    $('.filled-btn').mouseout(function(){
        $(this).parents('.toumei').css({'background': 'rgba(255,255,255,0.4)'});
    });
});

