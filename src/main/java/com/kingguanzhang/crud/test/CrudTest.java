package com.kingguanzhang.crud.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kingguanzhang.crud.bean.Department;
import com.kingguanzhang.crud.dao.DepartmentMapper;

public class CrudTest {

	public static void main(String[] args) {
		CrudTest crudText = new CrudTest();
		 crudText.testCrud();

	}
	
	public void testCrud() {
		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		DepartmentMapper departmentMapper = ioc.getBean(DepartmentMapper.class);
		System.out.println(departmentMapper);
		departmentMapper.insertSelective(new Department(null,"财务部"));
		departmentMapper.insertSelective(new Department(null,"采购部"));
		departmentMapper.insertSelective(new Department(null,"制造部"));
		departmentMapper.insertSelective(new Department(null,"销售部"));
	}
}
