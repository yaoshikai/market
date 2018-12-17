<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <style>
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

            $("#SubmitOrderBtn").linkbutton({
                text: "确认提交",
                iconCls: "icon-ok",
                plain: true,
                onClick: function () {
                    /* 提交表单  */
                    $("#addAddressForm").form("submit", {
                        url: "${pageContext.request.contextPath}/order/saveAddressAndOrder",
                        onSubmit: function () {
                            return $("#addAddressForm").form("validate");
                        },
                        success: function (res) {
                            location.href = "${pageContext.request.contextPath}/cart/SuccessOrder.jsp";
                        }
                    });
                }
            });

            $("#BackOrderBtn").linkbutton({
                text: "返回订单",
                iconCls: "icon-back",
                plain: true,
                onClick: function () {
                    location.href = "${pageContext.request.contextPath}/cart/Order.jsp";
                }
            });


            $("#addressName").textbox({
                required: true
            });

            $("#addressDetail").textbox({
                required: true
            });

            $("#reciveName").textbox({
                required: true
            });

            $("#phone").textbox({
                required: true
            });

        });
    </script>
</head>

<body>
<div id="dd">
    <span style="font-size: 300%">地址填写</span>
    <form id="addAddressForm" method="post">
        <table align="center">
            <tr>
                <td>
                    地址名称:
                </td>
                <td>
                    <input id="addressName" nam4
                           e="addressName"/>
                </td>
            </tr>
            <tr>
                <td>
                    详细地址:
                </td>
                <td>
                    <input id="addressDetail" name="addressDetail"/>
                </td>
            </tr>
            <tr>
                <td>
                    收货人姓名:
                </td>
                <td>
                    <input id="reciveName" name="reciveName"/>
                </td>
            </tr>
            <tr>
                <td>
                    联系方式:
                </td>
                <td>
                    <input id="phone" name="phone"/>
                </td>
            </tr>
        </table>
    </form>
    <a id="SubmitOrderBtn"></a>
    <a id="BackOrderBtn"></a>
</div>
</body>

</html>