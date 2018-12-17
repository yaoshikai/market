<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
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
            $("#Back").linkbutton({
                text: "返回首页",
                iconCls: "icon-back",
                plain: true,
                onClick: function () {
                    location.href = "${pageContext.request.contextPath}/view/SuperMarket.jsp";
                }
            });
        });
    </script>
</head>

<body>
<div id="dd">
    <span style="font-size: 300%">购买成功</span>
    <table>
        <tr>
            <td>订单ID：</td>
            <td>${sessionScope.order.orderId}</td>
        </tr>
        <tr>
            <td>订单总价：</td>
            <td>${sessionScope.order.totalPrice}&nbsp;元</td>
        </tr>
        <tr>
            <td>收货人：</td>
            <td>${sessionScope.order.address.reciveName}</td>
        </tr>
        <tr>
            <td>收货地址：</td>
            <td>${sessionScope.order.address.addressDetail}</td>
        </tr>
    </table>
    <a id="Back"></a>
</div>
</body>

</html>