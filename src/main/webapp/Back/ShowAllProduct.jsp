<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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
                {title: "操作", field: "Operator", formatter: myOperator, width: 1, align: "center"}
            ]]
        });


        /* 初始化添加按钮 */
        $("#addProductBtn").linkbutton({
            text: "添加商品",
            iconCls: "icon-add",
            plain: true,
            onClick: function () {
                /* 弹对话框 */
                $("#addProductDialog").dialog("open");
            }
        });

        /* 初始化添加对话框 */
        /* 初始化添加班级对话框 */
        $("#addProductDialog").dialog({
            title: "添加商品",
            cache: false,
            closed: true,
            modal: true,
            border: "thin",
            collapsible: true,
            minimizable: true,
            maximizable: true,
            resizable: true,
            width: 350,
            height: 270,
            href: "${pageContext.request.contextPath}/Back/AddProduct.jsp"
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

    function myOperator(value, row, index) {
        return "<a class='l-btn' onclick='lookProduct(" + row.productId + ")'>查看详情</a>&nbsp;<a class='l-btn' onclick='deleteProduct(" + row.productId + ")'>删除</a>&nbsp;<a class='l-btn' onclick='updateProduct(" + row.productId + ")'>修改</a>";
    }


</script>


商品类别：<input id="categoryCombobox"/>
<table id="showProductDatagrid"></table>
<a id="addProductBtn"></a>
<div id="addProductDialog"></div>