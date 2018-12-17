<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type="text/javascript">
    $(function () {
        $("#leftTree").tree({
            url: "${pageContext.request.contextPath}/Back/left-json.jsp",
            lines: true,
            onClick: function (node) {
                /* 判断是不是叶子节点 */
                if ($("#leftTree").tree("isLeaf", node.target)) {
                    /* 判断该选项卡是否已经存在 */
                    if ($("#centerTabs").tabs("exists", node.text)) {
                        $("#centerTabs").tabs("select", node.text);
                    } else {
                        $("#centerTabs").tabs("add", {
                            title: node.text,
                            href: node.mypath,
                            closable: true,
                            fit: true
                        });
                    }
                }
            }
        });
    });
</script>


<ul id="leftTree"></ul>