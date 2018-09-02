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
// = require rails-ujs
// = require turbolinks
// = require_tree .
// = require jquery
// = require bootstrap-datepicker
/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
var expanded = false;
var onSearch = false;

var KEYCODE_ESC = 27;
function toggleSideBar() {
  if(!expanded){
    expandSideBar();
  }else{
    contractSideBar();
  }
}

function toggleSearchBar() {
  if(!onSearch && expanded){
    contractSideBar();
    expandSearchBar();
  }else if(onSearch != true ){
    expandSearchBar();
  }else{
    contractSearchBar();
  }
}





$(document).ready(function(){
  contractSideBar();
  contractSearchBar();
});

$(window).resize(function() {
  if ($(this).width() < 990) {
    contractSideBar();
  }
});

function expandSideBar(){
  document.getElementById("side-bar").style.width = "250px";
  document.getElementById("elements-list-container").style.left = "250px";
  document.getElementById("float-but").style.left = "80px";
  document.getElementById("float-but").style.background = "none";
  document.getElementById("float-but").style.boxShadow = "none";
  expanded = true;
}

function contractSideBar(){
  document.getElementById("side-bar").style.width = "0";
  document.getElementById("elements-list-container").style.left = "0";
  document.getElementById("float-but").style.left = "92%";
  document.getElementById("float-but").style.background = "#e74c3c";
  document.getElementById("float-but").style.boxShadow = "0 5px 11px 0 rgba(0,0,0,.18), 0 4px 15px 0 rgba(0,0,0,.15)";
  expanded = false;
}

function expandSearchBar(){
  document.getElementById("sb-move-div").style.transform =  "scale3d(0.7,0.7,1)";
  document.getElementById("bg-search").style.display = "block";
  document.getElementById("float-but").style.display = "none";
  document.getElementById("bg-search").style.opacity = "0.9";
  document.getElementById("q_name_cont").focus();
  onSearch = true;
}

function contractSearchBar(){
  document.getElementById("sb-move-div").style.transform =  "scale3d(1,1,1)";
  document.getElementById("float-but").style.display = "block";
  document.getElementById("bottom-search").style.width = "0px";
  document.getElementById("bg-search").style.display = "none";
  onSearch = false;
}

function expandBottom(){
    document.getElementById("bottom-search").style.width = "100%";
}

$('.datepicker').datepicker();
$('.datepicker').datepicker({
  format: 'mm/dd/yyyy',
  startDate: '-3d'
});

$(document).keyup(function(e) {
  if (e.keyCode == KEYCODE_ESC) contractSearchBar();
});


function initDate(){
alert("adfzxgcn");

}
function changeValue(){
// alert("DONE");
document.getElementById("date-change-form").submit();

}
