// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require moment/cs.js
//= require turbolinks
//= require_tree .
$(document).ready(function(){
    $("#sidebar-box button").click(function(){
        if( $("#sidebar-box").hasClass("shown") ){
            $("#sidebar-box").animate({"left":"-200px"});
            $(this).find(".glyphicon").removeClass("glyphicon-menu-left");
            $(this).find(".glyphicon").addClass("glyphicon-menu-right");    
            $("#sidebar-box").removeClass("shown");
        }else{
            $("#sidebar-box").animate({"left":"0"});
            $("#sidebar-box").addClass("shown");
            $(this).find(".glyphicon").removeClass("glyphicon-menu-right");
            $(this).find(".glyphicon").addClass("glyphicon-menu-left");             
        }
    });
});