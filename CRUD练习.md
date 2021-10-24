# 环境搭建



```xml
增删改查的URL地址；       
/资源名/资源标识
/emp/1          GET：查询id为1的员工
/emp/1          PUT：更新id为1的员工
/emp/1          DELETE：删除id为1的员工
/emp             POST：新增员工；
/emps           GET：查询所有员工
```



# 员工显示

## 流程

1. 显示表格
2. 请求数据
3. 查询到数据后，生成表格

# 员工添加

## 流程

1. 表格
2. 点击添加按钮
3. 跳转页面：显示表单
   1. 使用SpringMVC中的表单方法
4. 添加数据
5. 点击保存
6. 发送请求
7. 执行Controler中的添加方法
   1. 执行业务层
   2. 执行dao层
8. 跳转页面



## 遇到的问题

```xml
<mvc:default-servlet-handler/>
<mvc:annotation-driven></mvc:annotation-driven>

必须放在 Beans的前面，不然就无效并且报错。目前不知道什么原因
```




# 员工修改

## 流程

1. 点击表格中的Edit按钮
2. 跳转至修改页面
3. 输入信息
4. 点击提交（put 方法  ）
5. 设置Model，提取出id
6. 跳转至修改方法





# 员工删除

## 流程

1. 显示employee页面
2. 点击删除按钮
3. 发送delete方法是请求，需要在另外地方做from标签，
   1. 先在里面坐
4. Controller能执行删除请求
5. 返回employee页面