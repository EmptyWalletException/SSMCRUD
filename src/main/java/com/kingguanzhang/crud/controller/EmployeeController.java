package com.kingguanzhang.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kingguanzhang.crud.bean.Employee;
import com.kingguanzhang.crud.bean.Msg;
import com.kingguanzhang.crud.service.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	/**此方法不推荐使用,使用下面getEmpsWithJson的方法
	 * 查询所有的员工,带上关联的部门,并采用分页查询;
	 * 参数中pn用于传递分页开始页码,model用于将数据返回给页面视图层;
	 * @return
	 */
//	@RequestMapping("/emps")
//	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
////		使用分页插件官方推荐的第二种方式开启分页查询;
//		PageHelper.startPage(pn, 5);
////		然后紧跟的查询就是分页查询;
//		List<Employee> emps = employeeService.getAll();
////		查询之后使用PageInfo来包装,方便在页面视图中处理页码,下面用的构造器第二个参数是页面底部可供点击的连续页码数;
//		PageInfo page = new PageInfo(emps,5);
//	
//		model.addAttribute("pageInfo", page);
//		return "list";
//	}
	
	/**
	 * 查询所有的员工,带上关联的部门,并采用分页查询,最终以json的方式发送给前端;
	 * 此方法与上一个方法返回值是不同的,注意这个区别;
	 * 参数中pn用于传递分页开始页码,model用于将数据返回给页面视图层;
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
//		使用分页插件官方推荐的第二种方式开启分页查询;
		PageHelper.startPage(pn, 5);
//		然后紧跟的查询就是分页查询;
		List<Employee> emps = employeeService.getAll();
//		查询之后使用PageInfo来包装,方便在页面视图中处理页码,下面用的构造器第二个参数是页面底部可供点击的连续页码数;
		PageInfo page = new PageInfo(emps,5);
		return Msg.success().add("pageInfo", page);
	}
}
