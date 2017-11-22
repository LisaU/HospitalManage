package com.cjj.service.personnelmanage;

import java.util.List;

import com.cjj.core.common.BaseService;
import com.cjj.po.Employee;
import com.cjj.vo.EmployeeVo;

public interface EmployeeService extends BaseService<Employee, Integer>{
	/**
	 * 登录
	 * @param t
	 * @return
	 */
	public EmployeeVo login(Employee t);
	
	/**
	 * 根据员工编号查询员工
	 * @param employeecode
	 * @return
	 */
	public Employee findByEpCode(String employeecode);
	
	/**
	 * 查询角色为门诊医生的可挂号科室的医生
	 * @return
	 */
	public List<EmployeeVo> findIsRegister();
    
    /**
     * 查询角色为挂号员的挂号人员
     * @return
     */
	public List<Employee> findRegisterP();
    
    /**
     * 查询角色为收费员的收费人员
     * @return
     */
	public List<Employee> findChargeP();
	
	/**
	 * 根据id查询员工
	 * @param id
	 * @return
	 */
	public EmployeeVo findUser(int id);
	
	/**
	 * 根据id与密码查询员工
	 * @param t
	 * @return
	 */
	public EmployeeVo findPsw(Employee t);
	
	/**
	 * 根据科室id查询员工
	 * @param id
	 * @return
	 */
	public List<EmployeeVo> findByDepartmentId(int id);
	
	/**
	 * 分页模糊查询员工
	 * @param contant
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<EmployeeVo> vagueFind(String contant,int currentpage, int pagesize);
}
