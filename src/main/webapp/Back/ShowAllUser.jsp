<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<script type="text/javascript">
    $(function () {
        $("#showUserDatagrid").datagrid({
            title: "所有用户",
            url: "${pageContext.request.contextPath}/user/queryAllUser",
            fitColumns: true,
            striped: true,
            singleSelect: true,
            columns: [[
                {title: "用户ID", field: "userId", width: 1, align: "center"},
                {title: "用户名", field: "username", width: 1, align: "center"},
                {title: "是否是管理员", field: "type", formatter: isManager, width: 1, align: "center"}
            ]]
        });


    });

    function isManager(value, row, index) {
        if (value == 1) return "是";
        if (value == 0) return "否";
    }
</script>


<table id="showUserDatagrid"></table>
