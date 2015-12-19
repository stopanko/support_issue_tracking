$(document).ready(function(){
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
