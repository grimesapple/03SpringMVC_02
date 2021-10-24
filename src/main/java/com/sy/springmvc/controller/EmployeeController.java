package com.sy.springmvc.controller;


import com.sy.springmvc.bean.Department;
import com.sy.springmvc.bean.Employee;
import com.sy.springmvc.dao.DepartmentDao;
import com.sy.springmvc.dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;

/**
 * D
 *
 * @author Grimes
 */

@Controller
public class EmployeeController {

    @Autowired
    EmployeeDao employeeDao;

    @Autowired
    DepartmentDao departmentDao;

    /**
     * 查询所有员工
     *
     * @param model
     * @return
     */
    @RequestMapping("/emps")
    public String select(Model model) {
        Collection<Employee> employees = employeeDao.getAll();
        model.addAttribute("emps", employees);
        System.out.println("获取员工列表成功！");
        return "employee";
    }

    /**
     * 添加员工
     *
     * @param employee
     * @return
     */
    @RequestMapping("/emp")
    public String save(Employee employee) {
        employeeDao.save(employee);
        System.out.println("添加成功");
        System.out.println(employee);
        return "redirect:/emps";
    }

    /**
     * 更新员工
     *
     * @param employee
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.PUT)
    public String update(Employee employee, @PathVariable("id") Integer id) {
        System.out.println("前端传过来的Employee=" + employee);
        employeeDao.save(employee);
        return "redirect:/emps";


    }

    /**
     * 删除员工
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}" , method = RequestMethod.DELETE)
    public String deleteEmp(@PathVariable("id")Integer id) {
        employeeDao.delete(id);
        return "redirect:/emps";
    }

    @ModelAttribute
    public void myModelAttribute(
            @RequestParam(value = "id", required = false) Integer id, Model model) {
        //先判断id是否存在
        if (id != null) {
            Employee employee = employeeDao.get(id);
            model.addAttribute("employee", employee);
        }

    }


    /**
     * 先查询员工，再跳转页面（服务与修改页面）
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    public String getEmp(@PathVariable("id") Integer id, Model model) {

        //查询员工
        Employee employee = employeeDao.get(id);
        System.out.println(employee);
        model.addAttribute("emp", employee);

        //查询单位
        Collection<Department> departments = departmentDao.getDepartments();
        model.addAttribute("deps", departments);
        return "edit";
    }


    /**
     * 跳转添加页面的时候，进行配置
     *
     * @param model
     * @return
     */
    @RequestMapping("/toaddpage")
    public String topage(Model model) {
        Collection<Department> departments = departmentDao.getDepartments();
        model.addAttribute("depts", departments);
        model.addAttribute("employee", new Employee());
        return "add";
    }


}
