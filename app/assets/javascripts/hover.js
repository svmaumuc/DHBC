jQuery.fn.load_hover = function(){
    $('#play').hover(
        function(){
            $(this).prop('src',"/assets/play2.png");},
        function(){
            $(this).prop('src',"/assets/play1.png");});
    $('#sound').hover(
        function(){
            $(this).prop('src',"/assets/sound2.png");},
        function(){
            $(this).prop('src',"/assets/sound1.png");});
    $('#help').hover(
        function(){
            $(this).prop('src',"/assets/help2.png");},
        function(){
            $(this).prop('src',"/assets/help1.png");});
    $('#top').hover(
        function(){
            $(this).prop('src',"/assets/top2.png");},
        function(){
            $(this).prop('src',"/assets/top1.png");});
};

$(function(){
    $(".content").load_hover();
});

