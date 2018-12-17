<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<style type="text/css">
    #cart {
        float: right
    }
</style>
<script type="text/javascript">
    $(function () {
        /* 初始化类别下拉列表 */
        $("#categoryCombobox").combobox({
            url: "${pageContext.request.contextPath}/category/queryAllCategory",
            valueField: "categoryId",
            textField: "categoryName",
            editable: false,
            onLoadSuccess: function (data) {
                /* 设置默认值 */
                $("#categoryCombobox").combobox("setValue", data[0].categoryId);
                /* 为页面数据刷新数据 */
                $("#showProductDatagrid").datagrid("reload", "${pageContext.request.contextPath}/product/queryAllProductByCategoryId?categoryId=" + data[0].categoryId);
            },
            onChange: function (newValue, oldValue) {
                /* 为页面数据刷新数据 */
                $("#showProductDatagrid").datagrid("reload", "${pageContext.request.contextPath}/product/queryAllProductByCategoryId?categoryId=" + newValue);
            }
        });


        $("#showProductDatagrid").datagrid({
            fitColumns: true,
            striped: true,
            singleSelect: true,
            columns: [[
                {title: "商品名字", field: "productName", width: 1, align: "center"},
                {title: "商品图片", field: "picPath", formatter: myPic, align: "center"},
                {title: "价格", field: "price", formatter: myPrice, width: 1, align: "center"},
                {title: "描述", field: "pdescribe", width: 1, align: "center"},
                {title: "净含量", field: "content", width: 1, align: "center"},
                {title: "是否正品", field: "isQuality", formatter: isQuality, width: 1, align: "center"},
                {title: "品牌", field: "brand", width: 1, align: "center"},
                {title: "销量", field: "saleCount", width: 1, align: "center"},
                {title: "上架时间", field: "saleTime", width: 1, align: "center"},
                {title: "加入购物车", field: "ccc", formatter: buyCar, width: 1, align: "center"}
            ]]
        });


        /* 初始化查看购物车按钮 */
        $("#lookCartBtn").linkbutton({
            text: "查看购物车",
            plain: true,
            onClick: function () {
                location.href = "${pageContext.request.contextPath}/cart/Cart.jsp";
            }
        });
    });


    function myPic(value, row, index) {
        return "<img width='95px' height='65px' src='" + value + "'/>";
    }

    function isQuality(value, row, index) {
        if (value == 1) return "是";
        if (value == 0) return "否";
    }

    function myPrice(value, row, index) {
        return value + " 元";
    }

    function buyCar(value, row, index) {
        return "<a class='l-btn' onclick='lookProduct(" + row.productId + ")'>查看详情</a>&nbsp;<a class='l-btn' onclick='buyProduct(" + row.productId + ")'>加入购物车</a>";
    }

    /* 加入购物车 */
    function buyProduct(id) {
        $.post("${pageContext.request.contextPath}/cart/buyProduct", "productId=" + id, function () {
            $.messager.show({
                title: "系统提示",
                msg: "添加购物车成功！",
                showType: "show",
                width: 300,
                height: 200
            });
        });
    }
</script>


商品类别：<input id="categoryCombobox"/>
<div id="cart">
    <a id="lookCartBtn"></a>
</div>
<br/>
<hr/>
<table id="showProductDatagrid"></table>

