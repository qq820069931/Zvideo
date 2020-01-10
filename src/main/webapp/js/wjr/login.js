
    $(document).ready(function() {

        $("input[name=uaccount]").blur(function() {
            var account = $("input[name=uaccount]").val();

            $.ajax({
                type: "post",
                url: "${path}/user/checkuser.action",
                async: true, //是否异步
                dataType: "json",
                data: {
                    "account": account
                },
                success: function(data) {

                    if(data.statu == 'error') {
                        $(".uaccount-checkmsg").html(data.message);
                    } else {
                        $(".uaccount-checkmsg").html("");
                    }

                }
            });
        });

    });

function checklogin(loginform) {
    var passwordval = $(loginform).find("input[name=upassword]").val();
    var telval = $(loginform).find("input[name=uaccount]").val();
    if(telval.trim().length == 0) {

        $(".uaccount-checkmsg").html("手机号不能为空");

        return false;
    } else {
        $(".uaccount-checkmsg").html("");
    }

    if(!(/^1[3456789]\d{9}$/.test(telval))) {
        $(".uaccount-checkmsg").html("手机号码有误，请重填");
        return false;
    } else {
        $(".uaccount-checkmsg").html("");
    }

    if(passwordval.trim().length == 0) {

        $(".upassword-checkmsg").html("密码不能为空");

        return false;
    } else {
        $(".upassword-checkmsg").html("");
    }

    return true;
}

function checkreg(regform) {
    var telval = $(regform).find("input[name=uaccount]").val();
    var usernameval = $(regform).find("input[name=uname]").val();
    var nicknameval = $(regform).find("input[name=unname]").val();
    var passwordval = $(regform).find("input[name=upassword]").val();
    var emailval = $(regform).find("input[name=uemail]").val();

    if(telval.trim().length == 0) {

        $(".uaccount-checkmsg").html("手机号不能为空");

        return false;
    } else {
        $(".uaccount-checkmsg").html("");
    }

    if(!(/^1[3456789]\d{9}$/.test(telval))) {
        $(".uaccount-checkmsg").html("手机号码有误，请重填");
        return false;
    } else {
        $(".uaccount-checkmsg").html("");
    }

    if(usernameval.trim().length == 0) {

        $(".uname-checkmsg").html("姓名不能为空");

        return false;
    } else {
        $(".uname-checkmsg").html("");
    }

    if(nicknameval.trim().length == 0) {

        //打印信息
        $(".unname-checkmsg").html("昵称不能为空");

        return false;
    } else {
        $(".unname-checkmsg").html("");
    }

    if(passwordval.trim().length == 0) {

        $(".upassword-checkmsg").html("密码不能为空");

        return false;
    } else {
        $(".upassword-checkmsg").html("");
    }

    if(passwordval.trim().length < 6 || passwordval.trim().length > 12) {

        $(".upassword-checkmsg").html("密码长度须在6到12位之间");

        return false;
    } else {
        $(".upassword-checkmsg").html("");
    }

    if(emailval.trim().length == 0) {

        $(".uemail-checkmsg").html("邮箱不能为空");

        return false;
    } else {
        $(".uemail-checkmsg").html("");
    }

    if(!(/^[a-zA-Z][\\w\\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\\w\\.-]*[a-zA-Z0-9]\\.[a-zA-Z][a-ZA-Z\\.]*[a-zA-Z]$/.test(emailval))) {
        $(".uemail-checkmsg").html("邮箱有误，请重填");
        return false;
    } else {
        $(".uemail-checkmsg").html("");
    }

    return true;
}
