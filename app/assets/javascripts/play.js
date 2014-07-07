/**
 * Created by Demon on 7/5/14.
 */

jQuery.fn.load_effect = function() {
    $( ".boxtext").show( "explode", 500 );
    $( "#hinh" ).delay(500).show( "clip", 1000);
    $( ".option" ).delay(1500).show( "drop", 500 );

    $("#top").click(
        function()
        {
            //$( "#hinh" ).hide( "clip", 1000 );
            //$( ".boxtext" ).hide( "explode", 1000 );
            $( "#topScore" ).show( "clip", 800 );
            $( "#TextTop" ).delay(400).show("drop",500 );
        });

    $(document).click(
        function(e) {
            if(e.target.id != 'topScore' && e.target.id == '')
            {
               // $( "#hinh" ).show( "clip", 1000 );
                //$( ".boxtext" ).show( "explode", 1000 );
                $( "#TextTop" ).hide();
                $( "#topScore" ).hide( "clip", 1000 );

            }
        });
    $( ".topScore" ).draggable();
};

$(function(){
    $(".content").load_effect();
    $(".imgTitle").show("scale",700);
    $(".imgPlay").delay(800).show("clip",700);
});
