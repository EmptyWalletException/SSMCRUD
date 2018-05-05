package com.kingguanzhang.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.kingguanzhang.crud.bean.Employee;

/**
 * 用于测试能否从数据库中完成分页查询;
 * @author Administrator
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml","classpath:springMVC.xml"})
public class MVCTest {
	
//	传入springMVC的ioc;
	@Autowired
	WebApplicationContext context;
	
//	创建一个虚假的Mvc用于测试;
	MockMvc mockMvc;
	
//	@Autowired
//	EmployeeMapper employeeMapper;
	
	/**
	 * 用于测试完整的MVC功能;
	 */
	@Before
	public void initMokcMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void TestMvc() throws Exception {
//		模拟页面传递的请求,并得到返回值;
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
//		假设此时请求成给,则请求域中会有pageInfo,取出来看一下即可;
		MockHttpServletRequest request = result.getRequest();
		 Object pageInfo = request.getAttribute("pageInfo");
		 System.out.println(pageInfo.toString());
//		
//		List<Employee> list = pageInfo.getList();
//		for(Employee emp:list) {
//			System.out.println(emp.getEmpName()+"||"+emp.getEmpGender());
//		}
	}
	
	/**
	 * 用于测试后台能否取出数据;
	 */
//	@Test
//	public void testController() {
//		System.out.println(employeeMapper);
//		PageHelper.startPage(1, 5);
//		List<Employee> list = employeeMapper.selectByExampleWithDept(null);
//		System.out.println(list.toString());
//		PageInfo pageInfo = new PageInfo(list,5);
//		
//		
//		System.out.println(pageInfo.toString());
//	}
}
