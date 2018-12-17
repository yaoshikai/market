<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<script type="text/javascript">
    $(function () {
        $("#showOrderDatagrid").datagrid({
            title: "所有订单",
            url: "${pageContext.request.contextPath}/order/queryAllOrder",
            fitColumns: true,
            striped: true,
            singleSelect: true,
            columns: [[
                {title: "订单ID", field: "orderId", align: "center"},
                {title: "订单总价", field: "totalPrice", align: "center"},
                {title: "收件人", field: "address", formatter: myReciveName, width: 1, align: "center"},
                {title: "收货地址", field: "addresss", formatter: myDetail, width: 1, align: "center"},
                {title: "用户", field: "user", formatter: myUsername, width: 1, align: "center"}
            ]]
        });
    });

    function myReciveName(value, row, index) {
        return value.reciveName;
    }

    function myDetail(value, row, index) {
        return row.address.addressDetail;
    }

    function myUsername(value, row, index) {
        return value.username;
    }

</script>


<table id="showOrderDatagrid"></table>
