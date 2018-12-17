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
            /* 初始化购物车展示表格 */
            $("#showOrderTable").datagrid({
                url: "${pageContext.request.contextPath}/cart/queryCart",
                fitColumns: true,
                striped: true,
                singleSelect: true,
                columns: [[
                    {title: "商品名字", field: "productName", formatter: myProductName, width: 1, align: "center"},
                    {title: "商品图片", field: "picPath", formatter: myPic, align: "center"},
                    {title: "价格", field: "price", formatter: myPrice, width: 1, align: "center"},
                    {title: "数量", field: "count", formatter: myCount, width: 1, align: "center"},
                    {title: "小计", field: "sumPrice", formatter: mySumPrice, width: 1, align: "center"}
                ]]
            });


            $("#SubmitOrderBtn").linkbutton({
                text: "填写地址",
                iconCls: "icon-ok",
                plain: true,
                onClick: function () {
                    /* 跳转到填写地址页面 */
                    location.href = "${pageContext.request.contextPath}/address/Address.jsp";
                }
            });


            $("#BackOrderBtn").linkbutton({
                text: "返回购物车",
                iconCls: "icon-back",
                plain: true,
                onClick: function () {
                    location.href = "${pageContext.request.contextPath}/cart/Cart.jsp";
                }
            });

        });

        function myProductName(value, row, index) {
            return row.product.productName;
        }

        function myPic(value, row, index) {
            return "<img width='95px' height='65px' src='" + row.product.picPath + "'/>";
        }

        function myPrice(value, row, index) {
            return row.product.price + "元";
        }

        function myCount(value, row, index) {
            return row.count + "个";
        }

        function mySumPrice(value, row, index) {
            return row.price + "元";
        }
    </script>
</head>

<body>
<div id="dd">
    <span style="font-size: 300%">订单提交</span>
    <table id="showOrderTable"></table>
    <span style="float:left">总价:${sessionScope.totalPrice}元</span>
    <a style="float:right" id="SubmitOrderBtn"></a>
    <a style="float:right" id="BackOrderBtn"></a>
</div>
</body>

</html>