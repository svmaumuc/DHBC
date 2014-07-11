/**
 * Created by Bui Van Kim on 7/10/2014.
 */
// Nhóm hàm xử lý validate Form Login

function validateLogin(){

    var username = document.getElementById('post_username');
    var password = document.getElementById('post_password');

    if(username.value.length == 0){

        username.focus();
        return false;
    }else if(password.value.length == 0){
        password.focus();
        return false;
    }
    return true;
}

$('#abc').click(function () {

    alert('abc');

});


// Sử lý sự kiện khung đăng ký
function showRegister(){

        if ($('.k_register').is(':hidden')) {
            $( ".k_register" ).show('slide', {direction: 'left'}, 1000);
        } else {
            $( ".k_register" ).hide('slide', {direction: 'left'}, 1000);
        }
}

// Xử lý validator Đăng ký
function validatorRegister(){
    var username = document.getElementById('register_username');
    var email = document.getElementById('register_email');
    var password1 = document.getElementById('register_password1');
    var password2 = document.getElementById('register_password2');

    if(username.value.length == 0){

        username.focus();
        return false;
    }else if(email.value.length == 0){
        email.focus();
        return false;
    }
    else if(password1.value.length == 0){
        password1.focus();
        return false;
    }else if(password2.value.length == 0){
        password2.focus();
        return false;
    }
    else if(password1.value != password2.value){
        password2.focus();
        return false;
    }

    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
        email.focus();
        return false;
    }

    return true;
}