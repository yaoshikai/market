$(function () {
    $.extend($.fn.validatebox.defaults.rules, {
        isLength: {
            validator: function (value, args) {
                return value.length == args[0];
            },
            message: "必须是{0}位!"
        },
        isNum: {
            validator: function (value) {
                return !isNaN(value);
            },
            message: "必须是数字!"
        }
    });
    $.fn.validatebox.defaults.rules.remote.message = "用户名已存在!";
});