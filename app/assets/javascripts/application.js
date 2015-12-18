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
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){

    //TODO ticket comments inf_scroll
    if($('#ticket_comments_element').length != 0) {
        $.can_load_ticket_comments = true;
        var waypoint = new Waypoint({
            element: $('#ticket_comments_element'),
            handler: function (direction) {
                if ($.can_load_ticket_comments == true && direction == "down") {
                    $.can_load_ticket_comments = false;
                    setTimeout(function () {
                        $.ajax({
                            url: $('#get_next_ticket_comments').val(),
                            data: {
                                comments_count: $(".ticket_comments .comment_line").length
                            },
                            type: "GET"
                        });
                        //console.log("album photos scroll");
                    }, 1000);
                }

            },
            offset: 'bottom-in-view'
        })
    }



    //TODO ticket history inf_scroll
    if($('#ticket_history_element').length != 0) {
        $.can_load_ticket_history = true;
        var waypoint = new Waypoint({
            element: $('#ticket_history_element'),
            handler: function (direction) {
                if ($.can_load_ticket_history == true && direction == "down") {
                    $.can_load_ticket_history = false;
                    setTimeout(function () {
                        $.ajax({
                            url: $('#get_next_ticket_history').val(),
                            data: {
                                history_count: $(".ticket_history .history_line").length
                            },
                            type: "GET"
                        });
                        //console.log("album photos scroll");
                    }, 1000);
                }

            },
            offset: 'bottom-in-view'
        })
    }

});