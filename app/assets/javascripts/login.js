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

