package com.kingguanzhang.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kingguanzhang.crud.bean.Employee;
import com.kingguanzhang.crud.bean.EmployeeExample;
import com.kingguanzhang.crud.bean.EmployeeExample.Criteria;
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

	/**
	 * 保存员工的方法;
	 * @param employee
	 */
	public void save(Employee employee) {
		 employeeMapper.insertSelective(employee);
	}

	/**
	 * 检查此用户名是否从未使用过,返回true表示可以使用,返回false表示不能使用;
	 * @param employee
	 * @return
	 */
	public boolean checkEmp(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return 0 == count;
		
	}
	
	/**
	 * 通过ID查出员工的详细信息;
	 * @param empId
	 * @return
	 */
	public Employee getEmp(Integer empId) {
		Employee employee = employeeMapper.selectByPrimaryKeyWithDept(empId);
		return employee;
	}

	/**
	 * 修改员工
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		long i = employeeMapper.updateByPrimaryKey(employee);
	}

	/**
	 * 删除员工
	 * @param empId
	 */
	public void deleteEmp(String empId) {
		int id = Integer.parseInt(empId);
		long i = employeeMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 批量删除员工
	 * @param example
	 */
	public void deleteEmps(List<Integer> listIds) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(listIds);
		int i = employeeMapper.deleteByExample(example);
	}

}
