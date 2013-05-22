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
//= require flat-ui
//= require_tree .





$(document).ready(function() {


    // ---- Snap js Function
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


    // ---- height alignment for the snap js and for the hiding of the address bar
    $(".snap-content").height(screen.height);
    $(".snap-drawers").height(screen.height  + 65);

});




