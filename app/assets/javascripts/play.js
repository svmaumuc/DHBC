/**
 * Created by Demon on 7/5/14.
 */

// Hàm load_effect và sự kien click top
jQuery.fn.load_effect = function() {
    // show khung trả lời, khung hình, các option(âm thanh, help, top )
    $( ".boxtext").show( "explode", 500 );
    $( "#hinh" ).delay(500).show( "clip", 1000);
    $( ".option" ).delay(1500).show( "drop", 500 );

    // event lick top
    $("#top").click(
        function(){
            $( ".topScore" ).show( "clip", 600 );
        });

    //event lick ra ngoai topScore
    $(document).click(
        function(e) {
            if(e.target.id != 'topScore' && e.target.id == ''){
                $( ".topScore" ).hide( "clip", 600 );
            }
        });

    //kéo thả topScore
    $( ".topScore" ).draggable();
};


$(function(){
    //load hàm load_effect
    $(".content").load_effect();

    //Show imgTitle và nút play
    $(".imgTitle").show("scale",700);
    $(".imgPlay").delay(800).show("clip",700);
});
