<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<html>
<head>
    <title>注册</title>
    <style>
        body {
            text-align: center
        }

        #dd {
            margin: 0 auto;
            border: 1px solid #fff;
            width: 340px;
            height: 600px
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/func.js"></script>

    <script type="text/javascript">
        $(function () {
            /* 初始化提交按钮 */
            $("#registSubmitBtn").linkbutton({
                text: "提交",
                plain: true,
                onClick: function () {
                    /* 提交表单 */
                    $("#registForm").form("submit", {
                        url: "${pageContext.request.contextPath}/user/registUser",
                        onSubmit: function () {
                            return $("#registForm").form("validate");
                        },
                        success: function () {
                            $.messager.show({
                                title: "系统提示",
                                msg: "注册成功!",
                                showType: "show",
                                width: 300,
                                height: 200
                            });
                            $("#registForm").form("reset");
                        }
                    });
                }
            });

            /* 初始化重置按钮 */
            $("#registResetBtn").linkbutton({
                text: "重置",
                plain: true,
                onClick: function () {
                    $("#registForm").form("reset");
                }
            });

            /* 初始化登录按钮 */
            $("#registLoginBtn").linkbutton({
                text: "前往登录",
                plain: true,
                onClick: function () {
                    location.href = "${pageContext.request.contextPath}/ManagerView/Login.jsp";
                }
            });

            /* 初始化用户名框 */
            $("#username").textbox({
                type: "text",
                required: true,
                validType: {
                    remote: ["${pageContext.request.contextPath}/user/queryOneUserByUserName", "username"]
                }
            });
            /* 初始化密码框 */
            $("#password").textbox({
                type: "password",
                required: true,
                validType: "isLength[6]"
            });
        });
        var username = $("#username").val();
    </script>

</head>

<body>
<h1>用户注册</h1>

<div id="dd">
    <form id="registForm" method="post">
        <table border="0">
            <tr>
                <td>
                    用户名:<input id="username" name="username"/>
                </td>
            </tr>
            <tr>
                <td>
                    密&nbsp;码:<input id="password" name="password"/>
                </td>
            </tr>
            <tr>
                <td>
                    类&nbsp;型:<input type="radio" name="type" value="1"/>管理员
                    <input type="radio" name="type" value="0"/>普通用户
                </td>
            </tr>
            <tr>
                <td align="center">
                    <a id="registSubmitBtn"></a>
                    <a id="registResetBtn"></a>
                    <a id="registLoginBtn"></a>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
