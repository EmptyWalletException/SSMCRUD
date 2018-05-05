package com.kingguanzhang.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kingguanzhang.crud.bean.Employee;
import com.kingguanzhang.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	/**
	 * 查询所有的员工,带上关联的部门,并采用分页查询;
	 * @return
	 */
	public List<Employee> getAll(){
		
		List<Employee> list = employeeMapper.selectByExampleWithDept(null);
		return list;
	}
}
