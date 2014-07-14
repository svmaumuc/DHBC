/**
 * Created by Demon on 7/5/14.
 */

//hàm kiem tra , gắn kết quả vào thẻ input #answer khi chọn hết ô chữ và submit
function checkSubmit(numBox)
{
    answer = "";
    $(".listBoxtext").children(".boxtext").each(function(){
        if(typeof $(this).attr('id')!== "undefined")
        {
            answer+= $(this).attr('id');
            $("#answer").val(answer);
            if(answer.length == numBox)
            {
                $("#reanswer").submit();
               //alert(answer);
            }
        }
    });
}

// hàm sử lý sự kiện chọn và bỏ chọn chữ
jQuery.fn.load_event = function(){

    // sự kiện click chọn từng chữ
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
                        checkSubmit(numBox);
                        return false;
                    }
                });
            }
        });

    // sự kiện click bỏ chọn chữ
    $(".boxtext").click(
        function()
        {
            ide =  $(this).attr("id");  //lấy id của ô kết quả khi click
            boxtex = $(this);
            if (typeof ide !== "undefined")                         // kiểm tra id có tồn tại ko, nếu tộn tại thì tiếp
            {
                $(".listword").children("#"+ide).each(function(){   // duyệt tất cả ô trong dsach từ chọn có id giống Id của ô kết quả
                    if($(this).find("p").size() == 0)               // kiem tra ô đó có chữ ko
                    {
                        $(this).append("<p>"+ide+"</p>");           // thêm chữ vào ô đó
                        boxtex.attr("id",null);                     // gắn ID null cho ô kết quả
                        boxtex.children("p").remove();              // xóa chữ trong ô kết quả
                        return false;
                    }
                });
            }
        });
};

$(function(){
    //load hàm load_event
    $(".content").load_event();
});