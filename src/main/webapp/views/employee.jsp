<%--
  Created by IntelliJ IDEA.
  User: Grimes
  Date: 2021/10/23
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<head>Employee</head>
<%
    pageContext.setAttribute("ctp",request.getContextPath());
%>
<script src="${ctp}/scripts/jquery-1.9.1.min.js"></script>
<body>
<h1>员工列表</h1>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>id</th>
        <th>lastName</th>
        <th>email</th>
        <th>gender</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${emps}" var="emp"  >
        <tr>
            <td>${emp.id }</td>
            <td>${emp.lastName}</td>
            <td>${emp.email }</td>
            <td>${emp.gender==0?"女":"男" }</td>
            <td>${emp.department.departmentName }</td>
            <td><a href="${ctp }/emp/${emp.id }">edit</a></td>
            <td><a href="${ctp }/emp/${emp.id }" class="delBtn">delete</a></td>
        </tr>

    </c:forEach>

    <form  id="deleteForm" method="post" >
        <input type="hidden" name="_method" value="DELETE"/>
    </form>
    <script type="text/javascript">
        $(function (){
            $(".delBtn").click(function (){

                $("#deleteForm").attr("action",this.href);

                $("#deleteForm").submit();
                return false;
            });
        })
    </script>


</table>

<a href="/toaddpage">添加员工</a>

</body>
</html>
