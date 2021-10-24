<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Grimes
  Date: 2021/10/24
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工修改</title>
</head>
<body>
<%

%>
<h1>员工修改</h1>
<form:form aciton="/" method="post" modelAttribute="emp" >
    <input type="hidden" name="_method" value="put">
    <input type="hidden" name="id" value="${emp.id}">
    Email:<form:input path="email" /> <br/>
    Gender:&nbsp;&nbsp;
    男:<form:radiobutton path="gender" value="1"/> &nbsp;&nbsp;
    女:<form:radiobutton path="gender" value="0"/> <br/>
    Department:
    <form:select path="department.id" items="${deps }" itemLabel="departmentName" itemValue="id">

    </form:select><br/>
    <input type="submit" value="保存">
</form:form>
</body>
</html>
