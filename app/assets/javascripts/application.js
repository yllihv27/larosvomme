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
//= require jquery
//= require jquery_ujs
//= require jquery.easy-autocomplete
//= require popper
//= require chosen-jquery
//= require bootstrap
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery.turbolinks
//= require activestorage
//= require aos
//= require ckeditor/init
//= require init_ckeditor
//= require cocoon
//= require global
//= require_tree .



function myFunction(id) {
  var x = document.getElementById(id);
  $(x).slideToggle();
  if (x.style.display === "block") {
    (x.style.display).slideUp() = "none";
  } else {
    x.style.display = "block";
  }
}

function replaceword(that, word, oword) {
    that.textContent = that.textContent == word ? oword : word;
}


$(document).on('turbolinks:load', function(){
	$(".chosen-select").chosen();
	allow_single_deselect: true
    no_results_text: 'No results matched';
});
