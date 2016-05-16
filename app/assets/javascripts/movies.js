$(document).ready(function() {
    $(".show-more").click(function(e) {
        var id = $(this).data('id');
        $("#movie-details-" + id).toggle('fast')
    })
});