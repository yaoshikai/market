<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/func.js"></script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',href:'${pageContext.request.contextPath}/Back/top.jsp',height:100"></div>
<div data-options="region:'center',href:'${pageContext.request.contextPath}/Back/center.jsp'"></div>
<div data-options="region:'west',href:'${pageContext.request.contextPath}/Back/left.jsp',width:150"></div>
</body>
</html>