<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/29
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="http://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/js/dist/sweetalert.css" rel="stylesheet">
</head>
<script>
</script>
<body>
<%@include file="../include/adminNavbar.jsp"%>
<!--header-bar end-->
<div class="container-fluid" style="margin-top:20px">
    <table class="table">
        <thead>
        <tr>
            <th>账号</th>
            <th>注册时间</th>
            <th>最后登录时间</th>
            <th>最后登录IP</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.items}" var="userVo">
            <tr>
                <td>${userVo.username}</td>
                <td>${userVo.createtime}</td>
                <td>${userVo.lastLoginTime}</td>
                <td>${userVo.loginIP}</td>
                <td>
                    <a href="javascript:;" class="update" onClick="update(${userVo.userId},${userVo.userState})"
                       rel="${userVo.userState},${userVo.userId}">${userVo.userState == '1'?'禁用':'恢复'}</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination pagination-mini pagination-centered">
        <ul id="pagination" style="margin-bottom:20px;"></ul>
    </div>
</div>
<!--container end-->
<script src="/static/js/jquery-1.11.1.js"></script>
<script src="/static/js/jquery.twbsPagination.min.js"></script>
<script src="/static/js/dist/sweetalert.min.js"></script>
<script>
    $(function(){
        $("#pagination").twbsPagination({
            totalPages:${page.totalPage},
            visiblePages:5,
            first:'首页',
            last:'末页',
            prev:'上一页',
            next:'下一页',
            href: '?p={{number}}&_=3'
        });


    });

    function update(userid,userState){
        $.post("/admin/user",{"userid":userid,"userState":userState},function(json){
            if(json.state=='success'){
                swal({title:"修改成功!"},function () {
                    window.history.go(0);
                });
            }else{
                alert(json.message)
            }
        });
    }
</script>

</body>
</html>

