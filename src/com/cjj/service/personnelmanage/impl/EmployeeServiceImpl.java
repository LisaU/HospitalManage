package com.cjj.service.personnelmanage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.personnelmanage.EmployeeMapper;
import com.cjj.po.Employee;
import com.cjj.service.personnelmanage.EmployeeService;
import com.cjj.vo.EmployeeVo;

@Transactional
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;

	@Override
	public EmployeeVo login(Employee t) {
		return employeeMapper.login(t);
	}

	@Override
	public Employee findByEpCode(String employeecode) {
		return employeeMapper.findByEpCode(employeecode);
	}

	@Override
	public List<EmployeeVo> findIsRegister() {
		return employeeMapper.findIsRegister();
	}

	@Override
	public List<Employee> findRegisterP() {
		return employeeMapper.findRegisterP();
	}

	@Override
	public List<Employee> findChargeP() {
		return employeeMapper.findChargeP();
	}

	@Override
	public EmployeeVo findUser(int id) {
		return employeeMapper.findUser(id);
	}

	@Override
	public EmployeeVo findPsw(Employee t) {
		return employeeMapper.findPsw(t);
	}

	@Override
	public int add(Employee t) {
		return employeeMapper.insert(t);
	}

	@Override
	public Employee findById(int id) {
		return employeeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int edit(Employee t) {
		return employeeMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public List<EmployeeVo> findByDepartmentId(int id) {
		return employeeMapper.findByDepartmentId(id);
	}

	@Override
	public List<EmployeeVo> vagueFind(String contant, int currentpage,
			int pagesize) {
		return employeeMapper.vagueFind(contant, currentpage, pagesize);
	}

	@Override
	public int delete(int id) {
		return employeeMapper.delete(id);
	}

	@Override
	public List<Employee> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
