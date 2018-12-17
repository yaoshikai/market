<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
    $(function () {
        $("#showAllCategoryTable").datagrid({
            fitColumns: true,
            striped: true,
            url: "${pageContext.request.contextPath}/category/queryAllCategory",
            singleSelect: true,
            columns: [[
                {title: "类别ID", field: "categoryId", align: "center"},
                {title: "类别名称", field: "categoryName", width: 1, align: "center"}
            ]]
        });

        /* 初始化添加类别按钮 */
        $("#addCategoryBtn").linkbutton({
            text: "添加类别",
            iconCls: "icon-add",
            plain: true,
            onClick: function () {
                $("#addCategoryDialog").dialog("open");
            }
        });

        /* 初始化添加类别对话框 */
        $("#addCategoryDialog").dialog({
            title: "添加类别",
            cache: false,
            closed: true,
            modal: true,
            border: "thin",
            collapsible: true,
            minimizable: true,
            maximizable: true,
            resizable: true,
            width: 350,
            height: 230,
            href: "${pageContext.request.contextPath}/Back/AddCategory.jsp"
        });

    });

</script>

<table id="showAllCategoryTable"></table>
<a id="addCategoryBtn"></a>
<div id="addCategoryDialog"></div>
