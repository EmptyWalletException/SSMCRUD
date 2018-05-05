package com.kingguanzhang.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kingguanzhang.crud.bean.Employee;
import com.kingguanzhang.crud.dao.DepartmentMapper;
import com.kingguanzhang.crud.dao.EmployeeMapper;
/**
 * 在测试类上加上注解@RunWith(用来驱动测试的单元类)
 * 再加上注解@ContextConfiguration(locations={"spring配置文件的位置"})
 * 然后再利用@AutoWired将要测试的类自动注入
 * @author Administrator
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testCrud(){
		//测试插入部门
	//	System.out.println(departmentMapper);
	//	departmentMapper.insertSelective(new Department(null,"人事部"));
	//	departmentMapper.insertSelective(new Department(null,"开发部"));
		
		//测试插入员工
	//	System.out.println(employeeMapper);
	//	employeeMapper.insertSelective(new Employee(null,"刘备", "1000001@shu.com", "M", 1,
	//			null));
		
		//测试批量插入
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<1000;i++) {
			String uuid = UUID.randomUUID().toString().substring(0, 6)+i;
			String sex = (i%3==0)?"M":"W";
			mapper.insertSelective(new Employee(null, uuid, uuid+"@3Kindon.com", sex, 1 , null));
		}
		
	}
}
