package com.kingguanzhang.crud.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	/**
	 * 查询单个员工的信息;
	 * @return
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmpWithJson(@PathVariable(value="empId")Integer empId) {
		Employee emp = employeeService.getEmp(empId);
		return Msg.success().add("emp", emp);
	}
	
	/**
	 * 新增用户;
	 * @Valid注解表示封装Employee数据时使用JSR303进行数据的正则校验;
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emps",method=RequestMethod.POST)
	@ResponseBody
	public Msg save(@Valid Employee employee,BindingResult result) {
//		判断数据是否能通过正则校验
		if(result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			Map<String,Object> map = new HashMap<String, Object>();
			for(FieldError fieldError:errors) {
//				将所有的错误信息遍历后放入map中返回给前端;
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("fieldMsg", map);
		}else {
			employeeService.save(employee);
			return Msg.success();
		}
	}
	
	/**
	 * 校验用户名是否不重复;
	 * @param employee
	 * @return 
	 */
	@RequestMapping(value="/checkEmp",method=RequestMethod.POST)
	@ResponseBody
	public Msg checkEmp(@RequestParam("empName")String employee) {
//		在ajax请求数据库之前,应该在后台模仿一下前端输入框的校验逻辑,才能让双重校验达到更加好的配合;
		String regName = "(^[a-z0-9_-]{2,10}$)|(^[\\u2E80-\\u9FFF]{2,10})";
		if(!employee.matches(regName)) {
			return Msg.fail().add("validateMsg", "用户名格式不正确,请输入2~10位字符,只能出现数字或英文或汉字的组合!");
		}
		
		boolean bool = employeeService.checkEmp(employee);
		if(true == bool){
			return Msg.success().add("validateMsg", "用户名可以使用");
		}else {
			return Msg.fail().add("validateMsg", "用户名已经被别人抢先占用");
		}
	}
	
	/**
	 * 更新用户;
	 * @Valid注解表示封装Employee数据时使用JSR303进行数据的正则校验;
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(@Valid Employee employee,BindingResult result) {
//		判断数据是否能通过正则校验
		if(result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			Map<String,Object> map = new HashMap<String, Object>();
			for(FieldError fieldError:errors) {
//				将所有的错误信息遍历后放入map中返回给前端;
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("fieldMsg", map);
		}else {
//			真正的更新方法只有这一行
			employeeService.updateEmp(employee);
			return Msg.success();
		}
	}
}
