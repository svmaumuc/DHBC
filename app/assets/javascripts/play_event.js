/**
 * Created by Demon on 7/5/14.
 */
function checkSubmit()
{
    answer = "";
    $(".listBoxtext").children(".boxtext").each(function(){
        if(typeof $(this).attr('id')!== "undefined")
        {
            answer+= $(this).attr('id');
            $("#answer").val(answer);
            if(answer.length == numBox)
            {
                $("#answer").parent("form").submit();
                //alert("Ko chinh xac");
            }
        }
    });
}

jQuery.fn.load_event = function(){
    $(".word").click(
        function()
        {
            //alert($(this).attr("id"));
            word = $(this).find("p");
            text = $(this).attr("id");
            numBox = $(".listBoxtext").children(".boxtext").size();

            if(word.size()!=0){
                $(".listBoxtext").find(".boxtext").each(function(){
                    id = $(this).attr("id");
                    if (typeof id === "undefined")
                    {
                        $(this).append("<p>"+text+"</p>");
                        $(this).attr('id',text);
                        word.remove();
                        checkSubmit();
                        return false;
                    }
                });
            }
        });

    $(".boxtext").click(
        function()
        {
            ide =  $(this).attr("id");
            boxtex = $(this);
            if (typeof ide !== "undefined")
            {
                $(".listword").children("#"+ide).each(function(){
                    if($(this).find("p").size() == 0)
                    {
                        $(this).append("<p>"+ide+"</p>");
                        boxtex.attr("id",null);
                        boxtex.children("p").remove();
                        return false;
                    }
                });
            }
        });
};

$(function(){
    $(".content").load_event();
});