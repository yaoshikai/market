<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<script type="text/javascript">
    $(function () {
        /* 初始化添加类别提交按钮 */
        $("#addCategorySubmitBtn").linkbutton({
            text: "提交",
            iconCls: "icon-add",
            plain: true,
            onClick: function () {
                /* 提交表单 */
                $("#addCategoryForm").form("submit", {
                    url: "${pageContext.request.contextPath}/category/addCategory",
                    onSubmit: function () {
                        return $("#addCategoryForm").form("validate");
                    },
                    success: function () {
                        /* 刷新页面 */
                        $("#showAllCategoryTable").datagrid("load");
                        /* 关闭对话框 */
                        $("#addCategoryDialog").dialog("close");
                        /* 消息提示 */
                        $.messager.show({
                            title: "系统提示",
                            msg: "添加类别成功!",
                            showType: "show",
                            width: 300,
                            height: 200
                        });
                    }
                });
            }
        });


        /* 初始化添加类别返回按钮 */
        $("#addCategoryBackBtn").linkbutton({
            text: "返回上级",
            iconCls: "icon-back",
            plain: true,
            onClick: function () {
                /* 关闭对话框 */
                $("#addCategoryDialog").dialog("close");
            }
        });

        /* 初始化名称输入框 */
        $("#categoryNameInput").textbox({
            required: true
        });
    });
</script>


<form id="addCategoryForm" method="post">
    类别名称：<input id="categoryNameInput" name="categoryName"/><br/>
    <a id="addCategorySubmitBtn"></a>
    <a id="addCategoryBackBtn"></a>
</form>