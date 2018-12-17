<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>登录</title>
    <style>
        body {
            text-align: center
        }

        #dd {
            margin: 0 auto;
            border: 1px solid #fff;
            width: 400px;
            height: 600px
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
        $(function () {
            /* 初始化登录按钮 */
            $("#loginSubmitBtn").linkbutton({
                text: "登录",
                plain: true,
                onClick: function () {
                    /* 提交表单 */
                    $("#loginForm").form("submit", {
                        url: "${pageContext.request.contextPath}/user/login",
                        obSubmit: function () {
                            return $("#loginForm").form("validate");
                        },
                        success: function (result) {
                            if (result == "1") {
                                /* 跳转到后台 */
                                location.href = "${pageContext.request.contextPath}/Back/ManageMessage.jsp";
                            } else if (result == "0") {
                                /* 跳转到前台 */
                                location.href = "${pageContext.request.contextPath}/view/SuperMarket.jsp";
                            } else {
                                $("#errorMsg").text(result);
                            }
                        }
                    });
                }
            });
            /* 初始化注册按钮 */
            $("#registBtn").linkbutton({
                text: "注册",
                plain: true,
                onClick: function () {
                    location.href = "${pageContext.request.contextPath}/ManagerView/Regist.jsp";
                }
            });

        });


        function changeImage() {
            $("#image").prop("src", "${pageContext.request.contextPath}/image/createValidateImage?time=" + new Date());
        }

    </script>
</head>

<body>

<h1>用户登陆</h1>

<div id="dd">
    <form id="loginForm" method="post">
        <table border="0">
            <tr>
                <td>
                    用户名:<input id="username" name="username"/>
                </td>
            </tr>
            <tr>
                <td>
                    密&nbsp;码:<input type="password" id="password" name="password"/>
                </td>
            </tr>
            <tr>
                <td>
                    验证码:<input id="validateCode" name="validateCode" size="3" maxlength="4">
                    <img id="image" src="${pageContext.request.contextPath}/image/createValidateImage"
                         onclick="changeImage()"/>
                    <a href="javascript:void(0)" onclick="changeImage()">看不清楚？换个图片</a>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <a id="loginSubmitBtn"></a>
                    <a id="registBtn"></a>
                </td>
            </tr>
        </table>
        <span id="errorMsg" style="color:red"></span>
    </form>
</div>

</body>
</html>
