<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Grimes
  Date: 2021/10/23
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加员工</title>
</head>
<%
    pageContext.setAttribute("ctp", request.getContextPath());
%>
<body>
<h1>添加员工页面</h1>
<%--@elvariable id="employee" type="com.sy.springmvc.bean.employee"--%>
<form:form action="/emp" modelAttribute="employee" method="POST">
    LastName:    <form:input path="lastName"/><br/>
    Email:    <form:input path="email"/><br/>
    Gender:<br/>
        男：<form:radiobutton path="gender" value="1"/>
        女：<form:radiobutton path="gender" value="0"/> <br/>
    Department:
    <form:select path="department.id"
                 items="${depts }"
                 itemLabel="departmentName"
                 itemValue="id"></form:select><br/>
    <input type="submit" value="保存">
</form:form>
</body>
</html>
