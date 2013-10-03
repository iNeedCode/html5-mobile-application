// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require moment
//= require twitter/bootstrap
//= require bootstrap-wysihtml5/b3
//= require_tree .



// ------- Snap js Function
$(document).ready(function() {
    var snapper = new Snap({
        element: document.getElementById('content'),
        disable: 'right'
    });

    var addEvent = function addEvent(element, eventName, func) {
    if (element.addEventListener) {
        return element.addEventListener(eventName, func, false);
    } else if (element.attachEvent) {
        return element.attachEvent("on" + eventName, func);
    }
    };

    addEvent(document.getElementById('open-left'), 'click', function(){
        snapper.open('left');
    });

});

// wysihtml5

// $('#wysihtml5-textarea').wysihtml5({
//     "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
//     "emphasis": true, //Italics, bold, etc. Default true
//     "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
//     "html": false, //Button which allows you to edit the generated HTML. Default false
//     "link": true, //Button to insert a link. Default true
//     "image": true, //Button to insert an image. Default true,
//     "color": false //Button to change color of font  
// });
// $('#wysihtml5-textarea').val();
