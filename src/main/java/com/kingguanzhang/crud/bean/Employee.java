package com.kingguanzhang.crud.bean;

import javax.validation.constraints.Pattern;

import org.junit.runners.Parameterized.Parameter;

public class Employee {
    private Integer empId;
    
//    使用正则表达式校验员工名字字符是否合法;
    @Pattern(regexp="(^[a-z0-9_-]{2,10}$)|(^[\\u2E80-\\u9FFF]{2,10})",message="用户名格式不正确,请输入2~10位字符,只能出现数字或英文或汉字的组合!")
    private String empName;

    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message="邮箱格式不正确")
    private String empEmail;

    private String empGender;

    private Integer empDeptId;
    
    private Department department;
    
    

    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail == null ? null : empEmail.trim();
    }

    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender == null ? null : empGender.trim();
    }

    public Integer getEmpDeptId() {
        return empDeptId;
    }

    public void setEmpDeptId(Integer empDeptId) {
        this.empDeptId = empDeptId;
    }

	public Employee(Integer empId, String empName, String empEmail, String empGender, Integer empDeptId,
			Department department) {
		this.empId = empId;
		this.empName = empName;
		this.empEmail = empEmail;
		this.empGender = empGender;
		this.empDeptId = empDeptId;
		this.department = department;
	}

	public Employee() {
	}
    
    
}