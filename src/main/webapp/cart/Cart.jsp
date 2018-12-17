<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <style type="text/css">
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
            $("#showCartTable").datagrid({
                url: "${pageContext.request.contextPath}/cart/queryCart",
                fitColumns: true,
                striped: true,
                singleSelect: true,
                columns: [[
                    {title: "商品名字", field: "productName", formatter: myProductName, width: 1, align: "center"},
                    {title: "商品图片", field: "picPath", formatter: myPic, align: "center"},
                    {title: "价格", field: "price", formatter: myPrice, width: 1, align: "center"},
                    {title: "数量", field: "count", formatter: myCount, width: 1, align: "center"},
                    {title: "小计", field: "sumPrice", formatter: mySumPrice, width: 1, align: "center"},
                    {title: "操作", field: "operator", formatter: myOperator, width: 1, align: "center"}
                ]]
            });


            $("#SubmitCartBtn").linkbutton({
                text: "提交订单",
                iconCls: "icon-ok",
                plain: true,
                onClick: function () {
                    /* 跳转到确认订单页面 */
                    location.href = "${pageContext.request.contextPath}/cart/Order.jsp";
                }
            });


            $("#BackCartBtn").linkbutton({
                text: "返回首页",
                iconCls: "icon-back",
                plain: true,
                onClick: function () {
                    location.href = "${pageContext.request.contextPath}/view/SuperMarket.jsp";
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

        function myOperator(value, row, index) {
            return "<a class='l-btn' onclick='dele(" + row.product.productId + ")'>删除商品</a>";
        }

        function dele(id) {
            $.post("${pageContext.request.contextPath}/cart/deleteCart", "productId=" + id, function (result) {
                /* 重新加载购物车 */
                $("#showCartTable").datagrid("reload");
                $.messager.show({
                    title: "系统提示",
                    msg: "删除商品成功！",
                    showType: "show",
                    width: 300,
                    height: 200
                });
                $("#totalPrice").text("总价：" + result + "元");
            });
        }
    </script>
</head>

<body>
<div id="dd">
    <span style="font-size: 300%">购物车</span>
    <table id="showCartTable"></table>
    <span id="totalPrice" style="float:left">总价:${sessionScope.totalPrice}元</span>
    <a style="float:right" id="SubmitCartBtn"></a>
    <a style="float:right" id="BackCartBtn"></a>
</div>
</body>

</html>