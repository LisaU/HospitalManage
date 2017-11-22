package com.cjj.dao.personnelmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cjj.po.Employee;
import com.cjj.vo.EmployeeVo;

public interface EmployeeMapper {    
    /**
     * 员工登录
     * @param record
     * @return
     */
    EmployeeVo login(Employee record);
    
	/**
	 * 添加员工信息
	 * @param record
	 * @return
	 */
    int insert(Employee record);

    /**
     * 查询角色为门诊医生的可挂号科室的医生
     * @return
     */
    List<EmployeeVo> findIsRegister();
    
    /**
     * 查询角色为挂号员的挂号人员
     * @return
     */
    List<Employee> findRegisterP();
    
    /**
     * 查询角色为收费员的收费人员
     * @return
     */
    List<Employee> findChargeP();
    
    /**
     * 根据员工id查询员工信息
     * @param id
     * @return
     */
    EmployeeVo findUser(Integer id);    

    /**
     * 根据员工id与员工密码查询员工是否存在
     * @param record
     * @return
     */
    EmployeeVo findPsw(Employee record);
    
    /**
     * 根据员工编号查询员工信息
     * @param employeecode
     * @return
     */
    Employee findByEpCode(String employeecode);
    
    /**
     * 分页模糊查询员工
     * @param contant
     * @param currentpage
     * @param pagesize
     * @return
     */
    List<EmployeeVo> vagueFind(@Param("contant")String contant,@Param("currentpage")Integer currentpage,@Param("pagesize")Integer pagesize);
    
    /**
     * 根据科室id查询员工
     * @param id
     * @return
     */
    List<EmployeeVo> findByDepartmentId(int id);
    
    /**
     * 根据员工id查询员工信息
     * @param id
     * @return
     */
    Employee selectByPrimaryKey(Integer id);

    /**
     * 修改员工信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Employee record);
    
    /**
     * 删除员工信息
     * @param id
     * @return
     */
    int delete(Integer id);
}