 出现这个错误可能会有两种情况

 1.用form select标签为例，在书写JSP时，有时笔误可能会写成<form:select path="departmet" items="departments" itemLabel="departmentName" itemValue="id"></form:select>

这种写法是错误的，应该是

<form:select path="departmet" items="${departments }" itemLabel="departmentName" itemValue="id"></form:select>


2.JSP页面中没有设置<%@ page isELIgnored="false" %>
————————————————
版权声明：本文为CSDN博主「dududexiaowo」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/dududexiaowo/article/details/51605264