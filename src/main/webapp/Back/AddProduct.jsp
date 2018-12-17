<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<script type="text/javascript">
    $(function () {
        $("#categorySelect").combobox({
            url: "${pageContext.request.contextPath}/category/queryAllCategory",
            valueField: "categoryId",
            textField: "categoryName",
            editable: false,
            onLoadSuccess: function (data) {
                $("#categorySelect").combobox("setValue", data[0].categoryId);
            }
        });

        /* 初始化添加提交按钮 */
        $("#addProductSubmitBtn").linkbutton({
            text: "提交",
            iconCls: "icon-add",
            plain: true,
            onClick: function () {
                /* 提交表单 */
                $("#addProductForm").form("submit", {
                    url: "${pageContext.request.contextPath}/product/addProduct",
                    onSubmit: function () {
                        return $("#addProductForm").form("validate");
                    },
                    success: function () {
                        /* 刷新页面 */
                        $("#showProductDatagrid").datagrid("load");
                        /* 关闭对话框 */
                        $("#addProductDialog").dialog("close");
                        /* 消息提示 */
                        $.messager.show({
                            title: "系统提示",
                            msg: "添加商品成功!",
                            showType: "show",
                            width: 300,
                            height: 200
                        });
                    }
                });
            }
        });


        /* 初始化添加商品返回按钮 */
        $("#addProductBackBtn").linkbutton({
            text: "返回上级",
            iconCls: "icon-back",
            plain: true,
            onClick: function () {
                /* 关闭对话框 */
                $("#addProductDialog").dialog("close");
            }
        });


        /* 初始化名称输入框 */
        $("#productNameInput").textbox({
            required: true
        });
        /* 初始化价格输入框 */
        $("#productPriceInput").textbox({
            required: true,
            validType: "isNum"
        });
        /* 初始化描述输入框 */
        $("#productDescribeInput").textbox({
            required: true
        });
        /* 初始化净含量输入框 */
        $("#productContentInput").textbox({
            required: true
        });
        /* 初始化品牌输入框 */
        $("#productBrandInput").textbox({
            required: true
        });

    });
</script>


<form id="addProductForm" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>商品名称：</td>
            <td><input id="productNameInput" name="productName"/><br/></td>
        </tr>
        <tr>
            <td>商品价格：</td>
            <td><input id="productPriceInput" name="price"/><br/></td>
        </tr>
        <tr>
            <td>商品描述：</td>
            <td><input id="productDescribeInput" name="pdescribe"/><br/></td>
        </tr>
        <tr>
            <td>净含量：</td>
            <td><input id="productContentInput" name="content"/><br/></td>
        </tr>
        <tr>
            <td>是否正品：</td>
            <td><input type="radio" name="isQuality" value="1"/>是&nbsp;<input type="radio" name="isQuality" value="0"/>否<br/>
            </td>
        </tr>
        <tr>
            <td>商品品牌：</td>
            <td><input id="productBrandInput" name="brand"/><br/></td>
        </tr>
        <tr>
            <td>选择类别：</td>
            <td><input id="categorySelect" name="category.categoryId"/></td>
        </tr>
        <tr>
            <td>选择图片：</td>
            <td><input type="file" name="pfile"/></td>
        </tr>
    </table>
    <a id="addProductSubmitBtn"></a>
    <a id="addProductBackBtn"></a>
</form>