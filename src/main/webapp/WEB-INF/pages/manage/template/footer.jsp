<%--
  Created by IntelliJ IDEA.
  User: Erubsh
  Date: 2018/12/25
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function back(){
        window.history.go(-1)
    }

    function logout() {
        $.ajax({
            type: 'POST',
            url: "/screenos/user/logout",
            data: {
            },
            dataType: 'json',
            success: function (json) {
                if (json.status == 0) {
                    layer.msg(json.result, {icon: 6});
                    window.location.href="/screenos/index";
                } else {
                    layer.alert(json.result, {icon: 5});
                }
            }
        });
    }
</script>
</body>
</html>
