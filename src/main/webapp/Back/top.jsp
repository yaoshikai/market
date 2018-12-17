<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">


</script>


<h1 style="color:red;font-size: 250%" align="center"><b>百知购物后台管理系统V1.0</b></h1>
<c:if test="${!empty sessionScope.user}">
	<span style="float:right;font-size: 150%">
		欢迎您(管理员)：${sessionScope.user.username}
		<a href="javascript:void(0)" onclick="exit()">安全退出</a>
	</span>
</c:if>
<c:if test="${empty sessionScope.user}">
	<span style="float:right;font-size: 150%">
		<a href="javascript:void(0)" onclick="location.href='${pageContext.request.contextPath}/ManagerView/Login.jsp'">登录</a>&nbsp;|&nbsp;
		<a href="javascript:void(0)"
           onclick="location.href='${pageContext.request.contextPath}/ManagerView/Regist.jsp'">注册</a>
	</span>
</c:if>